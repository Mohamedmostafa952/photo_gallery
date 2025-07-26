import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:photo_gallery/core/connectivity_service/connectivity_service.dart';
import 'package:photo_gallery/core/di/di.dart';
import 'package:photo_gallery/core/resources/assets_manager.dart';
import 'package:photo_gallery/core/resources/colors_manager.dart';
import 'package:photo_gallery/features/home/presentation/cubit/photos_states.dart';
import 'package:photo_gallery/features/home/presentation/cubit/photos_view_model.dart';
import 'package:photo_gallery/features/home/presentation/provider/theme_provider.dart';
import 'package:photo_gallery/features/home/presentation/widgets/image_item_widget.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late ThemeProvider themeProvider;

  PhotosViewModel viewModel = getIt<PhotosViewModel>();

  late ScrollController _scrollController;

  late ConnectivityService _connectivityService;
  bool _isOnline = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.loadPhotos();
    _scrollController = ScrollController()..addListener(_onScroll);

    _connectivityService = ConnectivityService();
    _connectivityService.connectivityStream.listen((connected) {
      setState(() {
        _isOnline = connected;
      });
    });
    _connectivityService.checkInitialConnection().then((connected) {
      setState(() {
        _isOnline = connected;
      });
    });
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      viewModel.loadMorePhotos();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _connectivityService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: REdgeInsets.symmetric(horizontal: 16.0),
          child: BlocProvider.value(
            value: viewModel,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      themeProvider.isDark
                          ? AppImages.routeLogoDark
                          : AppImages.routeLogo,
                      width: 150.w,
                      height: 150.h,
                    ),
                    Switch(
                      value: themeProvider.currentTheme == ThemeMode.dark,
                      onChanged: (value) {
                        themeProvider.changeAppTheme(
                          value ? ThemeMode.dark : ThemeMode.light,
                        );
                      },
                      activeThumbImage: AssetImage(AppIcons.dark),
                      inactiveThumbImage: AssetImage(AppIcons.light),
                      activeColor: ColorsManager.white,
                      inactiveTrackColor: ColorsManager.blue,
                    ),
                  ],
                ),
                Center(
                  child: Text(
                    _isOnline ? "You're Online " : "Offline Mode ",
                    style:  Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                SizedBox(height: 12.h,),
                BlocBuilder<PhotosViewModel, PhotosStates>(
                  builder: (context, state) {
                    if (state is PhotosLoadingState) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (state is PhotosErrorState) {
                      return Center(child: Text(state.errorMessage));
                    }
                    if (state is PhotosSuccessState) {
                      return Expanded(
                        child: MasonryGridView.count(
                          crossAxisCount: 2,
                          mainAxisSpacing: 12,
                          crossAxisSpacing: 12,
                          itemCount:
                              state.photos.length +
                              (viewModel.isLoadingMore ? 1 : 0),
                          controller: _scrollController,
                          itemBuilder: (context, index) {
                            if (index == state.photos.length) {
                              return const Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            }
                            return ImageItemWidget(photo: state.photos[index]);
                          },
                        ),
                      );
                    }
                    return SizedBox();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

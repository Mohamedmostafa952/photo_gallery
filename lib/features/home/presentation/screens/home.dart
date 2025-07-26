import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photo_gallery/core/resources/assets_manager.dart';
import 'package:photo_gallery/core/resources/colors_manager.dart';
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

  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: REdgeInsets.symmetric(horizontal: 16.0),
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

              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12
                  ),
                  itemCount: 20,
                  itemBuilder: (context, index) => ImageItemWidget(img: "assets/images/test.jpeg"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppException implements Exception{
  final String message;
  const AppException({required this.message});
}

class RemoteException extends AppException{
  RemoteException({required super.message});
}
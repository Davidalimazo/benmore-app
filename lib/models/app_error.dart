class AppError {
  final String message;
  final dynamic responseCode;
  const AppError({required this.message, required this.responseCode});
}

enum AppErrorType { api, network }

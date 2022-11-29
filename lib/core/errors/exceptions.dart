class PrimaryServerException implements Exception {
  final String message;
  final String error;
  final int code;

  PrimaryServerException({
    required this.message,
    required this.error,
    required this.code,
  });
}

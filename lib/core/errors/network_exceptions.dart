class PrimaryServerException implements Exception {
  final String error;
  final String message;
  final int code;

   PrimaryServerException({
    required this.error,
    required this.message,
    required this.code,
  });
}

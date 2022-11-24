class PrimaryServerException implements Exception {

  final String message;
  final bool status;

  PrimaryServerException({
    required this.message,
    required this.status,
  });
}

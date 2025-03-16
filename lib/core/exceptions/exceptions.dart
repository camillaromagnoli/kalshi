class Failure implements Exception {
  final String message;
  final String? details;

  Failure(this.message, [this.details]);

  @override
  String toString() {
    if (details == null) return message;
    return '$message: $details';
  }
}

class FinancialWellnessException implements Exception {
  final String message;
  final int statusCode;

  FinancialWellnessException(this.message, this.statusCode);

  @override
  String toString() => 'Error $statusCode: $message';
}

class NetworkException extends Failure {
  NetworkException([String? details]) : super("Network Error", details);
}

class ServerException extends Failure {
  ServerException([String? details]) : super("Server Error", details);
}

import 'status_request.dart';

class ApiFailure {
  final StatuesRequest status;
  final int? statusCode;
  final String? message;
  final dynamic data;

  const ApiFailure({
    required this.status,
    this.statusCode,
    this.message,
    this.data,
  });

  /// Allows controllers accessing response['message'] or response['data']
  /// to read values safely without throwing NoSuchMethodError.
  dynamic operator [](String key) {
    if (key == 'message') return message ?? '';
    if (key == 'data') return data;
    if (key == 'statusCode') return statusCode;
    if (key == 'status') return status;
    return null;
  }

  @override
  String toString() => message ?? status.name;
}

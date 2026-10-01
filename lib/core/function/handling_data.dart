import '../class/api_failure.dart';
import '../class/status_request.dart';

StatuesRequest handlingData(dynamic response) {
  if (response is ApiFailure) {
    return response.status;
  } else if (response is StatuesRequest) {
    return response;
  } else if (response is String) {
    return StatuesRequest.serverError;
  } else if (response is Map) {
    // If backend returns explicit failure flag like status: false or status: 'error'
    if (response['status'] == false ||
        response['status'] == 'error' ||
        response['status'] == 'failed') {
      return StatuesRequest.defaultException;
    }
    return StatuesRequest.success;
  } else if (response is List) {
    return StatuesRequest.success;
  } else {
    return StatuesRequest.success;
  }
}


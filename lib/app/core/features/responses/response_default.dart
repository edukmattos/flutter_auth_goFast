import '../../enums/response_status_enum.dart';

class DefaultResponse<T> {
  final T object;
  final String message;
  final ResponseStatus status;

  bool get success => status == ResponseStatus.rsSuccess;
  bool get failed => status == ResponseStatus.rsFailed;

  DefaultResponse({
    this.object,
    this.message,
    this.status,
  });
}

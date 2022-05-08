import '../exception/network_exception.dart';

abstract class DataState<T> {
  final T? data;
  final NetworkException? exception;

  const DataState({
    this.data,
    this.exception,
  });
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data);
}

class DataFailure<T> extends DataState<T> {
  const DataFailure(NetworkException exception) : super(exception: exception);
}

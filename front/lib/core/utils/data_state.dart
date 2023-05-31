
import 'package:dio/dio.dart';

abstract class DataState<T>  {
  final T ? data;
  final DioError ? error;

  DataState({this.data, this.error});
}

class DataSuccess<T> extends DataState {
  DataSuccess(T data):super(data: data);
}

class DataFailed<T> extends DataState {
  DataFailed(DioError error):super(error: error);
}
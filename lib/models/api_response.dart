import 'package:equatable/equatable.dart';

class ApiResponse<T> extends Equatable {
  late final String msg;
  late final T? data;
  late final bool isOk;
  late final int? statusCode;

  ApiResponse.success(this.data, this.statusCode) {
    msg = '';
    isOk = true;
  }

  ApiResponse.error(this.msg, this.statusCode) {
    data = null;
    isOk = false;
  }

  @override
  List<Object?> get props => [msg, data, statusCode];
}
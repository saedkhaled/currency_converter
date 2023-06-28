
import 'package:http/http.dart';

extension ResponseType on Response {
  bool get isOk => statusCode >= 200 && statusCode < 300;
}
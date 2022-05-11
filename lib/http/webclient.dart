import 'package:bytebank/http/interceptors/login_interceptors.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

final Client client = InterceptedClient.build(
  interceptors: [LoggingInterceptor()],
);

const String baseUrl = 'http://192.168.122.1:8080/transactions';

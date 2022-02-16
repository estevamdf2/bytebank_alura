import 'package:http/http.dart';
import 'package:http_interceptor/http/interceptor_contract.dart';
import 'package:http_interceptor/http_interceptor.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({RequestData? data}) async {
    print('request');
    print('url: ${data!.url}');
    print('headers: ${data.headers}');
    print('body: ${data.body}');
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData? data}) async {
    print('response');
    print('status code: ${data!.statusCode}');
    print('headers: ${data.headers}');
    print('body: ${data.body}');
    return data;
  }
}

void findAll() async {
  final http = InterceptedHttp.build(interceptors: [
    LoggingInterceptor(),
  ]);
  final Response response =
      await http.get('http://172.18.0.1:8080/transactions');
}

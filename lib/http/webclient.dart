import 'dart:convert';

import 'package:bytebank/models/contact.dart';
import 'package:bytebank/models/transaction.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
    print('request');
    print('url: ${data.url}');
    print('headers: ${data.headers}');
    print('body: ${data.body}');
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async {
    print('response');
    print('status code: ${data.statusCode}');
    print('headers: ${data.headers}');
    print('body: ${data.body}');
    return data;
  }
}

final Client client = InterceptedClient.build(
  interceptors: [LoggingInterceptor()],
);

const String baseUrl = 'http://192.168.1.7:8080/transactions';

Future<List<Transaction>> findAll() async {
  final response = await client.get(Uri.parse(baseUrl));
  final List<dynamic> decodedJson = jsonDecode(response.body);
  final List<Transaction> transactions = [];
  for (Map<String, dynamic> transactionJson in decodedJson) {
    final Map<String, dynamic> contactJson = transactionJson['contact'];
    final Transaction transaction = Transaction(transactionJson['value'],
        Contact(0, contactJson['name'], contactJson['accountNumber']));
    transactions.add(transaction);
  }
  return transactions;
}

Future<Transaction> save(Transaction transaction) async {
  Contact contact = transaction.contact;
  final Map<String, dynamic> transactionMap = {
    'value': transaction.value,
    'contact': {'name': contact.name, 'accountNumber': contact.accountNumber}
  };

  final String transactionJson = jsonEncode(transactionMap);

  final Response response = await client.post(Uri.parse(baseUrl),
      headers: {'Content-type': 'application/json', 'password': '1000'},
      body: transactionJson);

  Map<String, dynamic> transactionEnconded = jsonDecode(response.body);
  final Map<String, dynamic> contactJson = transactionEnconded['contact'];
  return Transaction(
    transactionEnconded['value'],
    Contact(0, contactJson['name'], contactJson['accountNumber']),
  );
}

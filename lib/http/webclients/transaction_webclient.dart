import 'dart:convert';

import 'package:bytebank/http/webclient.dart';
import 'package:bytebank/models/contact.dart';
import 'package:bytebank/models/transaction.dart';
import 'package:http/http.dart';

class TransactionWebClient {
  Future<List<Transaction>> findAll() async {
    final response = await client.get(Uri.parse(baseUrl));
    List<Transaction> transactions = _toTransactions(response);
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

  List<Transaction> _toTransactions(Response response) {
    final List<dynamic> decodedJson = jsonDecode(response.body);
    List<Transaction> transactions = _toMap(decodedJson);
    return transactions;
  }

  List<Transaction> _toMap(List<dynamic> decodedJson) {
    final List<Transaction> transactions = [];
    for (Map<String, dynamic> transactionJson in decodedJson) {
      final Map<String, dynamic> contactJson = transactionJson['contact'];
      final Transaction transaction = Transaction(transactionJson['value'],
          Contact(0, contactJson['name'], contactJson['accountNumber']));
      transactions.add(transaction);
    }
    return transactions;
  }
}

import 'package:bytebank/models/saldo.dart';
import 'package:bytebank/screens/dashboard/saldo_card.dart';
import 'package:bytebank/screens/contats_list.dart';
import 'package:bytebank/screens/transactions_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Dashboard'),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('images/bytebank_logo.png'),
              ),
              Container(
                height: 80,
                child: ListView(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topCenter,
                      child: SaldoCard(),
                    )
                  ],
                ),
              ),
              Consumer<Saldo>(builder: (context, saldo, child) {
                return ElevatedButton(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text('Adiciona'),
                    ),
                    onPressed: () {
                      saldo.subtrai(10);
                    });
              }),
              Container(
                height: 120,
                child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      _FeatureItem('Transfer', Icons.monetization_on,
                          onClick: () {
                        _showContactsList(context);
                      }),
                      _FeatureItem('Transaction feed', Icons.description,
                          onClick: () => _showTransactionFeed(context)),
                      _FeatureItem('Nova feature', Icons.done, onClick: () {
                        print('press New feature');
                      })
                    ]),
              ),
            ]));
  }

  void _showContactsList(BuildContext context) {
    Navigator.of(context)
        .push((MaterialPageRoute(builder: (context) => ContactsList())));
  }

  void _showTransactionFeed(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => TransactionsList(),
    ));
  }
}

class _FeatureItem extends StatelessWidget {
  final String name;
  final IconData icon;
  final Function onClick;

  _FeatureItem(
    this.name,
    this.icon, {
    @required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).primaryColor,
        child: InkWell(
          onTap: () => onClick(),
          child: Container(
            height: 100,
            width: 150,
            color: Theme.of(context).primaryColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(icon, color: Colors.white, size: 24.0),
                Text(
                  name,
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

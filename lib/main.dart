import 'package:finance_app/%20models/transaction_model.dart';
import 'package:finance_app/components/transaction_form.dart';
import 'package:finance_app/components/transaction_list.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

main() => runApp(
      const FinanceApp(),
    );

class FinanceApp extends StatelessWidget {
  const FinanceApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final _transactions = [
    Transaction(
      id: 't1',
      title: 'Novo tênis de corrida',
      value: 310.76,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't1',
      title: 'Conta de luz',
      value: 211.30,
      date: DateTime.now(),
    )
  ];
  HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: double.infinity,
            child: const Card(
              color: Colors.blue,
              child: Text('Gráfico '),
              elevation: 5,
            ),
          ),
          TransactionList(transactions: _transactions),
          TransactionForm()
        ],
      ),
    );
  }
}

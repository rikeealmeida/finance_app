import 'package:finance_app/%20models/transaction_model.dart';
import 'package:flutter/material.dart';

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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
          Column(
              children: _transactions.map((tr) {
            return Card(
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      tr.value.toString(),
                    ),
                  ),
                  Column(
                    children: [
                      Text(tr.title),
                      Text(
                        tr.date.toString(),
                      ),
                    ],
                  )
                ],
              ),
            );
          }).toList()),
        ],
      ),
    );
  }
}

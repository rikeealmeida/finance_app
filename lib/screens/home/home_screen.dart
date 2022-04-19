import 'dart:math';

import 'package:flutter/material.dart';

import '../../ models/transaction_model.dart';
import '../../components/components.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showChart = false;
  final List<Transaction> _transactions = [
    Transaction(
      date: DateTime.now(),
      id: 't1',
      title: 'Compras',
      value: 550,
    ),
    Transaction(
      date: DateTime.now().subtract(
        const Duration(days: 1),
      ),
      id: 't2',
      title: 'Compras',
      value: 390,
    ),
    Transaction(
      date: DateTime.now().subtract(
        const Duration(days: 2),
      ),
      id: 't3',
      title: 'Compras',
      value: 130,
    ),
    Transaction(
      date: DateTime.now().subtract(
        const Duration(days: 3),
      ),
      id: 't4',
      title: 'Compras',
      value: 460,
    ),
    Transaction(
      date: DateTime.now().subtract(
        const Duration(days: 4),
      ),
      id: 't5',
      title: 'Compras',
      value: 950,
    ),
    Transaction(
      date: DateTime.now().subtract(
        const Duration(days: 5),
      ),
      id: 't6',
      title: 'Compras',
      value: 50,
    ),
  ];
  List<Transaction> get _recentTransactions {
    return _transactions.where((tr) {
      return tr.date.isAfter(
        DateTime.now().subtract(
          const Duration(days: 7),
        ),
      );
    }).toList();
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return TransactionForm(
            onSubmit: _addTransaction,
          );
        });
  }

  _addTransaction(String title, double value, DateTime date) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: date,
    );

    setState(() {
      _transactions.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  _removeTransaction(String id) {
    setState(() {
      _transactions.removeWhere((tr) => tr.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    bool isLandscape = mediaQuery.orientation == Orientation.landscape;
    if (!isLandscape) _showChart = true;

    final appBar = AppBar(
      title: const Text('Despesas Pessoais'),
      actions: [
        if (isLandscape)
          IconButton(
            onPressed: () {
              setState(() {
                _showChart = !_showChart;
              });
            },
            icon: Icon(_showChart ? Icons.list : Icons.show_chart),
          ),
        IconButton(
          onPressed: () => _openTransactionFormModal(context),
          icon: const Icon(Icons.add),
        ),
      ],
    );

    final availabelHeight = mediaQuery.size.height -
        appBar.preferredSize.height -
        mediaQuery.padding.top;

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // if (isLandscape)
            //   Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Text('Exibir gráfico'),
            //       Switch(
            //         activeColor: Theme.of(context).colorScheme.secondary,
            //         value: _showChart,
            //         onChanged: (value) {
            //           setState(() {
            //             _showChart = value;
            //           });
            //         },
            //       ),
            //     ],
            //   ),
            _showChart
                ? Container(
                    height: availabelHeight * (isLandscape ? 0.6 : 0.2),
                    child: Chart(recentTransaction: _recentTransactions))
                : SizedBox(),
            Container(
              height: availabelHeight * (isLandscape ? 1 : 0.80),
              child: TransactionList(
                  transactions: _transactions, onRemove: _removeTransaction),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _openTransactionFormModal(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

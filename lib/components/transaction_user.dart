import 'dart:math';

import 'package:finance_app/components/transaction_form.dart';
import 'package:finance_app/components/transaction_list.dart';
import 'package:flutter/material.dart';

import '../ models/transaction_model.dart';

class TransactionUser extends StatefulWidget {
  const TransactionUser({Key key}) : super(key: key);

  @override
  State<TransactionUser> createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
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
    ),
    Transaction(
      id: 't1',
      title: 'Conta de luz',
      value: 211.30,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't1',
      title: 'Conta de luz',
      value: 211.30,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't1',
      title: 'Conta de luz',
      value: 211.30,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't1',
      title: 'Conta de luz',
      value: 211.30,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't1',
      title: 'Conta de luz',
      value: 211.30,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't1',
      title: 'Conta de luz',
      value: 211.30,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't1',
      title: 'Conta de luz',
      value: 211.30,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't1',
      title: 'Conta de luz',
      value: 211.30,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't1',
      title: 'Conta de luz',
      value: 211.30,
      date: DateTime.now(),
    ),
  ];

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionForm(onSubmit: _addTransaction),
        TransactionList(transactions: _transactions)
      ],
    );
  }
}

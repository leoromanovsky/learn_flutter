import 'package:flutter/material.dart';
import 'package:learn_flutter/models/transaction.dart';
import 'package:learn_flutter/widgets/new_transaction.dart';
import 'package:learn_flutter/widgets/transaction_list.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(id: '1', title: 'grocery', amount: 9.99, date: DateTime.now()),
    Transaction(id: '2', title: 'car', amount: 5.00, date: DateTime.now()),
    Transaction(id: '3', title: 'bank', amount: 7.00, date: DateTime.now())
  ];

  void _addNewTransaction(String title, double amount) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: DateTime.now());

    setState(() {
      _userTransactions.insert(0, newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransactions)
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:learn_flutter/models/transaction.dart';
import 'package:intl/intl.dart';
import 'package:learn_flutter/widgets/chart.dart';
import 'package:learn_flutter/widgets/new_transaction.dart';
import 'package:learn_flutter/widgets/transaction_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  final List<Transaction> transactions = [
    Transaction(id: '1', title: 'shoes', amount: 9.99, date: DateTime.now()),
    Transaction(
        id: '2', title: 'groceries', amount: 300.54, date: DateTime.now())
  ];

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
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

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (context) {
          return GestureDetector(
            onTap: () {},
            child: NewTransaction(_addNewTransaction),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  List<Transaction> get _recentTransactions {
    return _userTransactions
        .where((element) =>
            element.date.isAfter(DateTime.now().subtract(Duration(days: 7))))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Hello world!',
        home: Scaffold(
            appBar: AppBar(
              title: Text(
                  "Today's date: ${DateFormat('M/d/y').format(DateTime.now())}"),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.account_box),
                  onPressed: () => _startAddNewTransaction(context),
                )
              ],
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Builder(
                builder: (context) => FloatingActionButton(
                      child: Icon(Icons.add),
                      onPressed: () => _startAddNewTransaction(context),
                    )),
            body: SingleChildScrollView(
                child: Column(children: [
              Chart(_recentTransactions),
              TransactionList(_userTransactions)
            ]))));
  }
}

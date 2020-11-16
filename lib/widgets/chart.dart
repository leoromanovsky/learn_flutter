import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:learn_flutter/models/transaction.dart';
import 'package:learn_flutter/widgets/chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionsValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      final sum = recentTransactions
          .where((element) => element.date.day == weekDay.day)
          .map((e) => e.amount)
          .fold(0.0, (previousValue, element) => previousValue + element);

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': sum,
      };
    });
  }

  double get totalSpending {
    return groupedTransactionsValues.fold(
        0.0, (sum, element) => sum + element['amount']);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 6,
        margin: EdgeInsets.all(20),
        child: Row(
          children: groupedTransactionsValues.map((e) {
            return ChartBar(
                e['day'],
                e['amount'],
                totalSpending == 0.0
                    ? 0
                    : ((e['amount'] as double) / totalSpending));
          }).toList(),
        ));
  }
}

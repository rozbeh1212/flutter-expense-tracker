// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';
import 'chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;
  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupTransactionValues {
    // ignore: missing_return
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(
          days: index)); // subtract is a function that takes a duration and subtracts it from a date

      double totalSum;
      for (var i = 0; i < recentTransactions.length; i++) {
        // loop through the recent transactions and check if the date is the same as the weekDay variable above and if it is, add the amount to the totalSum variable and return it at the end of the loop
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalSum += recentTransactions[i].amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1), // format the date by substringing the first letter of the day of the week and return it as a string
        'amount': totalSum,
      };
    });
  }

  double get totalSpending {
    return groupTransactionValues.fold(0.0, (sum, item) {
      // fold is a function that takes a starting value and a function as an argument and returns a value
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(20),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupTransactionValues.map((data) {
            return Flexible(
              // Flexible is a widget that takes a widget as an argument and returns a widget that can be stretched or compressed
              fit: FlexFit.tight,
              child: ChartBar(
                data['day'],
                data['amount'],
                totalSpending == 0.0
                    ? 0.0
                    : (data['amount'] as double) / totalSpending,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

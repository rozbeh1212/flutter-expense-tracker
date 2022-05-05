// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;
  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupTransactionValues {
    // ignore: missing_return
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(
          days:
              index)); // subtract is a function that takes a duration and subtracts it from a date

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

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(20),
      child: Row(
        children:  groupTransactionValues.map((data){
           return Text('${data['day']}: ${data['amount']}');
        }).toList(),
      ),
    );
  }
}

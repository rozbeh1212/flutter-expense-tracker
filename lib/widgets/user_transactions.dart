import 'package:flutter/material.dart';

import './new_transaction.dart';
import './transaction_list.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [ //
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Weekly Groceries',
      amount: 16.53,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(newTx); // add new transaction to the list of transactions as a new element
    });
  }

  @override
  Widget build(BuildContext context) { 
    return Column(
      children: <Widget>[
        NewTransaction(_addNewTransaction), // new transaction form widget is passed as a parameter to the constructor of _UserTransactionsState class
        TransactionList(_userTransactions), // transaction list widget is passed as a parameter to the constructor of _UserTransactionsState class
      ],
    );
  }
}

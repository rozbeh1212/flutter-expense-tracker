// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction>
      transactions; // list of transactions is   passed in as a parameter to the constructor of TransactionList class

  TransactionList(this.transactions); // constructor of TransactionList class

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text('No transactions added yet',
                    style: Theme.of(context).textTheme.headline6
                    ),
                SizedBox( // SizedBox is a widget that provides a box with a specified height and width to its contents and can be used to create spaces in a layout or to separate widgets. It is a convenience widget that can be used to create vertical or horizontal spaces. 
                  height: 20,
                ),
                     Container(
                      height: 200,
                       child: Image.asset('assets/images/waiting.png',
                        height: 200,
                        fit: BoxFit.cover,
                    ),
                     ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                // ctx is the context of the widget  , index is the index of the item in the list of transactions
                return Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 15,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).primaryColor,
                            width: 2,
                          ),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          '\$${transactions[index].amount.toStringAsFixed(2)}', // toStringAsFixed(2) is used to display the amount in 2 decimal places
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            transactions[index].title,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          Text(
                            DateFormat.yMMMd().format(transactions[index].date),
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              itemCount: transactions.length, // number of transactions
            ),
    );
  }
}

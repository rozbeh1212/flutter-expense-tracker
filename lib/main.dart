// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:my_project_name/widgets/newTransAction.dart';
import 'package:my_project_name/widgets/transActionList.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',
      home: MyHomePage(),
    );
  }
}


class MyHomePage extends StatelessWidget {
  

  
  final titleController = TextEditingController(); //  text editing controller is a function that allows us to edit the text in the text field
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Flutter App',
          textAlign: TextAlign.center,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: double.infinity, // means full width of the screen (100%)
            child: Card(
              color: Colors.blue[300],
              child: Text('CHART!'),
              elevation: 5,
            ),
          ),
        
           NewTransaction(),
          TransactionList() // this function is defined in the transactionList.dart file as a list of transactions
        ],
      ),
    );
  }
}

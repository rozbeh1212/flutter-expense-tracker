
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  
  final titleController = TextEditingController(); //  text editing controller is a function that allows us to edit the text in the text field
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return   Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Title',
                    ),
                    controller: titleController, // this is the text editing controller that we created above and we are passing it here to the text field so that it can be used to edit the text in the text field 
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Amount',
                    ),
                    controller: amountController, 
                  ),
                  FlatButton(
                    child: Text('Add Transaction'),
                    textColor: Colors.purple,
                    onPressed: () {
                      
                    
                    },
                  ),
                ],
              ),
            ),
          ),
  }
}
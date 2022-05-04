// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  List<Map<String, Object>> get groupTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var totalSum = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(20),
      child: Row(
        children: <Widget>[
          Text('Chart'),
        ],
      ),
    );
  }
}

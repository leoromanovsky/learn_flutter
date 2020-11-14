import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addTx);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: <
            Widget>[
          TextField(
            decoration: InputDecoration(labelText: 'name'),
            controller: titleController,
          ),
          TextField(
            decoration: InputDecoration(labelText: 'amount'),
            controller: amountController,
          ),
          FlatButton(
            child: Text('Add'),
            textColor: Colors.purple,
            onPressed: () {
              addTx(titleController.text, double.parse(amountController.text));
            },
          )
        ]));
  }
}

import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {


  final _amountController = TextEditingController();
  final _titleController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: InputDecoration(
                label: Text('title')
            ),
          ),
          TextField(
            controller: _amountController,
           keyboardType: TextInputType.number,
            decoration: InputDecoration(
                label: Text('amount'),
              prefixText: "\$"
            ),
          ),
          Row(
            children: [

              TextButton(onPressed: (){},
                  child: Text('Cancel')),
              ElevatedButton(onPressed: (){
                print(_titleController.text);
              },
                  child: Text('Save Expense')),
              ElevatedButton(onPressed: (){
                print(_amountController.text);
              },
                  child: Text('Amount')),
            ],
          )
        ],
      ),
    );
  }
}

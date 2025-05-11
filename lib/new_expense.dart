import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {

  var _enteredTitle = '';

  void _SaveTitleInput(String inputValue){
    _enteredTitle = inputValue;
  }
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            onChanged: _SaveTitleInput,
            maxLength: 50,
            decoration: InputDecoration(
                label: Text('title')
            ),
          ),
          Row(
            children: [
              ElevatedButton(onPressed: (){
                print(_enteredTitle);
              },
                  child: Text('Save Expense'))
            ],
          )
        ],
      ),
    );
  }
}

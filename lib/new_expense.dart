import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {


  final _amountController = TextEditingController();
  final _titleController = TextEditingController();
  DateTime ? _selectedDate;

  void _presentDatePicker() async{
    final now = DateTime.now();
    final firstDate = DateTime(now.year-1, now.month, now.day);

final pickedate = await showDatePicker(context: context, firstDate: firstDate, lastDate: now);

setState(() {
  _selectedDate = pickedate;
});

  }
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
         Row(
         children: [
           Expanded(child: TextField(
             controller: _amountController,
             keyboardType: TextInputType.number,
             decoration: InputDecoration(
                 label: Text('amount'),
                 prefixText: "\$"
             ),
           )
           ),
           SizedBox(width: 15,),
           Expanded(
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.end,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               Text(_selectedDate == null ? 'No date selected' : formatter.format(_selectedDate!)),
               Text("Date"),
               IconButton(
                 onPressed: _presentDatePicker,
                 icon: Icon(Icons.calendar_month)
               ),
             ],
           ))
         ],
         ),
          Row(
            children: [

              TextButton(onPressed: (){
                Navigator.pop(context);
              },
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

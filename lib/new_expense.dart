import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {


  final _amountController = TextEditingController();
  final _titleController = TextEditingController();

  void _presentDatePicker(){
    final now = DateTime.now();
    final firstDate = DateTime(now.year-1, now.month, now.day);

showDatePicker(context: context, firstDate: firstDate, lastDate: now);
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


import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';
import 'package:expense_tracker/expense.dart';

final formatter = DateFormat.yMd();

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense });

  final void Function(Expense expense)onAddExpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {


  final _amountController = TextEditingController();
  final _titleController = TextEditingController();
  DateTime ? _selectedDate;
  Category _selectedCategory = Category.leisure;

  void _presentDatePicker() async{
    final now = DateTime.now();
    final firstDate = DateTime(now.year-1, now.month, now.day);

final pickedate = await showDatePicker(context: context, firstDate: firstDate, lastDate: now);

setState(() {
  _selectedDate = pickedate;
});
  }
  void _submitExpenseData(){
    final enteredAmount = double.tryParse(_amountController.text);
    final amountIsInvalid = enteredAmount ==null  || enteredAmount <=0;
    if (_titleController.text.isEmpty || amountIsInvalid || _selectedDate == null ){
      showDialog(context: context, builder: (ctx)=> AlertDialog(
        title: Text("Invalid Text"),
        content: Text("Please enter valid amount , title , date"),
        actions: [
          TextButton(
          onPressed: (){
            Navigator.pop(context);
          },
          child: Text("Ok"),
          ),
        ],
      )
      );
      return;
    }
    widget.onAddExpense(Expense(title: _titleController.text, amount: enteredAmount, date: _selectedDate!, category: _selectedCategory));
    Navigator.pop(context);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _titleController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.fromLTRB(16, 58, 16, 48),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween
            ,
            children: [
            DropdownButton(
              value: _selectedCategory,
                items: Category.values.map((category)=>DropdownMenuItem( value : category,
                child: Text(category.name.toUpperCase(),
                ),
                ),

            ).toList(),
                onChanged: (value){
              setState(() {
                if (value ==null){
                  return;
                }
                _selectedCategory = value;
              });
                }),

              TextButton(onPressed: (){
                Navigator.pop(context);
              },
                  child: Text('Cancel')),
              ElevatedButton(
                  onPressed:  _submitExpenseData,
                  child: Text('Save Expense')),
            ],
          )
        ],
      ),
    );
  }
}

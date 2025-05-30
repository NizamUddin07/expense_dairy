import 'package:expense_tracker/expenses_list.dart';
import 'package:expense_tracker/new_expense.dart';
import 'package:flutter/material.dart';
import 'expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});



  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense>_registeredExpense = [
    Expense(
      title : 'flutter course',
      amount: 20,
      date: DateTime.now(),
      category: Category.work
    ),
    Expense(
        title : 'Cinema',
        amount: 10,
        date: DateTime.now(),
        category: Category.leisure
    ),
  ];

  void _openAddExpenseOverlay(){

    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx)=> NewExpense(onAddExpense:_addExpense),
    );
  }

  void _addExpense(Expense expense ) {
    setState(() {
      _registeredExpense.add(expense);
    });
  }

  void _removeExpense(Expense expense){
    final expenseIndex = _registeredExpense.indexOf(expense);
    setState(() {
      _registeredExpense.remove(expense);
    });

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: Duration(seconds: 3),
        content: Text('expense deleted'),
        action: SnackBarAction(label: 'undo',
            onPressed: (){
          setState(() {
            _registeredExpense.insert(expenseIndex, expense);
          });
            }
        ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = Center(child: Text("No expense found . Add some !"),);
    if(_registeredExpense.isNotEmpty){
      mainContent = ExpensesList(expenses: _registeredExpense, onRemoveExpense: _removeExpense);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter expense tracker'),
        actions: [
         IconButton(
             onPressed: _openAddExpenseOverlay,
             icon: Icon(Icons.add))
        ],
      ),
      body: Column(
        children: [
          Text("Hello text"),
          Expanded(child:mainContent )
        ],
      ),
    );
  }
}



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
    showModalBottomSheet(context: context,
        builder: (ctx)=> NewExpense(onAddExpense:_addExpense),
    );
  }

  void _addExpense(Expense expense ) {
    setState(() {
      _registeredExpense.add(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
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
          Expanded(child: ExpensesList(expenses: _registeredExpense))
        ],
      ),
    );
  }
}



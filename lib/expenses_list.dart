import 'dart:math';

import 'package:expense_tracker/expense_item.dart';
import 'package:flutter/material.dart';
import 'expense.dart';


class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key,
    required this.expenses,
  required this.onRemoveExpense
  });
  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
        itemBuilder:(context, index) => Dismissible(key: ValueKey(expenses[index]),
            onDismissed: (direction){
              onRemoveExpense(expenses[index]);
            },
            child:ExpenseItem(expenses[index])),
    );
  }
}

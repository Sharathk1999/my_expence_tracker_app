import 'package:flutter/material.dart';
import 'package:my_expence_tracker/models/expense.dart';
import 'package:my_expence_tracker/widgets/expenses_list/expense_item.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({
    super.key, 
    required this.expenses,
  });

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx,index) => ExpenseItem(expense: expenses[index],),
      );
  }
}
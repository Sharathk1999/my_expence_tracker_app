import 'package:flutter/material.dart';
import 'package:my_expence_tracker/models/expense.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({
    super.key, 
    required this.expenses,
  });

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        
      ],
    );
  }
}
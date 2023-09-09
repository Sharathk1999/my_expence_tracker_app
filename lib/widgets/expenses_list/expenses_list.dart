import 'package:flutter/material.dart';
import 'package:my_expence_tracker/models/expense.dart';
import 'package:my_expence_tracker/widgets/expenses_list/expense_item.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({
    super.key,
    required this.expenses, required this.onRemovedExpense,
  });

  final void Function (Expense expense) onRemovedExpense;

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(0.3),
          margin: EdgeInsets.symmetric(
            horizontal: Theme.of(context).cardTheme.margin!.horizontal
          ),
        ),
        key: ValueKey(expenses[index]),
        onDismissed: (direction) {
          onRemovedExpense(expenses[index],);
        },
        child: ExpenseItem(
          expense: expenses[index],
        ),
      ),
    );
  }
}

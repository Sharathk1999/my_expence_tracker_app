import 'package:flutter/material.dart';
import 'package:my_expence_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:my_expence_tracker/widgets/new_expense.dart';

import '../models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<StatefulWidget> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter Course',
      amount: 349,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Movie',
      amount: 170,
      date: DateTime.now(),
      category: Category.entertainment,
    ),
  ];

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    setState(() {
      _registeredExpenses.remove(expense);
    });
    
  }

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent =const Center(
      child:  Text('No expenses found, Start adding some'),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpenseList(
        expenses: _registeredExpenses,
        onRemovedExpense: _removeExpense,
      );
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Expense Tracker"),
        actions: [
          IconButton(
              onPressed: () {
                _openAddExpenseOverlay();
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: Column(
        children: [
          const Text('Chart Here'),
          Expanded(
            child: mainContent,
          ),
        ],
      ),
    );
  }
}

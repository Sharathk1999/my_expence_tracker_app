import 'package:flutter/material.dart';
import 'package:my_expence_tracker/widgets/expenses_list/expenses_list.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Expense Tracker"),
        actions: [
          IconButton(onPressed: (){}, icon:const Icon(Icons.add))
        ],
      ),
      body: Column(
        children: [
          const Text('Chart Here'),
          Expanded(
            child: ExpenseList(expenses: _registeredExpenses),
          ),
        ],
      ),
    );
  }
}

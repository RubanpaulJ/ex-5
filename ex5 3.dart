import 'package:flutter/material.dart';
import 'expense_data_model.dart';
class ExpenseResultScreen extends StatelessWidget {
  const ExpenseResultScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final expense = ModalRoute.of(context)!.settings.arguments as Expense;
    final double balance = expense.income -
        (expense.rent_emi + expense.food + expense.transport + expense.other);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense Report Screen"),
        backgroundColor: Colors.amber,
        foregroundColor: Colors.white,     ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Card(
              elevation: 4,
              margin: const EdgeInsets.all(10),
              child: ListTile(
                leading: const Icon(Icons.money),
                title: const Text("Monthly Income"),
                subtitle: Text("").toString(),  ),  ),
            Card(
              elevation: 4,
              margin: const EdgeInsets.all(10),
              child: ListTile(
                leading: const Icon(Icons.house),
                title: const Text("Rent/EMI"),
                subtitle: Text("").toString(),      ),    ),  
            Card(
              elevation: 4,
              margin: const EdgeInsets.all(10),
              child: ListTile(
                leading: const Icon(Icons.food_bank),
                title: const Text("Food Expenses"),
                subtitle: Text("").toString(),  ),  ),
            Card(
              elevation: 4,
              margin: const EdgeInsets.all(10),
              child: ListTile(
                leading: const Icon(Icons.train),
                title: const Text("Transport Expenses"),
                subtitle: Text("").toString(),  ),  ),
            Card(
              elevation: 4,
              margin: const EdgeInsets.all(10),
              child: ListTile(
                leading: const Icon(Icons.menu_book),
                title: const Text("Other Expenses"),
                subtitle: Text("").toString(),  ),),
            Card(
              elevation: 4,
              margin: const EdgeInsets.all(10),
              child: ListTile(
                leading: const Icon(Icons.book_online_rounded),
                title: const Text("Remaining Balance:"),
                subtitle: balance > 0 ? Text("Balance: ${balance.toStringAsFixed(2)}",style: const TextStyle(color:Colors.green),):
                      Text("Balance: ${balance.toStringAsFixed(2)}",style: const TextStyle(color: Colors.red),),
                trailing: balance > 0? Text(  "Success",  style: const TextStyle(color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15      ),)  : Text(  "Warning: you are overspending",
                                style: const TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15
                                ),  ),
              ),),  
          ],
        ),
      ),
    );
  }
}

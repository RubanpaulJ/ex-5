import 'package:flutter/material.dart';
import 'expense_data_model.dart';
class ExpenseScreen extends StatefulWidget{
  const ExpenseScreen({super.key});
  @override
  State<ExpenseScreen>createState()=>_ExpenseScreenState();
}
class _ExpenseScreenState extends State<ExpenseScreen>{
  final _formkey=GlobalKey<FormState>();
  final _incomecontroller=TextEditingController();
  final _rent_emicontroller=TextEditingController();
  final _foodexpensecontroller=TextEditingController();
  final _transportexpensecontroller=TextEditingController();
  final _otherexpensecontroller=TextEditingController();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        title: Text("Expense Details Screen"),backgroundColor: Colors.amber,),
      body:Container(
        padding: EdgeInsets.all(20),
        child: Form(
          key:_formkey,
        child:SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                controller: _incomecontroller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Monthly Income:",
                  border:OutlineInputBorder()    ),
                validator: (value){
                  if(value==null || value.isEmpty){
                    return "Enter your Monthly Income";}
                  if(double.tryParse(value)!<0){
                    return "Enter a positive number";}
                  return null;  },    ),
              SizedBox(height: 20,),
              TextFormField(
                controller: _rent_emicontroller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Rent/EMI:",
                  border:OutlineInputBorder()  ),
                validator: (value){
                  if(value==null || value.isEmpty){
                    return "Enter your Rent/EMI:";  }
                  return null;},  ),
              SizedBox(height: 20,),
              TextFormField(
                controller: _foodexpensecontroller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Food expense:",
                  border:OutlineInputBorder()  ),
                validator: (value){
                  if(value==null || value.isEmpty){
                    return "Enter your Food expense:";  }
                  return null;  },  ),
              SizedBox(height: 20,),
              TextFormField(
                controller: _transportexpensecontroller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Transport Expense:",
                  border:OutlineInputBorder()  ),
                validator: (value){
                  if(value==null || value.isEmpty){
                    return "Enter your Transport Expsense:";  }
                  return null;},  ),
              SizedBox(height: 20,),
              TextFormField(
                controller: _otherexpensecontroller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Other Expenses:",
                  border:OutlineInputBorder()  ),
                validator: (value){
                  if(value==null || value.isEmpty){
                    return "Enter your other expenses:";}
                  return null;  },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green,foregroundColor: Colors.white),
                onPressed: (){
                  if(_formkey.currentState!.validate()){
                      final expense=Expense(
                        income: double.parse(_incomecontroller.text),
                        rent_emi: double.parse(_rent_emicontroller.text),
                        food: double.parse(_foodexpensecontroller.text),
                        transport: double.parse(_transportexpensecontroller.text),
                        other: double.parse(_otherexpensecontroller.text)    );
                        Navigator.pushNamed(
                          context,
                          '/result',
                          arguments: expense
                        );      }  },
                child: Text("Submit details"))
            ],), )),  )  );}
}

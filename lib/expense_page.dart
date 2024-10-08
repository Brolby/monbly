import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:monbly/expense_model.dart';
import 'package:monbly/item_expense_widget.dart';

class ExpensePage extends StatefulWidget {
  const ExpensePage({super.key});

  @override
  State<ExpensePage> createState() => _ExpensePageState();
}

class _ExpensePageState extends State<ExpensePage> {
  List<ExpenseModel> expenses = [
    ExpenseModel(
        expenseday: "02",
        expenseWeekDay: "QUI",
        expenseName: "Parcela Carro",
        expenseCategory: "Out 09, 9:50 am",
        expenseValue: "R\$ -800,00",
        expenseWasPaid: true),
    ExpenseModel(
        expenseday: "03",
        expenseWeekDay: "SEX",
        expenseName: "Conta Celular",
        expenseCategory: "Out 10, 9:50 am",
        expenseValue: "R\$ -54,00",
        expenseWasPaid: true),
    ExpenseModel(
        expenseday: "04",
        expenseWeekDay: "SAB",
        expenseName: "Parcela Casa",
        expenseCategory: "Out 11, 9:50 am",
        expenseValue: "R\$ -1500,00",
        expenseWasPaid: true),
    ExpenseModel(
        expenseday: "05",
        expenseWeekDay: "DOM",
        expenseName: "Cartao Nubank",
        expenseCategory: "Out 18, 9:50 am",
        expenseValue: "R\$ -240,00",
        expenseWasPaid: false),
    ExpenseModel(
        expenseday: "06",
        expenseWeekDay: "SEG",
        expenseName: "Cartao Banco Inter",
        expenseCategory: "Out 20, 9:50 pm",
        expenseValue: "R\$ -320,00",
        expenseWasPaid: false),
    ExpenseModel(
        expenseday: "07",
        expenseWeekDay: "TER",
        expenseName: "Compras Mercado",
        expenseCategory: "Out 23, 9:50 pm",
        expenseValue: "R\$ -500,00",
        expenseWasPaid: false),
    ExpenseModel(
        expenseday: "08",
        expenseWeekDay: "QUA",
        expenseName: "Jogo Futebol",
        expenseCategory: "Out 29, 9:50 am",
        expenseValue: "R\$ -10,00",
        expenseWasPaid: false),
    ExpenseModel(
        expenseday: "30",
        expenseWeekDay: "QUA",
        expenseName: "Sálario",
        expenseCategory: "Out 30, 9:50 pm",
        expenseValue: "R\$ 5500,00",
        expenseWasPaid: true)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 31, 41, 51),
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 120,
                        child: Card(
                          color: Color.fromARGB(255, 38, 149, 142),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Total Balance",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14)),
                              Text("\$1.120,50",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 22))
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: SizedBox(
                        height: 120,
                        child: Card(
                          color: Color.fromARGB(255, 176, 67, 70),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Monthly Spending",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14)),
                              Text("- \$753,05",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 22))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      Card(
                        color: Color.fromARGB(255, 50, 63, 75),
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "All",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                      Card(
                        color: Color.fromARGB(255, 50, 63, 75),
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              SizedBox(
                                height: 15,
                                width: 15,
                                child: CircleAvatar(
                                  backgroundColor: Colors.green,
                                  child: Icon(
                                    Icons.arrow_upward_rounded,
                                    size: 10,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(width: 8),
                              Text(
                                "Income",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        color: Color.fromARGB(255, 50, 63, 75),
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              SizedBox(
                                height: 15,
                                width: 15,
                                child: CircleAvatar(
                                  backgroundColor: Colors.red,
                                  child: Icon(
                                    Icons.arrow_downward_rounded,
                                    size: 10,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(width: 8),
                              Text(
                                "Spending",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Card(
                      color: const Color.fromARGB(255, 50, 63, 75),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemCount: expenses.length,
                            separatorBuilder: (context, index) => SizedBox(
                                  width: double.infinity,
                                  child: Container(
                                    color: Colors.grey,
                                    height: 0.3,
                                  ),
                                ),
                            itemBuilder: (context, index) {
                              final data = expenses[index];
                              return ItemExpenseWidget(
                                eDay: data.expenseday,
                                eWeekDay: data.expenseWeekDay,
                                eValue: data.expenseValue,
                                eName: data.expenseName,
                                eCategory: data.expenseCategory,
                                eWasPaid: data.expenseWasPaid,
                                wasChecked: (value) {
                                  setState(() {
                                    expenses[index].expenseWasPaid =
                                        !expenses[index].expenseWasPaid;
                                  });
                                },
                              );
                            }),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

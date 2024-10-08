import 'dart:convert';

class ExpenseModel {
  final String expenseday;
  final String expenseWeekDay;
  final String expenseName;
  final String expenseCategory;
  final String expenseValue;
  bool expenseWasPaid;
  ExpenseModel({
    required this.expenseday,
    required this.expenseWeekDay,
    required this.expenseName,
    required this.expenseCategory,
    required this.expenseValue,
    required this.expenseWasPaid,
  });

  Map<String, dynamic> toMap() {
    return {
      'expenseday': expenseday,
      'expenseWeekDay': expenseWeekDay,
      'expenseName': expenseName,
      'expenseCategory': expenseCategory,
      'expenseValue': expenseValue,
      'expenseWasPaid': expenseWasPaid,
    };
  }

  factory ExpenseModel.fromMap(Map<String, dynamic> map) {
    return ExpenseModel(
      expenseday: map['expenseday'] ?? '',
      expenseWeekDay: map['expenseWeekDay'] ?? '',
      expenseName: map['expenseName'] ?? '',
      expenseCategory: map['expenseCategory'] ?? '',
      expenseValue: map['expenseValue'] ?? '',
      expenseWasPaid: map['expenseWasPaid'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ExpenseModel.fromJson(String source) => ExpenseModel.fromMap(json.decode(source));
}

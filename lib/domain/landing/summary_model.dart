class SummaryModel {
  num expenses = 1200;
  num income = 0;
  num openingBalance = -1200;
  String maxExpense = "Dinner at Restaurant";
  num totalTransactionsThisMonth = 1;

  SummaryModel({
    required this.expenses,
    required this.income,
    required this.openingBalance,
    required this.maxExpense,
    required this.totalTransactionsThisMonth,
  });
}

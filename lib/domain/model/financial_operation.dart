enum FinancialOperationType { DEPOSIT, WITHDRAWAL }

class FinancialOperation {
  const FinancialOperation(
      {required this.type, required this.amount, required this.registeredAt});

  final FinancialOperationType type;
  final double amount;
  final DateTime registeredAt;
}

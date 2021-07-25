import 'package:flutter/foundation.dart' as foundation;
import 'package:metch_portal/domain/model/financial_operation.dart';
import 'package:metch_portal/domain/model/transaction.dart';
import 'package:metch_portal/infrastructure/domain/repository/instrument_repository.dart';

import 'instrument.dart';

class AppStateModel extends foundation.ChangeNotifier {
  double _funds = 0;
  double _profit = 150;
  double _profitPrc = 10;
  List<Instrument> _assets = [];
  List<Transaction> _transactions = [];
  List<FinancialOperation> _financialOperations = [];
  // All the available products.
  List<Instrument> _availableInstruments = [];

  double getAvailableFunds() {
    return _funds;
  }

  double getProfit() {
    return _profit;
  }

  double getProfitPrc() {
    return _profitPrc;
  }

  List<Transaction> getTransactions(Market? market) {
    List<Transaction> transactions;
    if (market == null) {
      transactions = _transactions.toList();
    } else {
      transactions = _transactions.where((transaction) {
        return transaction.instrument.market == market;
      }).toList();
    }

    transactions.sort((tx, otherTx) {
      return tx.createdAt.isAtSameMomentAs(otherTx.createdAt)
          ? 0
          : tx.createdAt.isBefore(otherTx.createdAt)
              ? 1
              : -1;
    });
    return transactions;
  }

  List<FinancialOperation> getFinancialOperations() {
    return _financialOperations.toList();
  }

  // Returns a copy of the list of available products, filtered by category.
  List<Instrument> getInstruments(Market? market) {
    if (market == null) {
      return List.from(_availableInstruments);
    } else {
      return _availableInstruments.where((i) {
        return i.market == market;
      }).toList();
    }
  }

  // Search the product catalog
  List<Instrument> search(String searchTerms) {
    return _availableInstruments.where((instrument) {
      return instrument.name
              .toLowerCase()
              .contains(searchTerms.toLowerCase()) ||
          instrument.symbol.toLowerCase().contains(searchTerms.toLowerCase()) ||
          instrument.market
              .toString()
              .toLowerCase()
              .contains(searchTerms.toLowerCase());
    }).toList();
  }

  // Returns the Product instance matching the provided id.
  Instrument findInstrumentById(int id) {
    return _availableInstruments
        .firstWhere((instrument) => instrument.id == id);
  }

  // Loads the list of available products from the repo.
  void init() {
    _availableInstruments = InstrumentRepository.findAll();
    _transactions.add(Transaction(
        id: 1,
        instrument: _availableInstruments[0],
        action: OrderAction.BUY,
        price: 500,
        size: 2,
        createdAt: DateTime.now()));
    _transactions.add(Transaction(
        id: 2,
        instrument: _availableInstruments[0],
        action: OrderAction.SELL,
        price: 500,
        size: 1,
        createdAt: DateTime.now()));
    _transactions.add(Transaction(
        id: 3,
        instrument: _availableInstruments[2],
        action: OrderAction.BUY,
        price: 500,
        size: 2,
        createdAt: DateTime.now()));
    _transactions.add(Transaction(
        id: 4,
        instrument: _availableInstruments[3],
        action: OrderAction.BUY,
        price: 500,
        size: 2,
        createdAt: DateTime.now()));
    deposit(5000);
    deposit(1500);
    deposit(1500);
    withdraw(2000);
    notifyListeners();
  }

  void deposit(double amount) {
    if (amount <= 0) {
      throw new Exception("Deposited amount must be > 0!");
    }
    _financialOperations.add(FinancialOperation(
        type: FinancialOperationType.DEPOSIT,
        amount: amount,
        registeredAt: DateTime.now()));
    _funds += amount;
    notifyListeners();
  }

  void withdraw(double amount) {
    if (amount <= 0) {
      throw new Exception("Withdrawned amount must be > 0!");
    }
    _financialOperations.add(FinancialOperation(
        type: FinancialOperationType.WITHDRAWAL,
        amount: amount,
        registeredAt: DateTime.now()));
    _funds -= amount;
    notifyListeners();
  }
}

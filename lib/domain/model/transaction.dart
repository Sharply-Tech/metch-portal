import 'package:metch_portal/domain/model/instrument.dart';

enum OrderAction { BUY, SELL }

class Transaction {
  const Transaction(
      {required this.id,
      required this.instrument,
      required this.action,
      required this.price,
      required this.size,
      required this.createdAt});

  final int id;
  final Instrument instrument;
  final OrderAction action;
  final double price;
  final double size;
  final DateTime createdAt;
}

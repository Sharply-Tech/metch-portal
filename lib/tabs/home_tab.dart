import 'package:flutter/cupertino.dart';
import 'package:metch_portal/domain/model/financial_operation.dart';
import 'package:metch_portal/domain/model/instrument.dart';
import 'package:metch_portal/domain/model/transaction.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

import '../domain/model/app_state_model.dart';

class HomeTab extends StatelessWidget {
  Widget _fundsInfo(AppStateModel model) {
    return Column(
      children: [
        Text(
          'Total invested: ',
          textScaleFactor: 1.5,
        ),
        Text(
          '9999.99\$',
          style: TextStyle(color: CupertinoColors.activeBlue),
        ),
        Text('Profit:'),
        Text('999.99\$ (+10.00%)'),
        Text('Available Funds:'),
        Text('199.99\$'),
      ],
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }

  Widget _financialOperationListItem(FinancialOperation operation) {
    return Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: operation.type == FinancialOperationType.DEPOSIT
                    ? Icon(
                        CupertinoIcons.add_circled_solid,
                        size: 38,
                      )
                    : Icon(
                        CupertinoIcons.minus_circle_fill,
                        size: 38,
                        color: CupertinoColors.systemRed,
                      )),
            Expanded(
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                            '${operation.type == FinancialOperationType.DEPOSIT ? 'Deposit of ' : 'Withdrawal of '} ${operation.amount.toStringAsFixed(2)}\$'),
                        Padding(padding: EdgeInsets.only(top: 8)),
                        Text(operation.registeredAt.toString())
                      ],
                    ))),
          ],
        ));
  }

  Widget _transactionListItem(Transaction transaction) {
    return Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: transaction.instrument.imageUrl,
                  width: 36,
                  height: 36,
                )),
            // Image.network(transaction.instrument.imageUrl,
            //     width: 36, height: 36)),
            Expanded(
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                            '${transaction.action == OrderAction.BUY ? 'Bought ' : 'Sold '} ${transaction.size.toStringAsFixed(2)} x ${transaction.instrument.symbol}'),
                        Padding(padding: EdgeInsets.only(top: 8)),
                        Text(
                          '${transaction.action == OrderAction.BUY ? '-' : '+'}${transaction.price.toStringAsFixed(2)}\$',
                          textScaleFactor: 0.8,
                        ),
                        Text(
                          transaction.createdAt.toString(),
                          textScaleFactor: 0.8,
                        )
                      ],
                    ))),
          ],
        ));
  }

  Widget _financialOperationsList(AppStateModel model) {
    final operationsList = model.getFinancialOperations();
    print('Financial operations: ');
    for (final operation in operationsList) {
      print(operation);
    }
    return Column(children: [
      ListView.builder(
          itemCount: operationsList.length,
          itemBuilder: (context, index) {
            return _financialOperationListItem(operationsList[index]);
          })
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateModel>(builder: (context, model, child) {
      return CustomScrollView(
        slivers: <Widget>[
          CupertinoSliverNavigationBar(
              largeTitle: Text('Metch'),
              leading: CupertinoButton(
                  onPressed: () {
                    print('person button clicked');
                  },
                  child: Icon(CupertinoIcons.person_alt_circle),
                  padding: EdgeInsets.zero),
              trailing: CupertinoButton(
                child: Icon(CupertinoIcons.settings),
                onPressed: () {
                  print('settings button clicked');
                },
                padding: EdgeInsets.zero,
              )),
          SliverSafeArea(
            top: false,
            minimum: const EdgeInsets.only(top: 8),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  if (index == 0) {
                    return Column(
                      children: [
                        _fundsInfo(model),
                        Padding(
                            padding: EdgeInsets.all(5),
                            child: Row(
                              children: [
                                Spacer(),
                                CupertinoButton(
                                    color: CupertinoColors.systemBlue,
                                    child: Text('Deposit +'),
                                    padding:
                                        EdgeInsets.fromLTRB(20, 10, 20, 10),
                                    onPressed: () {
                                      print('Depositing funds');
                                    }),
                                Spacer(),
                                CupertinoButton(
                                    color: CupertinoColors.systemRed,
                                    child: Text('Withdraw -'),
                                    padding:
                                        EdgeInsets.fromLTRB(20, 10, 20, 10),
                                    onPressed: () {
                                      print('Withdrawing funds');
                                    }),
                                Spacer()
                              ],
                            )),
                        Text('Financial operations:')
                        // nu merge pus aici, nuj de ce
                        // _financialOperationsList(model)
                      ],
                    );
                  }
                  // list financial operations
                  final financialOperations = model.getFinancialOperations();
                  if (index >= 1 && index <= financialOperations.length) {
                    final normalizedIndex = index - 1;
                    return _financialOperationListItem(
                        financialOperations[normalizedIndex]);
                  }
                  // list transactions
                  if (index > financialOperations.length) {
                    if (index == financialOperations.length + 1) {
                      return Text('Transactions:');
                    }
                    final transactions = model.getTransactions(null);
                    final normalizedIndex =
                        index - financialOperations.length - 2;
                    print('Transactions normalized index: $normalizedIndex');
                    if (normalizedIndex < transactions.length) {
                      return _transactionListItem(
                          transactions[normalizedIndex]);
                    }
                  }
                  return null;
                },
              ),
            ),
          )
        ],
      );
    });
  }
}

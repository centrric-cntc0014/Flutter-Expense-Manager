import 'package:flutter/material.dart';
import 'package:money_management_app/db/transactions/transactions_db.dart';
import 'package:money_management_app/models/transactions/transaction_model.dart';

class ScreenTransaction extends StatelessWidget {
  const ScreenTransaction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TransactionDB.instance.refresh();
    return ValueListenableBuilder(
      valueListenable: TransactionDB.instance.transactionListNotifier,
      builder: (BuildContext ctx, List<TransactionModel> newList, Widget? _) {
        return ListView.separated(
            padding: const EdgeInsets.all(10.0),
            itemBuilder: (ctx, index) {
              final _value = newList[index];
              print('Here goes the value $_value');
              return Card(
                elevation: 0,
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 50,
                    child: Text(
                      '30\nMAR',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    backgroundColor: Colors.deepPurpleAccent,
                  ),
                  title: Text('RS ${_value.amount}'),
                  // subtitle: Text(_value.category.name),
                  // trailing: Icon(Icons.delete),
                ),
              );
            },
            separatorBuilder: (ctx, index) {
              return (const SizedBox(height: 10));
            },
            itemCount: newList.length);
      },
    );
  }
}

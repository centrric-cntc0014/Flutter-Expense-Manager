import 'package:flutter/material.dart';
import 'package:money_management_app/db/category/category_db.dart';
import 'package:money_management_app/models/category/category_model.dart';

class IncomeList extends StatelessWidget {
  const IncomeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: CateogoryDB().incomeCategoryListListner,
      builder: (BuildContext ctx, List<CategoryModel> newLst, Widget? _) {
        return ListView.separated(
          padding: const EdgeInsets.all(10.0),
          itemBuilder: (context, index) {
            final category = newLst[index];
            return Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(category.name),
                    IconButton(
                      onPressed: () {
                        CateogoryDB.instance.deleteCategory(category.id);
                      },
                      icon: const Icon(Icons.delete),
                    )
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 2,
            );
          },
          itemCount: newLst.length,
        );
      },
    );
  }
}

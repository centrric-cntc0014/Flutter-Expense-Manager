import 'package:flutter/material.dart';
import 'package:money_management_app/categories/expense_categorylist.dart';
import 'package:money_management_app/db/category/category_db.dart';

import 'income_categorylist.dart';

class ScreenCategory extends StatefulWidget {
  const ScreenCategory({Key? key}) : super(key: key);

  @override
  State<ScreenCategory> createState() => _ScreenCategoryState();
}

class _ScreenCategoryState extends State<ScreenCategory>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    CateogoryDB().refreshUI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(controller: _tabController, tabs: [
          Tab(
            text: 'INCOME',
          ),
          Tab(text: 'EXPENSE')
        ]),
        Expanded(
          child: TabBarView(controller: _tabController, children: [
            IncomeList(),
            ExpenseList(),
          ]),
        )
      ],
    );
  }
}

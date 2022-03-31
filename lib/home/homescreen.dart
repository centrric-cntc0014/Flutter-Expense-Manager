import 'package:flutter/material.dart';
import 'package:money_management_app/add_transaction/screen_add_transaction.dart';
import 'package:money_management_app/categories/screen_category.dart';
import 'package:money_management_app/db/category/category_db.dart';
import 'package:money_management_app/home/widgets/bottom_navigation.dart';
import 'package:money_management_app/models/category/category_add_popup.dart';
import 'package:money_management_app/models/category/category_model.dart';

import '../transactions/screen_transaction.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final _pages = const [ScreenTransaction(), ScreenCategory()];
  // final _items = ['Salary', 'Fuel', 'Food'];
  static ValueNotifier<int> selectedIndexNotifier = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      appBar: AppBar(
        title: const Text('Money Management'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ValueListenableBuilder(
            valueListenable: selectedIndexNotifier,
            builder: (BuildContext context, int updatedIndex, _) {
              return _pages[updatedIndex];
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (selectedIndexNotifier.value == 0) {
            print('Add Transactions');
            Navigator.of(context).pushNamed(ScreenAddTransaction.routeName);
          } else {
            print('Add Categories');

            showCategoryAddPopup(context);
            // final _sample = CategoryModel(
            //     id: DateTime.now().millisecondsSinceEpoch.toString(),
            //     name: 'Travel',
            //     type: CategoryType.expense);
            // CateogoryDB().insertCategory(_sample);

          }
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}

// class DropDownListCategories extends StatefulWidget {
//   DropDownListCategories({Key? key}) : super(key: key);

//   @override
//   State<DropDownListCategories> createState() => _DropDownListCategoriesState();
// }

// class _DropDownListCategoriesState extends State<DropDownListCategories> {
//   String dropdownvalue = 'Salary';
//   final _items = ['Salary', 'Fuel', 'Food'];

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(20),
//       child: Column(
//         children: [
//           TextFormField(
//             decoration: InputDecoration(
//                 label: Text('Amount'),
//                 border: OutlineInputBorder(borderSide: BorderSide())),
//           ),
//           SizedBox(height: 10),
//           DropdownButton(
//               value: dropdownvalue,
//               items: _items.map((String item) {
//                 return DropdownMenuItem(value: item, child: Text(item));
//               }).toList(),
//               onChanged: (String? newValue) {
//                 setState() {
//                   dropdownvalue = newValue!;
//                 }
//               }),
//         ],
//       ),
//     );
//   }
// }

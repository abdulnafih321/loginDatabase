import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class DataTableScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var box = Hive.box('userBox');

    // Retrieve all entries and print their runtime types
    var users = box.values.toList();
    users.forEach((element) {
      print(element.runtimeType); // This should print Map<String, String>
    });

    // Cast values to List<Map<dynamic, dynamic>> if they are maps
    var usersList = users
        .where((element) => element is Map)
        .toList()
        .cast<Map<dynamic, dynamic>>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Stored Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: [
              DataColumn(label: Text('ID')),
              DataColumn(label: Text('Email')),
              DataColumn(label: Text('Password')),
            ],
            rows: List.generate(
              usersList.length,
              (index) {
                var user = usersList[index];
                return DataRow(
                  cells: [
                    DataCell(Text((index + 1).toString())),
                    DataCell(Text(user['email'] ?? '')),
                    DataCell(Text(user['password'] ?? '')),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

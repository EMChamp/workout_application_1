import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Table Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Map<String, String>> data = [
    {"Name": "John", "Age": "25", "City": "New York"},
    {"Name": "Jane", "Age": "30", "City": "Los Angeles"},
    {"Name": "Mike", "Age": "35", "City": "Chicago"},
  ];

  void _addData() {
    setState(() {
      data.add({"Name": "New User", "Age": "40", "City": "Houston"});
    });
  }

  void _removeData() {
    if (data.isNotEmpty) {
      setState(() {
        data.removeLast();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Table Example'),
      ),
      body: Column(
        children: [
          DataTable(
            columns: const <DataColumn>[
              DataColumn(label: Text('Name')),
              DataColumn(label: Text('Age')),
              DataColumn(label: Text('City')),
            ],
            rows: data.map((item) {
              return DataRow(cells: [
                DataCell(Text(item['Name']!)),
                DataCell(Text(item['Age']!)),
                DataCell(Text(item['City']!)),
              ]);
            }).toList(),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _addData,
                child: Text('Add Data'),
              ),
              SizedBox(width: 20),
              ElevatedButton(
                onPressed: _removeData,
                child: Text('Remove Data'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:study_app/module/airport_list/airport_list_page.dart';

import '../user_list/user_list_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const pages = [
    AirportListPage(),
    UserListPage(),
  ];

  @override
  Widget build(BuildContext context) {
    int index = 0;

    return Scaffold(
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
            Logger().i('index: $index');
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Main',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'User',
          ),
        ],
      ),
    );
  }
}

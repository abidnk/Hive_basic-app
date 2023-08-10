import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hive_3final/db/db_-functions.dart';
import 'package:hive_3final/screen/addpage.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    getAllStudent();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Record'),
      ),
      body: SafeArea(child: Column(
        children: const [
          AddStudent(),
        ],
      )),
      
    );
  }
}
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_3final/db/db_-functions.dart';

class detailsScreen extends StatelessWidget {
  var name;
  var age;
  dynamic image;
  detailsScreen(
      {super.key, 
      required this.name,
       required this.age, 
       required this.image});

  @override
  Widget build(BuildContext context) {
    getAllStudent();
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text('DETAILS VIEW'),
            ),
            body: Container(
              color: const Color.fromARGB(255, 255, 255, 255),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 150,
                    width: 150,
                    child: Image(image: FileImage(File(image))),
                  ),
                  Text(name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30)),
                  SizedBox(height: 10,),
                  Text(age,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30))
                ],
              ),
            )));
  }
}



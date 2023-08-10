import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive_3final/db/db_-functions.dart';
import 'package:hive_3final/model/studentModel.dart';
import 'package:hive_3final/screen/addpage.dart';
import 'package:hive_3final/screen/detailscreen.dart';
import 'package:hive_3final/screen/editpage.dart';

class listPage extends StatelessWidget {
  const listPage({super.key});

  @override
  Widget build(BuildContext context) {
    getAllStudent();
    return ValueListenableBuilder(
      valueListenable: StudentListNotifier,
      builder:
          (BuildContext ctx, List<StudentModel> StudentList, Widget? child) {
        return Scaffold(
            body: ListView.separated(
              itemBuilder: (ctx, index) {
                final data = StudentList[index];
                return ListTile(
                  title: Text(data.name),
                  subtitle: Text(data.age),
                  leading: CircleAvatar(
                    backgroundImage: FileImage(File(data.iimage)),
                  ),
                  trailing: SizedBox(
                    width: 100,
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => edit_student(
                                        index: index,
                                        name: data.name,
                                        age: data.age,
                                        image: data.iimage,
                                      )));
                            },
                            icon: const Icon(
                              Icons.edit,
                              color: Colors.blue,
                            )),
                        IconButton(
                            onPressed: () {
                              deleteStudent(index);
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            )),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => detailsScreen(
                          name: data.name, age: data.age, image: data.iimage),
                    ));
                  },
                );
              },
              separatorBuilder: (ctx, index) {
                return const Divider();
              },
              itemCount: StudentList.length,
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AddStudent(),
                ));
              },
              child: Icon(Icons.add),
            ));
      },
    );
  }
}

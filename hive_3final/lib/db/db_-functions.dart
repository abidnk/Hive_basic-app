import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_3final/model/studentModel.dart';



ValueNotifier<List<StudentModel>> StudentListNotifier = ValueNotifier([]);  

Future<void> addStudent(StudentModel value) async{
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  await studentDB.add(value);
  await Hive.openBox<StudentModel>('student_db');
  StudentListNotifier.value.add(value);
  StudentListNotifier.notifyListeners();
}

Future<void>getAllStudent()async{
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  StudentListNotifier.value.clear();
  StudentListNotifier.value.addAll(studentDB.values);
  StudentListNotifier.notifyListeners();
  }

Future<void>update( index,updation) async{
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  await studentDB.putAt(index,updation);
  StudentListNotifier.value[index]=updation;
  StudentListNotifier.notifyListeners();
}

  Future<void> deleteStudent(index) async {
    final studentDB = await Hive.openBox<StudentModel>('student_db');
    await studentDB.deleteAt(index);
    getAllStudent();
  }

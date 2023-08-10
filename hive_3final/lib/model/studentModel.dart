import 'package:hive/hive.dart';
part 'studentModel.g.dart';
@HiveType(typeId: 1)
class StudentModel {
  @HiveField(0)
  int? id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String age;

  @HiveField(3)
  final String iimage;

  StudentModel({
    required this.name,
    required this.age,
    required this.iimage,
    this.id
    });
}





























// import 'package:hive/hive.dart';
// part 'data_model.g.dart';


// @HiveType(typeId: 1)
// class StudentModel {
//   // @HiveField(0)
//   // int? id;

//   @HiveField(0)
//   final String name;

//   @HiveField(1)
//   final String age;

//   @HiveField(2)
//   final String iimage;

//   StudentModel({
//     required this.name,
//     required this.age,
//     required this.iimage,
//     // this.id
//     });
// }
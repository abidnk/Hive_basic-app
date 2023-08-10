import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hive_3final/db/db_-functions.dart';
import 'package:hive_3final/model/studentModel.dart';
import 'package:hive_3final/screen/liststudentwidget.dart';

import 'package:image_picker/image_picker.dart';

class AddStudent extends StatefulWidget {
  const AddStudent({super.key});

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  final _nameController = TextEditingController();

  final _ageController = TextEditingController();

  File? file;
  ImagePicker image = ImagePicker();

  @override
  Widget build(BuildContext context) {
    getAllStudent();
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: CircleAvatar(
                  radius: 80,
                  child: file == null
                      ? CircleAvatar(
                        
                          radius: 90,
                          backgroundImage: NetworkImage(
                              "https://media.licdn.com/dms/image/C560BAQGPbLYlIPN2Rg/company-logo_200_200/0/1672642951827?e=2147483647&v=beta&t=4-VsM3uSyCUnaGmxUoJDLYFWmrWVM5uUjsEblD7fEoE"),
                     
                        )
                      : SizedBox(
                          height: 200,
                          width: 180,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.file(
                              file!,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton(
                      onPressed: () {
                        camera();
                      },
                      child: const Icon(Icons.camera_alt),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        gallery();
                      },
                      child: const Icon(Icons.image),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Name'),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 70,
                width: MediaQuery.of(context).size.width,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  maxLength: 3,
                  controller: _ageController,
                  cursorColor: Colors.blue,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Age',
                  ),
                ),
              ),
              const SizedBox(height: 5),
              ElevatedButton(
                onPressed: () {
                  onAddStudentButton();
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => listPage(),
                  ));
                },
                child: const Text("Add Student"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> onAddStudentButton() async {
    final name = _nameController.text.trim();
    final age = _ageController.text.trim();

    if (name.isEmpty || age.isEmpty || file!.path.isEmpty) {
      return;
    }

    final student = StudentModel(name: name, age: age, iimage: file!.path);
    addStudent(student);
  }

  Future camera() async {
    var img = await image.pickImage(source: ImageSource.camera);
    setState(() {
      file = File(img!.path);
    });
  }

  Future gallery() async {
    var img = await image.pickImage(source: ImageSource.gallery);
    setState(() {
      file = File(img!.path);
    });
  }
}

Widget imageProfile() {
  return Center(
    child: Stack(
      children: <Widget>[
        const CircleAvatar(
          radius: 80.0,
          backgroundImage: AssetImage("assets/Demo profile.jpg"),
        ),
        Positioned(
          bottom: 20.0,
          right: 20.0,
          child: InkWell(
            onTap: () {},
            child: const Icon(
              Icons.camera_alt,
              color: Colors.teal,
              size: 28.0,
            ),
          ),
        ),
      ],
    ),
  );
}

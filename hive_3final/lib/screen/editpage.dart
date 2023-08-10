import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_3final/db/db_-functions.dart';
import 'package:hive_3final/model/studentModel.dart';
import 'package:hive_3final/screen/liststudentwidget.dart';
import 'package:hive_3final/screen/screenHome.dart';
import 'package:image_picker/image_picker.dart';

// ignore: must_be_immutable, camel_case_types
class edit_student extends StatefulWidget {
  var name;

  var age;

  int index;

  dynamic image;

  edit_student({
    required this.index,
    required this.name,
    required this.age,
    required this.image,
  });

  @override
  State<edit_student> createState() => _edit_studentState();
}

// ignore: camel_case_types
class _edit_studentState extends State<edit_student> {
  TextEditingController _studentname = TextEditingController();

  TextEditingController _studentage = TextEditingController();

  String profilePhoto = '';

  File? file;
  ImagePicker image = ImagePicker();

  @override
  void initState() {
    super.initState();
    _studentname = TextEditingController(text: widget.name);
    _studentage = TextEditingController(text: widget.age);
    profilePhoto = widget.image;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: const [],
          title: const Text(
            "Edit List",
            style: TextStyle(fontSize: 25),
          ),
          shadowColor: Colors.grey,
        ),
        body: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(height: 30),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [],
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    child: file != null
                        ? CircleAvatar(
                            radius: 80,
                            child: SizedBox(
                              width: 150,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(110),
                                child: Image.file(
                                  file!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          )
                        : CircleAvatar(
                            backgroundImage: widget.image is File
                                ? FileImage(widget.image)
                                : FileImage(File(widget.image)),
                            radius: 80,
                          )),
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
                Container(
                  margin: const EdgeInsets.only(left: 30, right: 30),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _studentname,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Name',
                          filled: true,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _studentage,
                        keyboardType: TextInputType.number,
                        maxLength: 3,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Age',
                          filled: true,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 150,
                        height: 40,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            edit();
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                              builder: (context) => listPage(),
                            ));
                          },
                          icon: const Icon(Icons.edit_outlined),
                          label: const Text(
                            "UPDATE",
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue[900]),
                        ),
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> edit() async {
    final name = _studentname.text.trim();
    final age = _studentage.text.trim();

    if (name.isEmpty || age.isEmpty || profilePhoto.isEmpty) {
      return;
    } else {
      final updation = StudentModel(name: name, age: age, iimage: profilePhoto);
      update(widget.index, updation);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomeScreen()));
    }
  }

  camera() async {
    final XFile? neededimage =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (neededimage != null) {
      setState(() {
        file = File(neededimage.path);
        profilePhoto = neededimage.path;
      });
    }
  }

  gallery() async {
    final XFile? neededimage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (neededimage != null) {
      setState(() {
        file = File(neededimage.path);
        profilePhoto = neededimage.path;
      });
    }
  }
}

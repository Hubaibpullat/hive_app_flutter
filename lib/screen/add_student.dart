import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:students/db/functions/db_functions.dart';
import 'package:students/model/data_model.dart';
import 'package:students/screen/list_student.dart';

class AddStudentWidget extends StatefulWidget {
  AddStudentWidget({Key? key}) : super(key: key);

  @override
  State<AddStudentWidget> createState() => _AddStudentWidgetState();
}

class _AddStudentWidgetState extends State<AddStudentWidget> {
  final _nameController = TextEditingController();

  final _ageController = TextEditingController();

  final _phonecontrolller = TextEditingController();

  final _placecontroller = TextEditingController();

  File? file;

  ImagePicker image = ImagePicker();

  @override
  Widget build(BuildContext context) {
    getAllStudents();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Container(
              child: CircleAvatar(
                  radius: 80,
                  child: file == null
                      ? const CircleAvatar(
                          radius: 90,
                          backgroundImage: AssetImage('asset/student.png'),
                        )
                      : SizedBox(
                          height: 200,
                          width: 180,
                          child: ClipOval(
                              // BorderRadius: BorderRadius.circular(50),
                              child: Image.file(
                            file!,
                            fit: BoxFit.fill,
                          )),
                        )),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 150,
                    height: 30,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal[800]),
                      onPressed: () {
                        getpicture();
                      },
                      child: Text(
                        'Take picture',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                    width: 150,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal[800]),
                      onPressed: () {
                        getphotos();
                      },
                      child: Text(
                        'From gallery',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                hintText: 'Name',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'value is empty';
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: _ageController,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                hintText: 'Age',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'value is empty';
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              keyboardType: TextInputType.phone,
              controller: _phonecontrolller,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                hintText: 'Phone',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'value is empty';
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(height: 15, width: 10),
            TextFormField(
              controller: _placecontroller,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                hintText: 'place',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'value is empty';
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.teal[800]),
              onPressed: () {
                onAddStudentButtonClicked(context);
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ListStudentWidget(),
                ));
              },
              child: Text(
                'Add student',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> onAddStudentButtonClicked(BuildContext context) async {
    final _name = _nameController.text.trim();
    final _age = _ageController.text.trim();
    final _phone = _phonecontrolller.text.trim();
    final _place = _placecontroller.text.trim();
    
    if (_name.isEmpty || _age.isEmpty || _phone.isEmpty || _place.isEmpty) {
      return;
    }

    final _student = StudentModel(
        name: _name,
        age: _age,
        phone: _phone,
        place: _place,
      
        i_mage: file!.path);

    addStudent(_student);
    print("$_ageController,$_name");
  }

  Future getpicture() async {
    var img = await image.pickImage(source: ImageSource.camera);
    setState(() {
      file = File(img!.path);
    });
  }

  Future getphotos() async {
    var img = await image.pickImage(source: ImageSource.gallery);
    setState(() {
      file = File(img!.path);
    });
  }
}

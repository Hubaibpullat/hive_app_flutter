import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:students/model/data_model.dart';
import 'package:students/screen/list_student.dart';
import '../db/functions/db_functions.dart';

// ignore: must_be_immutable
class EditDetails extends StatefulWidget {
  int index;
  var name;
  var age;
  var phone;
  var place;
  dynamic image;

  EditDetails({
    super.key,
    required this.index,
    required this.name,
    required this.age,
    required this.phone,
    required this.place,
    required this.image,
  });

  @override
  State<EditDetails> createState() => _EditDetailsState();
}

class _EditDetailsState extends State<EditDetails> {
  File? _file;

  TextEditingController _studentname = TextEditingController();
  TextEditingController _studentage = TextEditingController();
  TextEditingController _studentphone = TextEditingController();
  TextEditingController _studentplace = TextEditingController();
  String profilephoto = '';

  @override
  void initState() {
    super.initState();
    _studentname = TextEditingController(text: widget.name);
    _studentage = TextEditingController(text: widget.age);
    _studentphone = TextEditingController(text: widget.phone);
    _studentplace = TextEditingController(text: widget.place);
    profilephoto = widget.image;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Update details'),
          backgroundColor: Colors.teal[800],
        ),
        body: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.teal[800],
                  borderRadius: BorderRadius.circular(50)),
              child: IconButton(
                  onPressed: () {
                    getcam();
                  },
                  icon: Icon(Icons.camera_alt_outlined)),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                child: _file != null
                    ? CircleAvatar(
                        radius: 80,
                        child: SizedBox(
                          width: 150,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(110),
                            child: Image.file(
                              _file!,
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
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.teal[800],
                borderRadius: BorderRadius.circular(50),
              ),
              child: IconButton(
                  onPressed: () {
                    getimage();
                  },
                  icon: Icon(Icons.photo_sharp)),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
                controller: _studentname,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'name',
                )),
            SizedBox(
              height: 10,
            ),
            TextFormField(
                controller: _studentage,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'age',
                )),
            SizedBox(
              height: 10,
            ),
            TextFormField(
                controller: _studentphone,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'phone',
                )),
            SizedBox(
              height: 10,
            ),
            TextFormField(
                controller: _studentplace,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'place',
                )),
            SizedBox(
              height: 10,
            ),
            ElevatedButton.icon(
              onPressed: () => setState(() {
                updateall(context);
              }),
              icon: const Icon(Icons.flag),
              label: const Text('Update'),
              style: ElevatedButton.styleFrom(
                primary: Colors.teal[800],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> updateall(BuildContext context) async {
    final st_name = _studentname.text.trim();
    final st_age = _studentage.text.trim();
    final st_phone = _studentphone.text.trim();
    final st_place = _studentplace.text.trim();

    if (st_name.isEmpty ||
        st_age.isEmpty ||
        st_phone.isEmpty ||
        st_place.isEmpty) {
      return;
    } else {
      final updation = StudentModel(
          name: st_name,
          age: st_age,
          phone: st_phone,
          place: st_place,
          i_mage: "");

      editDetails(widget.index, updation);
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => ListStudentWidget()));

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.teal,
        content: Text('Updated'),
      ));
    }
  }

  getimage() async {
    final XFile? _wantimage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (_wantimage != null) {
      setState(() {
        _file = File(_wantimage.path);
        profilephoto = _wantimage.path;
      });
    }
  }

  getcam() async {
    final XFile? _wantimage =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (_wantimage != null) {
      setState(() {
        _file = File(_wantimage.path);
        profilephoto = _wantimage.path;
      });
    }
  }
}

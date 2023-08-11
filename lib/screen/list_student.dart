import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:students/db/functions/db_functions.dart';
import 'package:students/model/data_model.dart';
import 'package:students/screen/add_student.dart';
import 'package:students/screen/edit_student.dart';
import 'package:students/screen/view_details.dart';

class ListStudentWidget extends StatefulWidget {
  const ListStudentWidget({super.key});

  @override
  State<ListStudentWidget> createState() => _ListStudentWidgetState();
}

class _ListStudentWidgetState extends State<ListStudentWidget> {
  //final Box = Hive.box<StudentModel>('data');
  Widget build(BuildContext context) {
    getAllStudents();
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Colors.teal[800],
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => AddStudentWidget(),
              ));
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: ValueListenableBuilder(
          valueListenable: studentListNotifier,
          builder: (BuildContext ctx, List<StudentModel> studentList,
              Widget? child) {
            return ListView.separated(
              shrinkWrap: true,
              itemBuilder: (ctx, index) {
                final data = studentList[index];
                return ListTile(
                    title: Text(data.name),
                    subtitle: Text(data.place),
                    leading: CircleAvatar(
                      backgroundImage: FileImage(File(data.i_mage)),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            deletestudent(index);
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => EditDetails(
                                    index: index,
                                    name: data.name,
                                    age: data.age,
                                    phone: data.phone,
                                    place: data.phone,
                                    image: data.i_mage),
                              ));
                            },
                            icon: Icon(
                              Icons.edit,
                              color: Colors.green,
                            ))
                      ],
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => ViewDetails(
                              name: data.name,
                              age: data.age,
                              phone: data.phone,
                              place: data.place,
                              image: data.i_mage))));
                    });
              },
              separatorBuilder: (ctx, index) {
                return const Divider();
              },
              itemCount: studentList.length,
            );
          }),
          floatingActionButton: Icon(Icons.add,)
          
          ,
    );
  }
}

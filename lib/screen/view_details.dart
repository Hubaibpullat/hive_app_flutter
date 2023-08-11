import 'dart:io';

import 'package:flutter/material.dart';

class ViewDetails extends StatelessWidget {
  var name;
  var age;
  var phone;
  var place;
  String image;

  ViewDetails({
    super.key,
    required this.name,
    required this.age,
    required this.phone,
    required this.place,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal[800],
          title: Text('Details'),
        ),
        body: Container(
          color: Color.fromARGB(255, 255, 255, 255),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 75,
                backgroundImage: FileImage(File(image)),
              ),
              //  SizedBox(
              //   height:150,
              //   width: 150,

              //   child: ClipRRect(
              //     borderRadius: BorderRadius.circular(150),
              //     child: Image(image: FileImage(File(image)))),
              // ),
              Text(name),
              SizedBox(height: 10),
              Text(age),
              SizedBox(height: 10),
              Text(phone),
              SizedBox(height: 10),
              Text(place)
            ],
          ),
        ),
      ),
    );
  }
}

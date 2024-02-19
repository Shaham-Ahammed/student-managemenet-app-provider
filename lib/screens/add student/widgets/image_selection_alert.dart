

// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:student_app_provider/controllers/student_add_controller.dart';
import 'package:student_app_provider/screens/add%20student/functions/functions.dart';

class ImageContainer extends StatelessWidget {
  StudentAddController provider;
   ImageContainer({
    super.key,required this.provider
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      backgroundColor: Colors.cyan[50],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: const BorderSide(
                              width: 5, color: Colors.cyan)),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Text(
                                'Camera',
                                style: myStyle(
                                    18, FontWeight.bold, Colors.black),
                              ),
                              IconButton(
                                  onPressed: () {
                                   
                                    getImage( ImageSource.camera,provider);
                                    Navigator.of(context,
                                            rootNavigator: true)
                                        .pop();
                                  },
                                  icon: const Icon(
                                    Icons.camera_alt_outlined,
                                    size: 35,
                                    color: Colors.black,
                                  ))
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                'Gallery',
                                style: myStyle(
                                    18, FontWeight.bold, Colors.black),
                              ),
                              IconButton(
                                  onPressed: () {
                                  
                                    getImage( ImageSource.gallery,provider);
                                    Navigator.of(context,
                                            rootNavigator: true)
                                        .pop();
                                  },
                                  icon: const Icon(
                                    Icons.photo_outlined,
                                    size: 35,
                                    color: Colors.black,
                                  ))
                            ],
                          ),
                        ],
                      ),
                    ));
          },
          child: Center(
         
              child: Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.cyan),
                child: provider.imagpath.isEmpty
                    ? Image.asset(
                        'assets/users.png',
                        fit: BoxFit.cover,
                      )
                    : Image.file(
                        File(
                          provider.imagpath,
                        ),
                        fit: BoxFit.cover,
                      ),
              )
            
          ),
        ),
        const Positioned(
            right: 70,
            top: 100,
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Color.fromARGB(255, 10, 199, 251),
            )),
        const Positioned(
            right: 80, top: 107, child: Icon(Icons.add_a_photo))
      ],
    );
  }
}

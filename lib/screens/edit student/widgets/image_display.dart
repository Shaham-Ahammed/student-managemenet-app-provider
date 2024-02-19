// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:flutter/material.dart';

import 'package:student_app_provider/controllers/student_edit_controller.dart';

class ObxImageDisplay extends StatelessWidget {
  StudentEditController provider;
   ObxImageDisplay({
    super.key,
   required this.provider
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 160,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.transparent),
      child: Image.file(
        File(
          provider.imagpath,
        ),
        fit: BoxFit.cover,
      ),
    );
  }
}

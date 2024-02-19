// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:student_app_provider/controllers/student_edit_controller.dart';
import '../../add student/functions/functions.dart';

class RadioButton extends StatelessWidget {
  StudentEditController provider;
   RadioButton({
    super.key,
    required this.provider
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          'Select Gender :',
          style: myStyle(16, FontWeight.bold, Colors.black),
        ),
        Row(
          children: [
            Radio(
                activeColor: Colors.red,
                value: 'Male',
                groupValue: provider.groupValue,
                onChanged: (value) {
                  provider.selectGender(value!);
                }),
            Text('Male', style: myStyle(12, FontWeight.bold, Colors.black)),
            Radio(
                activeColor: Colors.red,
                value: 'Female',
                groupValue: provider.groupValue,
                onChanged: (value) {
                  provider.selectGender(value!);
                }),
            Text('Female', style: myStyle(12, FontWeight.bold, Colors.black))
          ],
        ),
      ],
    );
  }
}

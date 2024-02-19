// ignore_for_file: use_build_context_synchronously, must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_app_provider/controllers/student_add_controller.dart';
import 'package:student_app_provider/screens/add%20student/functions/functions.dart';

class AddStudentButtonAndFinalValidation extends StatelessWidget {
  StudentAddController provider;
  AddStudentButtonAndFinalValidation({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.cyan)),
        onPressed: () async {
          if (!provider.isPhotoSelected) {
            provider.showImageError();
          }
          if (provider.groupValue.isEmpty) {
            provider.showGenderError();
          }
          if (formKey.currentState!.validate() &&
              provider.isPhotoSelected == true &&
              provider.groupValue.isNotEmpty) {
            await addData(provider,context);
            
            Navigator.pop(context);
            //  addController.onClose();
          } else {
            return;
          }
        },
        child: Text(
          "ADD STUDENT",
          style: GoogleFonts.akayaKanadaka(),
        ));
  }
}

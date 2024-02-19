// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:student_app_provider/controllers/student_edit_controller.dart';
import 'package:student_app_provider/screens/edit%20student/functions/functions.dart';
import 'package:student_app_provider/screens/edit%20student/widgets/app_bar.dart';
import 'package:student_app_provider/screens/edit%20student/widgets/image_display.dart';
import 'package:student_app_provider/screens/edit%20student/widgets/image_selection_alert.dart';
import 'package:student_app_provider/screens/edit%20student/widgets/radio_buttons.dart';
import 'package:student_app_provider/screens/edit%20student/widgets/text_form_fields.dart';

class StudentEdit extends StatelessWidget {
  final int id;
  final String name;
  final String age;
  final String image;
  final String gender;
  final String phone;
  StudentEdit({
    super.key,
    required this.id,
    required this.name,
    required this.age,
    required this.image,
    required this.gender,
    required this.phone,
  }) {
    nameController = TextEditingController(text: name);
    ageController = TextEditingController(text: age);
    phoneController = TextEditingController(text: phone);
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    
    Provider.of<StudentEditController>(context, listen: false)
        .initialValues(groupValues: gender, imagePaths: image);

    StudentEditController stuEditProvider =
        Provider.of<StudentEditController>(context);

    return Scaffold(
      backgroundColor: Colors.cyan[100],
      appBar: appBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Stack(
            children: [
              GestureDetector(
                onTap: () {
                  imageSourceDialogue(context, stuEditProvider);
                },
                child: Center(
                  child: ObxImageDisplay(
                    provider: stuEditProvider,
                  ),
                ),
              ),
              const EditIconOnImage(),
              const Positioned(right: 79, top: 107, child: Icon(Icons.edit))
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Form(
            key: formKey,
            child: SizedBox(
                width: double.infinity,
                height: 360,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    NameTextFormField(nameController: nameController),
                    AgeTextFormField(ageController: ageController),
                    PhoneTextFormField(phoneController: phoneController),
                    RadioButton(
                      provider: stuEditProvider,
                    ),
                  ],
                )),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.cyan)),
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  await updateData(id, stuEditProvider, context);

                  Navigator.of(context).pop();
                }
              },
              child: Text(
                "EDIT STUDENT",
                style: GoogleFonts.akayaKanadaka(),
              ))
        ]),
      ),
    );
  }
}

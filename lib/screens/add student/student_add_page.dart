// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_app_provider/controllers/student_add_controller.dart';
import 'package:student_app_provider/screens/add%20student/functions/functions.dart';
import 'package:student_app_provider/screens/add%20student/widgets/add_student.dart';
import 'package:student_app_provider/screens/add%20student/widgets/appBar.dart';
import 'package:student_app_provider/screens/add%20student/widgets/error_displays.dart';
import 'package:student_app_provider/screens/add%20student/widgets/image_selection_alert.dart';
import 'package:student_app_provider/screens/add%20student/widgets/radio_buttons.dart';
import 'package:student_app_provider/screens/add%20student/widgets/text_form_fields.dart';

class StudentAdd extends StatelessWidget {
  const StudentAdd({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<StudentAddController>(context, listen: false).initialize();
    return Scaffold(
        backgroundColor: Colors.cyan[100],
        appBar: appBar(),
        body: Consumer<StudentAddController>(
          builder: (context, provider, _) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ImageContainer(
                      provider: provider,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ObxImageError(provider: provider),
                    Form(
                      key: formKey,
                      child: SizedBox(
                        width: double.infinity,
                        height: 360,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const NameField(),
                            const AgeField(),
                            const PhoneNumberField(),
                            RadioButtons(provider: provider),
                            GenderErrorDisplay(provider: provider)
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    AddStudentButtonAndFinalValidation(provider: provider)
                  ]),
            );
          },
        ));
  }
}

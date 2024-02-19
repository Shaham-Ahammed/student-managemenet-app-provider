
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_app_provider/controllers/student_edit_controller.dart';
import 'package:student_app_provider/db%20helper/db_helper.dart';
import 'package:student_app_provider/model/student_model.dart';


  TextEditingController nameController = TextEditingController();

  TextEditingController ageController = TextEditingController();

  TextEditingController phoneController = TextEditingController();


  myStyle(double size, FontWeight weight, Color clr) {
  return TextStyle(fontSize: size, fontWeight: weight, color: clr);
}


Future<void> updateData(int id,StudentEditController provider,context) async {
  
    StudentModel stu = StudentModel(
        name:  nameController.text,
        age: ageController.text,
        gender: provider.groupValue.toString(),
        images:provider.imagpath.toString(),
        phone: phoneController.text);

    await SQLHelper.updateData(id, stu,context);
  }

  void getImage(ImageSource imageSource,StudentEditController provider) async {
    final selectedImage = await ImagePicker().pickImage(source: imageSource);
    if (selectedImage != null) {
      provider.addImage(selectedImage.path);
    }
  }
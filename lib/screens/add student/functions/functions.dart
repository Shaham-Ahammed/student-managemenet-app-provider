
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_app_provider/controllers/student_add_controller.dart';
import 'package:student_app_provider/db%20helper/db_helper.dart';
import 'package:student_app_provider/model/student_model.dart';



  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController ageController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();
  
Future<void> addData(StudentAddController provider,context) async {
    StudentModel stu = StudentModel(
        name: nameController.text,
        age: ageController.text,
        gender: provider.groupValue.toString(),
        images: provider.imagpath.toString(),
        phone: phoneController.text);

    await SQLHelper.createData(stu,context);
  }

  myStyle(double size, FontWeight weight, Color clr) {
  return TextStyle(fontSize: size, fontWeight: weight, color: clr);
}

  void getImage(ImageSource imageSource, StudentAddController provider) async {
    final selectedImage = await ImagePicker().pickImage(source:imageSource);
    if (selectedImage != null) {
      provider.addimage(selectedImage.path);
    }
  }
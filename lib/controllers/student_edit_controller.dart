import 'package:flutter/material.dart';

class StudentEditController extends ChangeNotifier {
  String imagpath = '';
  String groupValue = '';
  String name = "";
  String age = "";
  String phone = "";

  void initialValues({
    required String imagePaths,
    required String groupValues,
  }) {
    imagpath = imagePaths;
 
    groupValue = groupValues;
    notifyListeners();
  }

  addImage(String imagePath) {
    imagpath = imagePath;
 notifyListeners();
  }

  selectGender(String value) {
    groupValue = value;
     notifyListeners();
  }
}

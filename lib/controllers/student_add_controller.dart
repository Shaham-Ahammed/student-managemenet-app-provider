
import 'package:flutter/material.dart';
import 'package:student_app_provider/screens/add%20student/functions/functions.dart';

class StudentAddController extends ChangeNotifier {
  String imagpath = '';
  bool imageErrorVisible = false;
  bool isPhotoSelected = false;
  String groupValue = '';
  bool genderErrorVisible = false;

 
  void initialize() {
    imagpath = '';
    
    imageErrorVisible = false;
   
    isPhotoSelected = false;
  
    groupValue = '';
     
    genderErrorVisible = false;
     
    nameController.clear();
   
    ageController.clear();
 
    phoneController.clear();
    notifyListeners();
  }

  addimage(String imagePath) {
    imagpath = imagePath;
    
    isPhotoSelected = true;
     notifyListeners();
  }

  showImageError() {
    imageErrorVisible = true;
     notifyListeners();
  }

  selectGender(String value) {
    groupValue =value;
 
    genderErrorVisible = false;
     notifyListeners();
  }

  showGenderError() {
    genderErrorVisible = true;
     notifyListeners();
  }
}

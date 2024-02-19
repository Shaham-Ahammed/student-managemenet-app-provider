// ignore_for_file: avoid_print

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:student_app_provider/db%20helper/db_helper.dart';
import 'package:student_app_provider/model/student_model.dart';

class StudentController extends ChangeNotifier {
  List<StudentModel> studentList = <StudentModel>[];
  List<StudentModel> filteredStudentList = <StudentModel>[];
  bool isLoading = false;

  void onInit() async {
    isLoading = true;
    notifyListeners();
    await fetchStudents();
    filteredStudentList = [...studentList];
    isLoading = false;
    notifyListeners();
  }

  fetchStudents() async {
    try {
      var studentsData = await SQLHelper.getAllData();
      List<StudentModel> students = studentsData.map((student) {
        return StudentModel(
            id: student['id'],
            name: student['name'],
            age: student['age'],
            gender: student['gender'],
            images: student['images'],
            phone: student['phone']);
      }).toList();
      studentList.clear();

      studentList.addAll(students);
      runFilter("");
      notifyListeners();

      print("hello $studentList");
    } catch (e) {
      log("error while fetching $e");
    }
  }

  runFilter(String query) {
    if (query.isEmpty) {
      filteredStudentList = [...studentList];
    } else {
      filteredStudentList = studentList
          .where((element) =>
              element.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}

// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:student_app_provider/controllers/student_controller.dart';

class SearchBox extends StatelessWidget {
  StudentController provider;
   SearchBox({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 15),
      child: TextField(
        onChanged: (value) => provider.runFilter(value),
        decoration: const InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.cyan, width: 1),
                borderRadius: BorderRadius.all(Radius.circular(15))),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))),
            labelText: "search",
            suffixIcon: Icon(Icons.search)),
      ),
    );
  }
}

// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:student_app_provider/controllers/student_add_controller.dart';


class GenderErrorDisplay extends StatelessWidget {
  StudentAddController provider;
   GenderErrorDisplay({
    super.key,
    required this.provider
  });

  @override
  Widget build(BuildContext context) {
 
      if (provider.genderErrorVisible &&
          provider.groupValue.isEmpty) {
        return const Text(
          'Please select a gender',
          style: TextStyle(color: Colors.red),
        );
      } else {
        return Container();
      }
    
  }
}

class ObxImageError extends StatelessWidget {
   StudentAddController provider;
   ObxImageError({
    super.key,
    required this.provider
  });

  @override
  Widget build(BuildContext context) {
    
      if (provider.imageErrorVisible &&
          provider.imagpath.isEmpty) {
        return const Text(
          'Please add a photo',
          style: TextStyle(color: Colors.red),
        );
      } else {
        return Container();
      }
    
  }
}
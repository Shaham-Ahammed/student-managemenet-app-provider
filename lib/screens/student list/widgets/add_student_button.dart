import 'package:flutter/material.dart';

import 'package:student_app_provider/screens/add%20student/student_add_page.dart';

class StudentAddButton extends StatelessWidget {
  
  const StudentAddButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => StudentAdd()));
      },
      child: const Icon(Icons.add),
    );
  }
}

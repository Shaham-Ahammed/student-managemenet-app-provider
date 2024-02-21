// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:student_app_provider/controllers/student_controller.dart';
import 'package:student_app_provider/screens/student%20list/widgets/add_student_button.dart';
import 'package:student_app_provider/screens/individual%20student/student_profile.dart';
import 'widgets/app_bar.dart';
import 'widgets/delete_button.dart';
import 'widgets/edit_student_button.dart';
import 'widgets/listtile_widgets.dart';
import 'widgets/search_box.dart';

class StudentList extends StatelessWidget {
  const StudentList({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<StudentController>(context, listen: false).onInit();
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 125, 233, 255),
        appBar: appBar(),
        body: Consumer<StudentController>(builder: (context, provider, _) {
          return provider.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : provider.studentList.isEmpty
                  ? Center(
                      child: Text(
                      "no students added",
                      style: TextStyle(
                          fontFamily: GoogleFonts.aboreto().fontFamily,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ))
                  : Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        SearchBox(
                          provider: provider,
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: provider.filteredStudentList.length,
                            itemBuilder: (context, index) => GestureDetector(
                              onTap: () async{
                                  FocusManager.instance.primaryFocus?.unfocus();
                                  await Future.delayed(const Duration(milliseconds: 100));
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => StudentProfile(
                                        id: provider
                                            .filteredStudentList[index].id!,
                                        name: provider
                                            .filteredStudentList[index].name,
                                        age: provider
                                            .filteredStudentList[index].age,
                                        images: provider
                                            .filteredStudentList[index].images,
                                        gender: provider
                                            .filteredStudentList[index].gender,
                                        phone: provider
                                            .filteredStudentList[index]
                                            .phone)));
                              },
                              child: Card(
                                color: Colors.cyan[100],
                                margin: const EdgeInsets.all(15),
                                child: ListTile(
                                  title: CardTitle(
                                      controller: provider, index: index),
                                  leading: CardImage(
                                      controller: provider, index: index),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      EditButton(
                                          controller: provider, index: index),
                                      deleteButton(provider, index, context),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    );
        }),
        floatingActionButton: const StudentAddButton());
  }
}

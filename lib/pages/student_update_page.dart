import 'package:crud_http/bloc/student_bloc.dart';
import 'package:crud_http/components/student_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudentUpdatePage extends StatelessWidget {
  StudentUpdatePage({super.key});

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController courseController = TextEditingController();
  TextEditingController yearController = TextEditingController();

  bool isEnrolled = false; // just need to have refference.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Update Student'),
          centerTitle: true,
          foregroundColor: Colors.white,
          backgroundColor: Colors.green,
        ),
        body: BlocConsumer<StudentBloc, StudentState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          buildWhen: (previous, current) =>
              current is StudentNavigateToUpdateFormState,
          builder: (context, state) {
            state as StudentNavigateToUpdateFormState;
            firstNameController.text = state.student.firstName;
            lastNameController.text = state.student.lastName;
            courseController.text = state.student.course;
            yearController.text = state.student.year;
            return StudentForm(
              page: "Update",
              formkey: formkey,
              firstNameController: firstNameController,
              lastNameController: lastNameController,
              courseController: courseController,
              runtimeType: runtimeType,
              yearController: yearController,
              isEnrolled: isEnrolled,
            );
          },
        ));
  }
}

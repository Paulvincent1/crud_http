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

  int? id;

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
          listenWhen: (previous, current) => current is StudentActionState,
          listener: (context, state) {
            if (state is StudentUpdateSucessState) {
              context.read<StudentBloc>().add(StudentFetchEvent(id: id!));
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    state.message,
                  ),
                  duration: Duration(
                    seconds: 2,
                  ),
                ),
              );
            }

            if (state is StudentUpdateFailedState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    state.errorMessage,
                  ),
                  duration: Duration(
                    seconds: 2,
                  ),
                ),
              );
            }
          },
          buildWhen: (previous, current) =>
              (current is StudentNavigateToUpdateFormState ||
                  current is StudentUpdateLoadingState ||
                  current is StudentUpdatePageState),
          builder: (context, state) {
            switch (state.runtimeType) {
              case StudentNavigateToUpdateFormState:
                state as StudentNavigateToUpdateFormState;
                id = state.student.id;
                firstNameController.text = state.student.firstName;
                lastNameController.text = state.student.lastName;
                courseController.text = state.student.course;
                yearController.text = state.student.year;
                return StudentForm(
                  id: id,
                  page: "Update",
                  formkey: formkey,
                  firstNameController: firstNameController,
                  lastNameController: lastNameController,
                  courseController: courseController,
                  runtimeType: runtimeType,
                  yearController: yearController,
                  isEnrolled: isEnrolled,
                );
              case StudentUpdateLoadingState:
                return Center(child: CircularProgressIndicator());
              default:
                print(state.runtimeType);
                return SizedBox();
            }
          },
        ));
  }
}

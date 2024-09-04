import 'package:crud_http/bloc/student_bloc.dart';
import 'package:crud_http/components/student_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddStudent extends StatefulWidget {
  AddStudent({
    super.key,
  });

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent>
    with AutomaticKeepAliveClientMixin {
  final _formkey = GlobalKey<FormState>();

  TextEditingController firstNameController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();

  TextEditingController courseController = TextEditingController();

  TextEditingController yearController = TextEditingController();

  bool isEnrolled = false;

  String? errorTextSelectedYear;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StudentBloc, StudentState>(
      listenWhen: (previous, current) => current is StudentAddPageState,
      listener: (context, state) {
        if (state is StudentPostSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.successMessage),
            duration: Duration(seconds: 2),
          ));
        } else if (state is StudentPostFailedState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.errorMessage),
            duration: Duration(seconds: 2),
          ));
        }
      },
      buildWhen: (previous, current) => current is StudentAddPageState,
      builder: (context, state) {
        switch (state.runtimeType) {
          case StudentPostLoadingState:
            return Center(child: CircularProgressIndicator());
          case StudentPostSuccessState || StudentPostFailedState:
            return StudentForm(
                page: "Add",
                formkey: _formkey,
                firstNameController: firstNameController,
                lastNameController: lastNameController,
                courseController: courseController,
                runtimeType: runtimeType,
                yearController: yearController,
                isEnrolled: isEnrolled);
          default:
            return StudentForm(
                page: "Add",
                formkey: _formkey,
                firstNameController: firstNameController,
                lastNameController: lastNameController,
                courseController: courseController,
                runtimeType: runtimeType,
                yearController: yearController,
                isEnrolled: isEnrolled);
        }
      },
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

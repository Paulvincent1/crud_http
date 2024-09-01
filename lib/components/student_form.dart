import 'package:crud_http/bloc/student_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudentForm extends StatelessWidget {
  const StudentForm({
    super.key,
    required GlobalKey<FormState> formkey,
    required this.firstNameController,
    required this.lastNameController,
    required this.courseController,
    required this.runtimeType,
    required this.yearController,
    required this.isEnrolled,
  }) : _formkey = formkey;

  final GlobalKey<FormState> _formkey;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController courseController;
  final Type runtimeType;
  final TextEditingController yearController;
  final bool isEnrolled;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
              child: TextFormField(
                controller: firstNameController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value?.length == 0) {
                    return "Please enter your first name";
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                  focusedErrorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  errorStyle: TextStyle(color: Colors.red),
                  filled: true,
                  fillColor: Colors.grey[300],
                  labelText: "First Name",
                  labelStyle: TextStyle(color: Colors.black),
                  hintText: 'First Name',
                  focusedBorder: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
              child: TextFormField(
                controller: lastNameController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value?.length == 0) {
                    return 'Please enter your last name';
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  focusedErrorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red)),
                  errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red)),
                  errorStyle: TextStyle(color: Colors.red),
                  filled: true,
                  fillColor: Colors.grey[300],
                  labelText: "Last Name",
                  labelStyle: TextStyle(color: Colors.black),
                  hintText: 'Last Name',
                  focusedBorder: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
              child: TextFormField(
                controller: courseController,
                onSaved: (newValue) => print(newValue),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value?.length == 0) {
                    return 'Please enter your course';
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  focusedErrorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  errorStyle: TextStyle(color: Colors.red),
                  filled: true,
                  fillColor: Colors.grey[300],
                  labelText: "Course",
                  labelStyle: TextStyle(color: Colors.black),
                  hintText: 'Course',
                  focusedBorder: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
              child: BlocBuilder<StudentBloc, StudentState>(
                buildWhen: (previous, current) =>
                    current is StudentSelectYearState,
                builder: (context, state) {
                  switch (state.runtimeType) {
                    case StudentSelectYearState:
                      state as StudentSelectYearState;
                      return DropdownMenu(
                        controller: yearController,
                        errorText: state.errorTextSelectedYear,
                        onSelected: (value) {
                          context.read<StudentBloc>().add(
                              StudentSelectedYearEvent(
                                  errorTextSelectedYear: null));
                        },
                        label: const Text('Select Year'),
                        dropdownMenuEntries: const [
                          DropdownMenuEntry(
                              value: "First Year", label: 'First Year'),
                          DropdownMenuEntry(
                              value: "Second Year", label: 'Second Year'),
                          DropdownMenuEntry(
                              value: "Third Year", label: 'Third Year'),
                          DropdownMenuEntry(
                              value: "Fourth Year", label: 'Fourth Year'),
                          DropdownMenuEntry(
                              value: "Fifth Year", label: 'Fifth Year'),
                        ],
                      );
                    default:
                      return DropdownMenu(
                        controller: yearController,
                        errorText: null,
                        onSelected: (value) {
                          context.read<StudentBloc>().add(
                              StudentSelectedYearEvent(
                                  errorTextSelectedYear: null));
                        },
                        label: const Text('Select Year'),
                        dropdownMenuEntries: const [
                          DropdownMenuEntry(
                              value: "First Year", label: 'First Year'),
                          DropdownMenuEntry(
                              value: "Second Year", label: 'Second Year'),
                          DropdownMenuEntry(
                              value: "Third Year", label: 'Third Year'),
                          DropdownMenuEntry(
                              value: "Fourth Year", label: 'Fourth Year'),
                          DropdownMenuEntry(
                              value: "Fifth Year", label: 'Fifth Year'),
                        ],
                      );
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                children: [
                  const Text('Enrolled'),
                  const SizedBox(
                    width: 10,
                  ),
                  BlocBuilder<StudentBloc, StudentState>(
                    buildWhen: (previous, current) =>
                        current is StudentEnrolledSwitchState,
                    builder: (context, state) {
                      switch (state.runtimeType) {
                        case StudentEnrolledSwitchState:
                          state as StudentEnrolledSwitchState;
                          return Switch(
                            activeColor: Colors.green,
                            value: state.isEnrolled,
                            onChanged: (value) {
                              context.read<StudentBloc>().add(
                                  StudentEnrolledSwitchEvent(
                                      isEnrolled: value));
                            },
                          );
                        default:
                          return Switch(
                            value: false,
                            onChanged: (value) {
                              context.read<StudentBloc>().add(
                                  StudentEnrolledSwitchEvent(
                                      isEnrolled: value));
                            },
                          );
                      }
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 36.0),
                      child: ElevatedButton(
                        onPressed: () {
                          var valid = _formkey.currentState?.validate();
                          print("is it valid? ${valid}");
                          if (yearController.text.isNotEmpty) {
                            if (valid!) {
                              // _formkey.currentState?.save();
                              context.read<StudentBloc>().add(StudentPostEvent(
                                  firstname: firstNameController.text,
                                  lastname: lastNameController.text,
                                  course: courseController.text,
                                  year: yearController.text,
                                  enrolled: isEnrolled ? 1 : 0));

                              clear();
                            }
                          } else {
                            context.read<StudentBloc>().add(
                                StudentSelectedYearEvent(
                                    errorTextSelectedYear:
                                        'Please select a year'));
                          }
                        },
                        child: Text('Add'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green[200],
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0)),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void clear() {
    firstNameController.clear();
    lastNameController.clear();
    yearController.clear();
    courseController.clear();
  }
}

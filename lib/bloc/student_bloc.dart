import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:crud_http/model/student.dart';
import 'package:crud_http/pages/student_info_page.dart';
import 'package:crud_http/services/student_services.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'student_event.dart';
part 'student_state.dart';

class StudentBloc extends Bloc<StudentEvent, StudentState> {
  StudentBloc() : super(StudentInitial()) {
    on<StudentEvent>(studentEvent);
    on<StudentsFetchEvent>(studentsFetchEvent);
    on<StudentPostEvent>(studentPostEvent);
    on<StudentSelectedYearEvent>(studentSelectedYearEvent);
    on<StudentEnrolledSwitchEvent>(studentEnrolledSwitchEvent);
    on<StudentClickStudentEvent>(studentClickStudentEvent);
    on<StudentClickStudentUpdateButtonEvent>(
        studentClickStudentUpdateButtonEvent);
    on<StudentPutUpdateEvent>(studentPutUpdateEvent);
    on<StudentFetchEvent>(studentFetchEvent);
    on<StudentDeleteClickButtonEvent>(studentDeleteClickButtonEvent);
  }

  FutureOr<void> studentEvent(StudentEvent event, Emitter<StudentState> emit) {}

  FutureOr<void> studentsFetchEvent(
      StudentsFetchEvent event, Emitter<StudentState> emit) async {
    emit(StudentFetchLoadingState());

    try {
      final students = await StudentServices.fetchStudents();

      emit(StudentFetchSuccessState(students: students));
    } catch (e) {
      emit(StudentFetchFailedState(error: "${e}"));
    }
  }

  // Add student page
  FutureOr<void> studentPostEvent(
      StudentPostEvent event, Emitter<StudentState> emit) async {
    emit(StudentPostLoadingState());

    try {
      final response = await StudentServices.postStudent(
          firstname: event.firstname,
          lastname: event.lastname,
          course: event.course,
          year: event.year,
          enrolled: event.enrolled);

      if (response) {
        emit(StudentPostSuccessState(successMessage: 'Successfully Added!'));
      } else {
        emit(StudentPostFailedState(errorMessage: 'Cannot Add Student!'));
      }
    } catch (e) {
      emit(StudentPostFailedState(errorMessage: '${e}'));
    }
  }

  FutureOr<void> studentSelectedYearEvent(
      StudentSelectedYearEvent event, Emitter<StudentState> emit) {
    emit(StudentSelectYearState(
        errorTextSelectedYear: event.errorTextSelectedYear));
  }

  FutureOr<void> studentEnrolledSwitchEvent(
      StudentEnrolledSwitchEvent event, Emitter<StudentState> emit) {
    emit(StudentEnrolledSwitchState(isEnrolled: event.isEnrolled));
  }

  FutureOr<void> studentClickStudentEvent(
      StudentClickStudentEvent event, Emitter<StudentState> emit) async {
    emit(StudentNavigateToStudentDataState(student: event.student));
    // try {
    //   final student = await StudentServices.fetchStudent(id: event.id);
    //   emit(StudentNavigateToStudentDataState(student: student));
    // } catch (e) {
    //   emit(StudentNavigateToStudentDataFailedState(errorMessage: '${e}'));
    // }
  }

  FutureOr<void> studentClickStudentUpdateButtonEvent(
      StudentClickStudentUpdateButtonEvent event, Emitter<StudentState> emit) {
    emit(StudentNavigateToUpdateFormState(student: event.student));
  }

  FutureOr<void> studentPutUpdateEvent(
      StudentPutUpdateEvent event, Emitter<StudentState> emit) async {
    emit(StudentUpdateLoadingState());
    try {
      var response = await StudentServices.updateStudent(
        id: event.id,
        firstName: event.firstname,
        lastName: event.lastname,
        course: event.course,
        year: event.year,
        enrolled: event.enrolled,
      );
      if (response) {
        emit(StudentUpdateSucessState(message: 'Successfully Updated!'));
      } else {
        emit(StudentUpdateFailedState(errorMessage: 'Cant Update Student!'));
      }
    } catch (e) {
      emit(StudentUpdateFailedState(errorMessage: '${e}'));
    }
  }

  FutureOr<void> studentFetchEvent(
      StudentFetchEvent event, Emitter<StudentState> emit) async {
    emit(StudentFetchOneLoadingState());
    try {
      var response = await StudentServices.showStudent(id: event.id);
      emit(StudentFetchOneSuccessState(student: response));
    } catch (e) {
      emit(StudentFetchOneFailedState(errorMessage: '${e}'));
    }
  }

  FutureOr<void> studentDeleteClickButtonEvent(
      StudentDeleteClickButtonEvent event, Emitter<StudentState> emit) async {
    emit(StudentDeleteLoadingState());
    try {
      var response = await StudentServices.deleteStudent(id: event.id);

      if (response) {
        emit(StudentDeleteSuccessState());
      } else {
        emit(StudentDeleteFailedState(errorMessage: 'Cant Delete Student!'));
      }
    } catch (e) {
      emit(StudentDeleteFailedState(errorMessage: '${e}'));
    }
  }
}

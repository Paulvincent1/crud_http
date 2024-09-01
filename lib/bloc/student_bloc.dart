import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:crud_http/model/student.dart';
import 'package:crud_http/services/student_services.dart';
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

      emit(StudentPostSuccessState(successMessage: 'Successfully Added!'));
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
}

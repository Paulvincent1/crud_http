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
    on<StudentAddStudentEvent>(studentAddStudentEvent);
  }

  FutureOr<void> studentEvent(StudentEvent event, Emitter<StudentState> emit) {}

  FutureOr<void> studentsFetchEvent(
      StudentsFetchEvent event, Emitter<StudentState> emit) async {
    emit(StudentFetchLoadingState());

    try {
      final students = await StudentServices.fetchStudents();

      emit(StudentFetchSuccessState(students: students));
    } catch (e) {
      emit(StudentFetchFailedState(error: "from failed state ${e}")
        ..printError());
    }
  }

  FutureOr<void> studentAddStudentEvent(
      StudentAddStudentEvent event, Emitter<StudentState> emit) async {
    emit(StudentPostLoadingState()..test());
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'student_bloc.dart';

@immutable
sealed class StudentState {}

class StudentActionState extends StudentState {}

class StudentAddPageState extends StudentState {}

class StudentActionAndBuildState extends StudentState {}

class StudentUpdatePageState extends StudentState {}

final class StudentInitial extends StudentState {}

class StudentFetchLoadingState extends StudentState {}

class StudentFetchSuccessState extends StudentState {
  final List<Student> students;
  StudentFetchSuccessState({
    required this.students,
  });
}

class StudentFetchFailedState extends StudentActionAndBuildState {
  final String error;
  StudentFetchFailedState({
    required this.error,
  });
}

// Add student page page

class StudentPostLoadingState extends StudentAddPageState {}

class StudentPostSuccessState extends StudentAddPageState {
  String successMessage;
  StudentPostSuccessState({
    required this.successMessage,
  });
}

class StudentPostFailedState extends StudentAddPageState {
  String errorMessage;
  StudentPostFailedState({
    required this.errorMessage,
  });
}

class StudentSelectYearState extends StudentActionState {
  final String? errorTextSelectedYear;
  StudentSelectYearState({required this.errorTextSelectedYear});
}

class StudentEnrolledSwitchState extends StudentActionState {
  bool isEnrolled = false;
  StudentEnrolledSwitchState({required this.isEnrolled});
}

// navigate to student data
class StudentNavigateToStudentDataState extends StudentActionState {
  Student student;
  StudentNavigateToStudentDataState({
    required this.student,
  });
}

// class StudentNavigateToStudentDataFailedState extends StudentActionState {
//   String errorMessage;
//   StudentNavigateToStudentDataFailedState({
//     required this.errorMessage,
//   });
// }

class StudentNavigateToUpdateFormState extends StudentActionState {
  Student student;
  StudentNavigateToUpdateFormState({
    required this.student,
  });
}

class StudentUpdateLoadingState extends StudentUpdatePageState {}

class StudentUpdateSucessState extends StudentActionState {
  String message;
  StudentUpdateSucessState({
    required this.message,
  });
}

class StudentUpdateFailedState extends StudentActionState {
  String errorMessage;
  StudentUpdateFailedState({
    required this.errorMessage,
  });
}

class StudentFetchOneSuccessState extends StudentUpdatePageState {
  Student student;
  StudentFetchOneSuccessState({
    required this.student,
  });
}

class StudentFetchOneLoadingState extends StudentUpdatePageState {}

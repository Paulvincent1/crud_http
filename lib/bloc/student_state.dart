// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'student_bloc.dart';

@immutable
sealed class StudentState {}

class StudentActionState extends StudentState {}

class StudentActionAndBuildState extends StudentState {}

final class StudentInitial extends StudentState {}

class StudentFetchLoadingState extends StudentState {}

class StudentFetchSuccessState extends StudentState {
  List<Student> students;
  StudentFetchSuccessState({
    required this.students,
  });
}

class StudentFetchFailedState extends StudentActionAndBuildState {
  String error;
  StudentFetchFailedState({
    required this.error,
  });
}

class StudentPostLoadingState extends StudentActionState {}

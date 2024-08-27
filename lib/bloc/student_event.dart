part of 'student_bloc.dart';

@immutable
sealed class StudentEvent {}

class StudentsFetchEvent extends StudentEvent {}

class StudentAddStudentEvent extends StudentEvent {}

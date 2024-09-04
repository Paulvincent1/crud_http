// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'student_bloc.dart';

@immutable
sealed class StudentEvent {}

class StudentsFetchEvent extends StudentEvent {}

// Add student page
class StudentSelectedYearEvent extends StudentEvent {
  final String? errorTextSelectedYear;

  StudentSelectedYearEvent({required this.errorTextSelectedYear});
}

class StudentEnrolledSwitchEvent extends StudentEvent {
  final bool isEnrolled;
  StudentEnrolledSwitchEvent({required this.isEnrolled});
}

class StudentPostEvent extends StudentEvent {
  String firstname;
  String lastname;
  String course;
  String year;
  int enrolled;
  StudentPostEvent(
      {required this.firstname,
      required this.lastname,
      required this.course,
      required this.year,
      required this.enrolled});
}

class StudentClickStudentEvent extends StudentEvent {
  Student student;
  StudentClickStudentEvent({
    required this.student,
  });
}

class StudentClickStudentUpdate extends StudentEvent {
  Student student;
  StudentClickStudentUpdate({
    required this.student,
  });
}

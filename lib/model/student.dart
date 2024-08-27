// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Student {
  String firstName;
  String lastName;
  String course;
  String year;
  int enrolled;
  Student({
    required this.firstName,
    required this.lastName,
    required this.course,
    required this.year,
    required this.enrolled,
  });

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      firstName: map['first_name'] as String,
      lastName: map['last_name'] as String,
      course: map['course'] as String,
      year: map['year'] as String,
      enrolled: map['enrolled'] as int,
    );
  }
}

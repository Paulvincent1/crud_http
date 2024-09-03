// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Student {
  int id;
  String firstName;
  String lastName;
  String course;
  String year;
  int enrolled;
  Student({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.course,
    required this.year,
    required this.enrolled,
  });

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      id: map['id'] as int,
      firstName: map['first_name'] as String,
      lastName: map['last_name'] as String,
      course: map['course'] as String,
      year: map['year'] as String,
      enrolled: map['enrolled'] as int,
    );
  }
}

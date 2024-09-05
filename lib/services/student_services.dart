import 'dart:convert';

import 'package:crud_http/bloc/student_bloc.dart';
import 'package:crud_http/model/student.dart';
import 'package:http/http.dart';

class StudentServices {
  static const url = "http://192.168.0.13/api";

  static Future<List<Student>> fetchStudents() async {
    try {
      var response = await get(
        Uri.parse('${url}/students'),
      );

      if (response.statusCode == 200) {
        var jsonList = jsonDecode(response.body);

        print(jsonList);

        var students =
            jsonList.map<Student>((e) => Student.fromMap(e)).toList();

        return students;
      } else {
        throw Exception('Failed to load students: ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future<bool> postStudent(
      {required String firstname,
      required String lastname,
      required String course,
      required String year,
      required int enrolled}) async {
    try {
      final response = await post(Uri.parse('${url}/student/create'), body: {
        'first_name': firstname,
        'last_name': lastname,
        'course': course,
        'year': year,
        'enrolled': enrolled.toString()
      });

      if (response.statusCode == 201) {
        return true;
      }
      return false;
    } catch (e) {
      throw Exception('Failed to load students: ${e}');
    }
  }

  static Future<Student> showStudent({required int id}) async {
    try {
      var response = await get(Uri.parse('${url}/student/${id}'));

      if (response.statusCode == 200) {
        var jsonMap = json.decode(response.body);
        var student = Student.fromMap(jsonMap);

        return student;
      } else {
        throw Exception('Failed to load student: ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future<bool> updateStudent({
    required int id,
    required String firstName,
    required String lastName,
    required String course,
    required String year,
    required int enrolled,
  }) async {
    try {
      var response = await put(
        Uri.parse('${url}/student/update/${id}'),
        body: {
          'first_name': firstName,
          'last_name': lastName,
          'course': course,
          'year': year,
          'enrolled': enrolled.toString(),
        },
      );

      if (response.statusCode == 202) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw ('Failed to update student details: ${e}');
    }
  }

  static Future<bool> deleteStudent({required int id}) async {
    try {
      var response = await delete(Uri.parse('${url}/student/delete/${id}'));

      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      return throw Exception('Cant Delete!: ${e}');
    }
  }
}

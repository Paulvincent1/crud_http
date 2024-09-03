import 'dart:convert';

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

  static Future<Student> updateStudent({required int id}) async {
    try {
      var response = await get(Uri.parse('${url}/student/upadate/${id}'));

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
}

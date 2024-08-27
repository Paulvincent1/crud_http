import 'dart:convert';

import 'package:crud_http/model/student.dart';
import 'package:http/http.dart';

class StudentServices {
  static const url = "http://192.168.0.13/api/students";

  static Future<List<Student>> fetchStudents() async {
    try {
      var response = await get(
        Uri.parse(StudentServices.url),
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
}

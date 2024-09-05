import 'package:crud_http/bloc/student_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudentCard extends StatelessWidget {
  final state;
  StudentCard({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Student Information'),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Student\'s First Name:',
                    style: TextStyle(fontSize: 15, color: Colors.green[600]),
                  ),
                  Text(
                    state.student.firstName,
                    style: TextStyle(fontSize: 20, color: Colors.grey[600]),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Student\'s Last Name:',
                    style: TextStyle(fontSize: 15, color: Colors.green[600]),
                  ),
                  Text(
                    state.student.lastName,
                    style: TextStyle(fontSize: 20, color: Colors.grey[600]),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Course:',
                      style: TextStyle(fontSize: 15, color: Colors.green[600])),
                  Text(state.student.course,
                      style: TextStyle(fontSize: 20, color: Colors.grey[600])),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Year:',
                      style: TextStyle(fontSize: 15, color: Colors.green[600])),
                  Text(state.student.year,
                      style: TextStyle(fontSize: 20, color: Colors.grey[600])),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Enrolled:',
                      style: TextStyle(fontSize: 15, color: Colors.green[600])),
                  Text(state.student.enrolled == 1 ? "Yes" : "No",
                      style: TextStyle(fontSize: 20, color: Colors.grey[600])),
                ],
              ),
            ],
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(100, 40),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0)),
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    context.read<StudentBloc>().add(
                        StudentClickStudentUpdateButtonEvent(
                            student: state.student));
                  },
                  child: Text('Update'),
                ),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0)),
                    minimumSize: const Size(100, 40),
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    context.read<StudentBloc>().add(
                        StudentDeleteClickButtonEvent(id: state.student.id));
                  },
                  child: Text('Delete'),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}

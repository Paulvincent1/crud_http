import 'package:crud_http/bloc/student_bloc.dart';
import 'package:crud_http/main.dart';
import 'package:crud_http/pages/add_student_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'students_page.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: Colors.green[400],
          title: Text('CRUD API'),
          centerTitle: true,
          bottom: TabBar(
              indicatorColor: Colors.black,
              labelStyle: TextStyle(
                color: Colors.white,
              ),
              tabs: [
                Tab(
                  child: Text('Students'),
                ),
                Tab(
                  child: Text('Add Student'),
                ),
              ]),
        ),
        body: TabBarView(
          children: [
            StudentPage(),
            AddStudent(),
          ],
        ),
      ),
    );
  }
}

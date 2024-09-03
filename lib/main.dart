import 'package:crud_http/bloc/student_bloc.dart';
import 'package:crud_http/pages/main_page.dart';
import 'package:crud_http/pages/student_info_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => StudentBloc()..add(StudentsFetchEvent()),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/student-info': (context) => StudentInfo(),
      },
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

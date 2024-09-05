import 'package:crud_http/bloc/student_bloc.dart';
import 'package:crud_http/components/student_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudentInfoPage extends StatelessWidget {
  const StudentInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Info'),
        centerTitle: true,
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                )
              ],
            ),
            width: double.infinity,
            child: BlocConsumer<StudentBloc, StudentState>(
              listenWhen: (previous, current) =>
                  current is StudentActionState ||
                  current is StudentDeleteState,
              listener: (context, state) {
                if (state is StudentNavigateToUpdateFormState) {
                  Navigator.pushNamed(context, '/student-update');
                }

                if (state is StudentFetchOneFailedState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.errorMessage),
                      duration: Duration(seconds: 2),
                    ),
                  );
                }

                if (state is StudentDeleteFailedState) {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(state.errorMessage),
                    duration: Duration(seconds: 2),
                  ));
                }

                if (state is StudentDeleteSuccessState) {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Sucessfully Deleted!"),
                    duration: Duration(seconds: 2),
                  ));
                }
              },
              buildWhen: (previous, current) =>
                  current is StudentNavigateToStudentDataState ||
                  current is StudentUpdatePageState ||
                  current is StudentDeleteLoadingState,
              builder: (context, state) {
                switch (state.runtimeType) {
                  case StudentDeleteLoadingState:
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  case StudentFetchOneLoadingState:
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  case StudentNavigateToStudentDataState:
                    state as StudentNavigateToStudentDataState;
                    return StudentCard(
                      state: state,
                    );
                  case StudentFetchOneSuccessState:
                    state as StudentFetchOneSuccessState;
                    return StudentCard(
                      state: state,
                    );
                  default:
                    return Center(
                      child: Text('default student info page'),
                    );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

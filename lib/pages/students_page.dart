import 'package:crud_http/bloc/student_bloc.dart';
import 'package:crud_http/model/student.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudentPage extends StatefulWidget {
  const StudentPage({
    super.key,
  });

  @override
  State<StudentPage> createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    print('buildersdasdas');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Text('Student Lists 🔥'),
        ),
        Expanded(
          child: Container(
            child: BlocConsumer<StudentBloc, StudentState>(
              listenWhen: (previous, current) =>
                  current is StudentActionState ||
                  current is StudentActionAndBuildState ||
                  current is StudentFetchOneSuccessState ||
                  current is StudentPostSuccessState,
              listener: (context, state) {
                if (state is StudentFetchFailedState) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(state.error),
                    duration: Duration(seconds: 2),
                  ));
                }

                if (state is StudentNavigateToStudentDataState) {
                  Navigator.pushNamed(context, '/student-info');
                }

                if (state is StudentFetchOneSuccessState) {
                  // for updating the student it needs to update the list.
                  context.read<StudentBloc>().add(StudentsFetchEvent());
                }

                if(state is StudentPostSuccessState){
                  //for adding a student it needs to update the list.
                  context.read<StudentBloc>().add(StudentsFetchEvent());
                }
              },
              buildWhen: (previous, current) {
                print(
                    'build when ${(current is! StudentActionState && current is! StudentAddPageState) || current is StudentActionAndBuildState}');
                return (current is! StudentActionState &&
                        current is! StudentAddPageState &&
                        current is! StudentUpdatePageState) ||
                    current is StudentActionAndBuildState;
              },
              builder: (context, state) {
                print(state);
                switch (state.runtimeType) {
                  case StudentFetchLoadingState:
                    return Center(child: CircularProgressIndicator());
                  case StudentFetchSuccessState:
                    state as StudentFetchSuccessState;
                    return RefreshIndicator(
                      color: Colors.white,
                      backgroundColor: Colors.green,
                      onRefresh: () async {
                        context.read<StudentBloc>().add(StudentsFetchEvent());
                      },
                      child: ListView.builder(
                        itemCount: state.students.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              context.read<StudentBloc>().add(
                                  StudentClickStudentEvent(
                                      student: state.students[index]));
                            },
                            child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 18.0, vertical: 8),
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.green[200],
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 18.0),
                                          child: Container(
                                            alignment: Alignment.center,
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Text(
                                                  "${state.students[index].firstName} ${state.students[index].lastName}"),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                          );
                        },
                      ),
                    );
                  case StudentFetchFailedState:
                    return Center(
                      child: ElevatedButton(
                        onPressed: () {
                          context.read<StudentBloc>().add(StudentsFetchEvent());
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5))),
                        child: Text("Error: Click to Refresh"),
                      ),
                    );
                  default:
                    return Center(
                      child: Text('default student page'),
                    );
                }
              },
            ),
          ),
        ),
      ],
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

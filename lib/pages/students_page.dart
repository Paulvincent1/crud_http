import 'package:crud_http/bloc/student_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Student extends StatelessWidget {
  const Student({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
              listenWhen: (previous, current) => current is StudentActionState,
              listener: (context, state) {
                // Perform action based on state change
                if (state is StudentPostLoadingState) {
                  // This will be triggered when the StudentInitial state is encountered
                  print('Initial state received');
                }
              },
              buildWhen: (previous, current) => current is! StudentActionState,
              builder: (context, state) {
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
                          return Padding(
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
                              ));
                        },
                      ),
                    );
                  default:
                    return SizedBox();
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

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
          children: [Student(), Text('d')],
        ),
      ),
    );
  }
}

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
            child: ListView.builder(
              itemCount: 4,
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
                          Text('Hannah Laurice De Villena'),
                        ],
                      ),
                    ));
              },
            ),
          ),
        ),
      ],
    );
  }
}

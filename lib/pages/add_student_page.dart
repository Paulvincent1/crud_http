import 'package:flutter/material.dart';

class AddStudent extends StatelessWidget {
  const AddStudent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Stack(
            children: [
              Positioned(
                child: Align(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18.0, vertical: 8),
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[300],
                        labelText: "First Name",
                        labelStyle: TextStyle(color: Colors.black),
                        hintText: 'First Name',
                        focusedBorder: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18.0, vertical: 8),
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[300],
                        labelText: "Last Name",
                        labelStyle: TextStyle(color: Colors.black),
                        hintText: 'Last Name',
                        focusedBorder: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18.0, vertical: 8),
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[300],
                        labelText: "Course",
                        labelStyle: TextStyle(color: Colors.black),
                        hintText: 'Course',
                        focusedBorder: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18.0, vertical: 8.0),
                    child: DropdownMenu(
                        onSelected: (year) {
                          print(year);
                        },
                        label: Text('Select Year'),
                        dropdownMenuEntries: [
                          DropdownMenuEntry(
                              value: "First Year", label: 'First Year'),
                          DropdownMenuEntry(
                              value: "Second Year", label: 'Second Year'),
                          DropdownMenuEntry(
                              value: "Third Year", label: 'Third Year'),
                          DropdownMenuEntry(
                              value: "Fourth Year", label: 'Fourth Year'),
                          DropdownMenuEntry(
                              value: "Fifth Year", label: 'Fifth Year'),
                        ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Row(
                      children: [
                        Text('Enrolled'),
                        SizedBox(
                          width: 10,
                        ),
                        Switch(
                          value: false,
                          onChanged: (value) {},
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('data'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green[200],
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0)),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

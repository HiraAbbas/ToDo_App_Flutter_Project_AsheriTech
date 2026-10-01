import 'package:flutter/material.dart';
import 'package:todo_ui_app/views/model_class.dart';
import 'package:todo_ui_app/views/second_screen.dart';
import 'package:todo_ui_app/views/third_screen.dart';

// ignore: camel_case_types
class frontPage extends StatefulWidget {
  const frontPage({super.key});

  @override
  State<frontPage> createState() => _frontPageState();
}

class _frontPageState extends State<frontPage> {
  final List<Student> students = [
    Student(name: "Hira", fatherName: "Abbas"), //subjects: "Maths"),
    Student(name: "Ali", fatherName: "Ahmed"), //subjects: "Maths"),
    Student(name: "Usman", fatherName: "Khan"), //subjects: ["Maths"]),
    Student(name: "Hamza", fatherName: "Abbas"), // subjects: ["Urdu"]),
  ];
  //---------------only add int index as a parameter------------//
  // void editStudents(Student editModel, int index) async {
  //   final result = await Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => editPage(editModel: editModel)),
  //   );
  //   print("edit result $result");

  //   setState(() {
  //     students[index] = result;
  //   });
  // }

  //--------------perform list operation using indexwhere ------------//
  void editStudents(Student editModel) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => editPage(editModel: editModel)),
    );
    int foundIndex = students.indexWhere((student) => student.id == result.id);
    print("updated name after edit result \n${result.name}");

    setState(() {
      students[foundIndex] = result;
    });
  }

  void addStudents({required String name, required String fatherName}) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SecondScreen()),
    );

    setState(() {
      students.add(result);
    });
  }

  //-------------positioned argument-------------//
  // void removeStudents(int index) {
  //   setState(() {
  //     students.removeAt(index);
  //   });
  // }

  //-------------named argument-------------//
  void removeStudents({required int index}) {
    setState(() {
      students.removeAt(index);
    });
  }

  // void addStudents() {
  //   setState(() {
  //     students.add(
  //       Student(
  //         //${students.length + 1}
  //         name: "New Student",
  //         fatherName: "New Father Name",
  //       ),
  //     );
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Todo"), centerTitle: true),
      body: Container(
        // backgroundColor: Colors.orange[300],
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Students (${students.length})"),
            //const Text("Students"),
            const SizedBox(height: 20, width: 2),
            //Expanded(child: listviewComponent()),
            Expanded(child: listviewComponent()),
            //const SizedBox(height: 10, width: 2),
            // Expanded(child: listviewComponent()),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addStudents(name: "", fatherName: "");
        },

        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,

        child: const Icon(Icons.add, color: Colors.white),
      ),
      // bottomNavigationBar: BottomAppBar(
      //   floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     addStudents();
      //   },
      //   child: const Icon(Icons.add),
      // ),
      // ),
    );
  }

  Widget listviewComponent() {
    return ListView.builder(
      itemCount: students.length,
      itemBuilder: (context, index) {
        Student student = students[index];

        return Container(
          width: double.infinity,
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.blueGrey.shade200),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.08),
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              // Student details on left
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ID: ${student.id}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Name: ${student.name}',
                      style: const TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Father Name: ${student.fatherName}',
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),

              // Edit and Delete on right
              Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.blueGrey,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          onPressed: () {
                            editStudents(student);
                          },
                          icon: const Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          onPressed: () {
                            removeStudents(index: index);
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Edit     Delete',
                    style: TextStyle(fontSize: 11, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
// // Widget containerComponent() {
//   return Container(
//     width: double.infinity,
//     padding: const EdgeInsets.all(10),
//     decoration: BoxDecoration(border: Border.all(color: Colors.red)),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: const [Text("name"), Text("Class")],
//         ),
//         const Text("Register"),
//       ],
//     ),
//   );
// }

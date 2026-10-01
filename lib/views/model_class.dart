import 'dart:math';

class Student {
  int id;
  String name;
  String fatherName;
  List<String>? subjects;

  Student({
    int? id,
    required this.name,
    required this.fatherName,
    this.subjects,
  }) : id = id ?? Random().nextInt(1000);
}

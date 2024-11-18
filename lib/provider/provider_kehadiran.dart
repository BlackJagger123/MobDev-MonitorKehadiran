import 'package:flutter/material.dart';
import 'package:app_mon_siswa/models/student.dart';

class ProviderKehadiran extends ChangeNotifier {
  List<Student> students = [
    Student(name: 'Ali'),
    Student(name: 'Budi'),
    Student(name: 'Citra'),
  ];

  List<Map<String, dynamic>> history = [];

  void toggleKehadiran(int index, bool isPresent) {
    students[index].isPresent = isPresent;
    notifyListeners();
  }

  void simpanKehadiran() {
    int presentCount = students.where((student) => student.isPresent).length;
    int absentCount = students.length - presentCount;

    history.insert(0, {
      'date': DateTime.now(),
      'present': presentCount,
      'absent': absentCount,
    });

    // Reset kehadiran semua siswa setelah disimpan
    for (var student in students) {
      student.isPresent = false;
    }

    notifyListeners();
  }
}

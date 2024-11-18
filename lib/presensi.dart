import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/provider_kehadiran.dart';

class HalamanPresensi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var providerKehadiran = Provider.of<ProviderKehadiran>(context);
    var tanggal = DateTime.now();

    return Scaffold(
      appBar: AppBar(title: Text('Presensi Siswa'), backgroundColor: Colors.amberAccent),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: providerKehadiran.students.length,
              itemBuilder: (context, index) {
                var student = providerKehadiran.students[index];
                return ListTile(
                  title: Text(student.name),
                  trailing: Checkbox(
                    value: student.isPresent,
                    onChanged: (value) {
                      providerKehadiran.toggleKehadiran(index, value!);
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tanggal: ${tanggal.toLocal().toString().split(' ')[0]}',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: providerKehadiran.students
                      .any((student) => student.isPresent)
                      ? () => providerKehadiran.simpanKehadiran()
                      : null,
                  child: Text('Simpan Kehadiran'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/provider_kehadiran.dart';

class Riwayat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var providerKehadiran = Provider.of<ProviderKehadiran>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Riwayat Kehadiran'), backgroundColor: Colors.amberAccent),
      body: ListView.builder(
        itemCount: providerKehadiran.history.length,
        itemBuilder: (context, index) {
          var record = providerKehadiran.history[index];
          return ListTile(
            leading: Icon(Icons.calendar_today),
            title: Row(
              children: [
                Text(
                  '${record['date'].toLocal()}'.split(' ')[0],
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            subtitle: Text(
              'Hadir: ${record['present']}, Tidak Hadir: ${record['absent']}',
            ),
          );
        },
      ),
    );
  }
}

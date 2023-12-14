import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: PermissionPage(),
  ));
}

class PermissionPage extends StatefulWidget {
  @override
  _PermissionPageState createState() => _PermissionPageState();
}

class _PermissionPageState extends State<PermissionPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Izin'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Izin Keluar'),
            Tab(text: 'Izin Bermalam'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          PermissionForm(type: PermissionType.leave),
          PermissionForm(type: PermissionType.overnight),
        ],
      ),
    );
  }
}

enum PermissionType {
  leave,
  overnight,
}

class PermissionForm extends StatefulWidget {
  final PermissionType type;

  PermissionForm({required this.type});

  @override
  _PermissionFormState createState() => _PermissionFormState();
}

class _PermissionFormState extends State<PermissionForm> {
  DateTime selectedStartDate = DateTime.now();
  DateTime selectedEndDate = DateTime.now();
  String purpose = '';
  String destination = '';

  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    final DateTime picked = (await showDatePicker(
      context: context,
      initialDate: isStartDate ? selectedStartDate : selectedEndDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    ))!;

    if (picked != null &&
        picked != (isStartDate ? selectedStartDate : selectedEndDate)) {
      setState(() {
        if (isStartDate) {
          selectedStartDate = picked;
        } else {
          selectedEndDate = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('Tanggal Berangkat:'),
                SizedBox(width: 16),
                IconButton(
                  onPressed: () => _selectDate(context, true),
                  icon: Icon(Icons.date_range),
                ),
                SizedBox(width: 8),
                Text('${selectedStartDate.toLocal()}'.split(' ')[0]),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Text('Tanggal Kembali:'),
                SizedBox(width: 16),
                Padding(
                  padding: EdgeInsets.only(left: 13),
                  child: IconButton(
                    onPressed: () => _selectDate(context, false),
                    icon: Icon(Icons.date_range),
                  ),
                ),
                SizedBox(width: 8),
                Text('${selectedEndDate.toLocal()}'.split(' ')[0]),
              ],
            ),
            SizedBox(height: 16),
            TextField(
              onChanged: (value) {
                setState(() {
                  purpose = value;
                });
              },
              maxLines: 3,
              decoration: InputDecoration(labelText: 'Keperluan'),
            ),
            widget.type == PermissionType.overnight
                ? SizedBox(height: 16)
                : Container(),
            widget.type == PermissionType.overnight
                ? TextField(
                    onChanged: (value) {
                      setState(() {
                        destination = value;
                      });
                    },
                    decoration: InputDecoration(labelText: 'Tujuan'),
                  )
                : Container(),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Izin Terkirim'),
                      content: Text('Terima kasih! Izin Anda telah terkirim.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Kirim Izin'),
            ),
          ],
        ),
      ),
    );
  }
}

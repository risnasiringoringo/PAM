import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Page'),
      ),
      body: HomePage(),
      drawer: DrawerMenu(),
    );
  }
}

class RequestSuratMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SuratIzinKeluarPage(),
              ),
            );
          },
          child: Text('Surat Izin Keluar'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SuratIzinBermalamPage(),
              ),
            );
          },
          child: Text('Surat Izin Bermalam'),
        ),
      ],
    );
  }
}

class SuratIzinKeluarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Surat Izin Keluar'),
      ),
      body: Center(
        child: Text('Halaman Surat Izin Keluar'),
      ),
    );
  }
}

class SuratIzinBermalamPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Surat Izin Bermalam'),
      ),
      body: Center(
        child: Text('Halaman Surat Izin Bermalam'),
      ),
    );
  }
}

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("John Doe"),
            accountEmail: Text("john.doe@example.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("assets/img/admin.jpg"),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            leading: FaIcon(FontAwesomeIcons.home, size: 24),
            title: Text('Home'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ExpansionTile(
            leading: FaIcon(FontAwesomeIcons.envelope, size: 24),
            title: Text('Surat'),
            children: [
              ListTile(
                leading: FaIcon(FontAwesomeIcons.envelopeOpenText, size: 24),
                title: Text('Surat Mahasiswa Aktif'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SuratIzinKeluarPage(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: FaIcon(FontAwesomeIcons.solidEnvelope, size: 24),
                title: Text('Surat Pengantar Proyek'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SuratIzinBermalamPage(),
                    ),
                  );
                },
              ),
              // Tambahkan menu surat lainnya sesuai kebutuhan
            ],
          ),
          ExpansionTile(
            leading: FaIcon(FontAwesomeIcons.userGraduate, size: 24),
            title: Text('Izin Mahasiswa'),
            children: [
              ListTile(
                leading: FaIcon(FontAwesomeIcons.solidEnvelope, size: 24),
                title: Text('Izin Keluar'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SuratIzinKeluarPage(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: FaIcon(FontAwesomeIcons.solidEnvelopeOpen, size: 24),
                title: Text('Izin Bermalam'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SuratIzinBermalamPage(),
                    ),
                  );
                },
              ),
              // Tambahkan menu izin mahasiswa lainnya sesuai kebutuhan
            ],
          ),
          ListTile(
            leading: FaIcon(FontAwesomeIcons.building, size: 24),
            title: Text('Ruangan'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RuanganPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: FaIcon(FontAwesomeIcons.tshirt, size: 24),
            title: Text('Kaos'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => KaosPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: FaIcon(FontAwesomeIcons.signOutAlt, size: 24),
            title: Text('Logout'),
            onTap: () {
              // Tambahkan fungsi logout di sini
            },
          ),
        ],
      ),
    );
  }
}
class RuanganPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ruangan'),
      ),
      body: Center(
        child: Text('Halaman Ruangan'),
      ),
    );
  }
}

class KaosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kaos'),
      ),
      body: Center(
        child: Text('Halaman Kaos'),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                HomeCard(
                  title: 'Jumlah Mahasiswa',
                  value: '500',
                  icon: Icons.people,
                ),
                HomeCard(
                  title: 'Jumlah Surat',
                  value: '200',
                  icon: Icons.mail,
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                HomeCard(
                  title: 'Jumlah Kaos Terjual',
                  value: '100',
                  icon: Icons.accessibility,
                ),
                // Tambahkan home card tambahan di sini sesuai kebutuhan
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class HomeCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const HomeCard({
    Key? key,
    required this.title,
    required this.value,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Icon(
              icon,
              size: 48,
              color: Colors.blue,
            ),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text(
              value,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

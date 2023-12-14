import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pam_application/views/users/izin.dart';
import 'package:pam_application/views/users/ruangan.dart';
import 'package:pam_application/views/users/surat.dart';



class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: Colors.blue,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage("assets/img/admin.jpg"),
                      radius: 60,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Hasan Sinaga',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'NIM: 11322037',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(height: 40),
                MenuRow(),
                SizedBox(height: 16),
                AdditionalMenuRow(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Daftar Request',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Akun',
          ),
        ],
      ),
    );
  }
}

class MenuRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        MenuCard(
          icon: FontAwesomeIcons.userClock,
          title: 'Izin',
          backgroundColor: Colors.green.shade100,
        ),
        MenuCard(
          icon: FontAwesomeIcons.envelope,
          title: 'Surat',
          backgroundColor: Colors.orange.shade100,
        ),
      ],
    );
  }
}

class AdditionalMenuRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        MenuCard(
          icon: FontAwesomeIcons.building,
          title: 'Ruangan',
          backgroundColor: Colors.purple.shade100,
        ),
        MenuCard(
          icon: FontAwesomeIcons.tshirt,
          title: 'Kaos',
          backgroundColor: Colors.red.shade100,
        ),
      ],
    );
  }
}

class MenuCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color backgroundColor;

  MenuCard({
    required this.icon,
    required this.title,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 3,
      child: InkWell(
        onTap: () {
          // Periksa judul, jika 'Izin', navigasi ke PermissionPage,
          // jika 'Surat', navigasi ke SuratPage
          if (title == 'Izin') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PermissionPage(),
              ),
            );
          } else if (title == 'Surat') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SuratPage(),
              ),
            );
          }else if (title == 'Ruangan') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RuanganPage(),
              ),
            );
          }
        },
        borderRadius: BorderRadius.circular(20.0),
        child: Container(
          padding: EdgeInsets.all(20),
          height: 150,
          width: 120,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FaIcon(icon, size: 50),
              SizedBox(height: 20),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
      color: backgroundColor,
    );
  }
}

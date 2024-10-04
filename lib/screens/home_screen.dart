import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_2/screens/chat_screen.dart';
import 'package:test_2/screens/report_bug_screen.dart';
import 'package:test_2/screens/responsive_screen.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geolocator/geolocator.dart';
import 'package:test_2/widgets/list_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final permissionCamera = Permission.camera;
  final permissionLocation = Permission.location;

  void locationPermissionStatus() async {

    final status = await permissionLocation.request();
    if (status == PermissionStatus.granted) {
      final position = await Geolocator.getCurrentPosition();
      print('Latitude: ${position.latitude}, Longitude: ${position.longitude}');
    } else {
      print('Location permission denied.');
    }
  }
  void cameraPermissionStatus() async {

    final status = await permissionCamera.request();
    if (status.isGranted) {
      print('Opening camera...');
    } else {
      print('Camera permission denied.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<ProfileScreen>(
                  builder: (context) => ProfileScreen(
                    appBar: AppBar(
                      title: const Text('User Profile'),
                    ),
                    actions: [
                      SignedOutAction((context) {
                        Navigator.of(context).pop();
                      })
                    ],
                    children: [
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.all(2),
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: Image.asset('assets/flutter.png'),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          )
        ],
        automaticallyImplyLeading: false,
      ),

      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              leading: const Icon(
                Icons.discount_outlined,
              ),
              title: const Text('Offers'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ResponsiveScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.support_agent_outlined,
              ),
              title: const Text('Support'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ChatScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.bug_report_outlined,
              ),
              title: const Text('Report bugs'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ReportBugScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.logout_outlined,
              ),
              title: const Text('Log out'),
              onTap: () {
                FirebaseAuth.instance.signOut();
              },
            ),
          ],
        ),
      ),

        body: Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.red,
            ),
          ),
          child: ListView(
            padding: const EdgeInsets.all(10),
            children: [
              ListTileWidget(
                title: "text1",
                subtitle: "subtext1",
                listTileColor: Colors.blue.shade50,
                leadingIcon: Icons.access_time_filled,
                trailingIcon: Icons.access_alarms,
                iconColor: Colors.amber,
              ),
              ListTileWidget(
                title: "text2",
                subtitle: "subtext2",
                listTileColor: Colors.amber.shade50,
                leadingIcon: Icons.account_box,
                trailingIcon: Icons.ac_unit,
                iconColor: Colors.green,
              ),
              ListTileWidget(
                  title: "text3",
                  subtitle: "subtext3",
                  listTileColor: Colors.greenAccent.shade100,
                  leadingIcon: Icons.adb,
                  trailingIcon: Icons.add_business_outlined,
                  iconColor: Colors.blue),

              ElevatedButton(
                onPressed: cameraPermissionStatus,
                child: const Text('Open Camera'),
              ),
              ElevatedButton(
                onPressed: locationPermissionStatus,
                child: Text('Get Location',
                  style: Theme.of(context).brightness == Brightness.dark ? const TextStyle(color: Colors.white) : const TextStyle(color: Colors.black),
                ),
              ),

            ],
          ),
        )

    );
  }
}

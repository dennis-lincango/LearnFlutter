import 'package:flutter/material.dart';
import 'package:test_2/screens/drawer_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../widgets/list_tile.dart';

class WidgetsScreen extends StatelessWidget {
  const WidgetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Second Screen'),
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
              CarouselSlider(
                items: [
                  Container(
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: const DecorationImage(
                        image: NetworkImage("https://picsum.photos/id/49/500"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: const DecorationImage(
                        image: NetworkImage("https://picsum.photos/id/16/500"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: const DecorationImage(
                        image: NetworkImage("https://picsum.photos/id/74/500"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Card(
                    margin: const EdgeInsets.all(8.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),

                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.network(
                        "https://picsum.photos/id/84/500",
                        fit: BoxFit.cover,
                      ),
                    ),

                  ),
                ],
                options: CarouselOptions(
                  height: 250.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  viewportFraction: 0.8,
                ),
              ),
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
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade50, // Background color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // Rounded corners
                  ),
                  padding: const EdgeInsets.symmetric(
                      vertical: 15, horizontal: 30), // Button padding
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DrawerScreen()),
                  );
                },
                child: const Text('Go To Third Screen'), // Button text
              )
            ],
          ),
        ));
  }
}

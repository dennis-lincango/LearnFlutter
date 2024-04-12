
import 'package:flutter/material.dart';

import '../widgets/listview.dart';


class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:   const Text('Second Screen'),
      ),
      body: ListView(
        padding:    const EdgeInsets.all(10),
        children:  [
          ListTileWidget(
              title: "texto1",
              subtitle: "subtexto1",
            listTileColor: Colors.blue.shade50,
            leadingIcon: Icons.access_time_filled,
            trailingIcon: Icons.access_alarms,
            iconColor: Colors.amber,
          ),
          ListTileWidget(
            title: "texto2",
            subtitle: "subtexto2",
            listTileColor: Colors.amber.shade50,
            leadingIcon: Icons.account_box,
            trailingIcon: Icons.ac_unit,
            iconColor: Colors.green,
          ),
          ListTileWidget(
              title: "texto3",
              subtitle: "subtexto3",
              listTileColor: Colors.yellow.shade50,
              leadingIcon: Icons.account_box,
              trailingIcon: Icons.ac_unit,
              iconColor: Colors.green
          )
        ],
      ),
    );
  }
}



import 'package:flutter/material.dart';

import '../widgets/listview.dart';


class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text('Second Screen'),
      ),
      body: ListView(
        padding:   const EdgeInsets.all(10),
        children:  [
          ListTileWidget(
              title: "texto1",
              subtitle: "subtexto1"),
          ListTileWidget(
            title: "texto1",
            subtitle: "subtexto2",
            leadingIcon: Icons.laptop,
          ),
          ListTileWidget(
              title: "texto3",
              subtitle: "subtexto3",
              listTileColor: Colors.yellow,
              trailingIcon: Icons.laptop,
              iconColor: Colors.green
          )
        ],
      ),

      // ElevatedButton(
      //   child: Text('Go To First Screen'),
      //   onPressed: () {
      //     Navigator.push(context, MaterialPageRoute(builder: (context) => FirstScreen()));
      //   }
      // )
    );
  }
}


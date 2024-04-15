import 'package:flutter/material.dart';
import 'package:test_2/widgets/my_message.dart';
import 'package:test_2/widgets/other_message.dart';

class FourthScreen extends StatelessWidget {
  const FourthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://picsum.photos/250/300'),
          ),
        ),
          title: const Text('Fourth Screen'),
          centerTitle: false,
        ),
      body: _ChatView(),
    );
  }
}



class _ChatView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(child: ListView.builder(
              itemCount: 100,
                itemBuilder: (context, index) {
                  return (index % 2 == 0)
                      ? const MyMessage()
                      : const OtherMessage();
                },
              )
            ),
            const Text('Mundo')
          ],
        ),
      ),
    );
  }
}

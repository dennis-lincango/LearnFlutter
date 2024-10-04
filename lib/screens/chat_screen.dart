import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_2/models/message_model.dart';
import 'package:test_2/widgets/message_field_box.dart';
import 'package:test_2/widgets/my_message.dart';
import 'package:test_2/widgets/other_message.dart';
import 'package:test_2/providers/chat_provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

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
          title: const Text('Anonymous'),
          centerTitle: false,
        ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(child: ListView.builder(
              controller: chatProvider.chatScrollController,
              itemCount: chatProvider.messageList.length,
                itemBuilder: (context, index) {
                  final message = chatProvider.messageList[index];
                  return(message.fromWho == FromWho.other)
                      ? OtherMessage(message: message)
                      : MyMessage(message: message);
                },
              )
            ),
            MessageFieldBox(
              onValue: chatProvider.sendMessage,
            ),
          ],
        ),
      ),
    );
  }
}


import 'package:flutter/cupertino.dart';
import 'package:test_2/models/message.dart';

class ChatProvider extends ChangeNotifier {

  List<Message> messageList = [
    Message(text: 'Hola :D', fromWho: FromWho.me),
    Message(text: 'Estás bien?', fromWho: FromWho.other),
  ];

  Future<void> sendMessage(String text) async {
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);
    notifyListeners();
  }
}
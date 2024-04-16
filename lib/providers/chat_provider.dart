
import 'package:flutter/cupertino.dart';
import 'package:test_2/models/message.dart';

class ChatProvider extends ChangeNotifier {

  List<Message> messages = [
    Message(text: 'Hola :D', fromWho: FromWho.me),
    Message(text: 'Estás bien?', fromWho: FromWho.other),
  ];

  Future<void> sendMessage(String text) async {

  }
}
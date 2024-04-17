import 'package:flutter/cupertino.dart';
import 'package:test_2/helpers/get_answer.dart';
import 'package:test_2/models/message.dart';

class ChatProvider extends ChangeNotifier {
  final chatScrollController = ScrollController();
  final answer = GetAnswer();

  List<Message> messageList = [
    Message(text: 'Hola :D', fromWho: FromWho.me),
    Message(text: 'Cómo estás?', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;

    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);

    if(text.endsWith('?')) {
       otherReply();
    }

    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> otherReply() async {
    final otherMessage = await answer.getAnswer();
    messageList.add(otherMessage);
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));

    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut);
  }
}

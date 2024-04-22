import 'package:flutter/cupertino.dart';
import 'package:test_2/services/get_answer_service.dart';
import 'package:test_2/models/message_model.dart';

class ChatProvider extends ChangeNotifier {
  final chatScrollController = ScrollController();
  final answer = GetAnswerService();

  List<MessageModel> messageList = [
    MessageModel(text: 'Hola :D', fromWho: FromWho.me),
    MessageModel(text: 'Cómo estás?', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;

    final newMessage = MessageModel(text: text, fromWho: FromWho.me);
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

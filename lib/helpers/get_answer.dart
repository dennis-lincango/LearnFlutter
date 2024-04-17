import 'package:dio/dio.dart';
import 'package:test_2/models/answer.dart';
import 'package:test_2/models/message.dart';

class GetAnswer {
  final _dio = Dio();

  Future<Message> getAnswer() async {
    final response = await _dio.get('https://yesno.wtf/api');
    final answerModel = Answer.fromJsonMap(response.data);
    return answerModel.toMessageEntity();
  }
}

import 'package:dio/dio.dart';
import 'package:test_2/models/answer_model.dart';
import 'package:test_2/models/message.dart';

class GetAnswer {
  final _dio = Dio();

  Future<Message> getAnswer() async {
    final response = await _dio.get('https://yesno.wtf/api');
    final answerModel = AnswerModel.fromJsonMap(response.data);
    return answerModel.toMessageEntity();
  }
}

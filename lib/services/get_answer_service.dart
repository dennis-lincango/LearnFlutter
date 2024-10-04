import 'package:dio/dio.dart';
import 'package:test_2/models/answer_model.dart';
import 'package:test_2/models/message_model.dart';

class GetAnswerService {
  final _dio = Dio();

  Future<MessageModel> getAnswer() async {
    final response = await _dio.get('https://yesno.wtf/api');
    final answerModel = AnswerModel.fromJsonMap(response.data);
    return answerModel.toMessageEntity();
  }
}

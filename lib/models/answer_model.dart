import 'package:test_2/models/message_model.dart';

class AnswerModel {
  final String answer;
  final bool forced;
  final String image;

  AnswerModel({
    required this.answer,
    required this.forced,
    required this.image,
  });

  factory AnswerModel.fromJsonMap(Map<String, dynamic> json) => AnswerModel(
    answer: json["answer"],
    forced: json["forced"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "answer": answer,
    "forced": forced,
    "image": image,
  };

  MessageModel toMessageEntity() => MessageModel(
    text: answer=='yes' ? 'Si' : 'No',
    fromWho: FromWho.other,
    imageUrl: image
  );
}
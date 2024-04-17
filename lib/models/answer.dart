import 'package:test_2/models/message.dart';

class Answer {
  final String answer;
  final bool forced;
  final String image;

  Answer({
    required this.answer,
    required this.forced,
    required this.image,
  });

  factory Answer.fromJsonMap(Map<String, dynamic> json) => Answer(
    answer: json["answer"],
    forced: json["forced"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "answer": answer,
    "forced": forced,
    "image": image,
  };

  Message toMessageEntity() => Message(
    text: answer=='yes' ? 'Si' : 'No',
    fromWho: FromWho.other,
    imageUrl: image
  );
}
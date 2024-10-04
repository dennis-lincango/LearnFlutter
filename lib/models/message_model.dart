enum FromWho { me, other }

class MessageModel {
  final String text;
  final String? imageUrl;
  final FromWho fromWho;

  MessageModel({required this.text, this.imageUrl, required this.fromWho});
}

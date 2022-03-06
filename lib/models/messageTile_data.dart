import 'package:hichat/imports.dart';

@immutable
class MessageData {
  const MessageData({
    required this.senderName,
    required this.message,
    required this.messageTime,
    required this.dateMessage,
    required this.pictureUrl,
  });

  final String senderName;
  final String message;
  final DateTime messageTime;
  final String dateMessage;
  final String pictureUrl;
}

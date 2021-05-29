import 'package:chatzin_qr/models/ChatMessage.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'text_message.dart';

class Message extends StatelessWidget {
  const Message({
    Key? key,
    required this.msg,
    // required this.message,
    required this.imgUrl,
  }) : super(key: key);

  final String msg;
  final String imgUrl;
  // final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    Widget messageContaint(String message) {
      return TextMessage(message: message);
    }

    return Padding(
      padding: const EdgeInsets.only(top: kDefaultPadding),
      child: Row(
        mainAxisAlignment:
            // message.isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
            MainAxisAlignment.start,
        children: [
          // if (!message.isSender) 
          ...[
            CircleAvatar(
              radius: 12,
              backgroundImage: AssetImage(imgUrl),
            ),
            SizedBox(width: kDefaultPadding / 2),
          ],
          TextMessage(message: msg),
          // if (message.isSender) MessageStatusDot()
        ],
      ),
    );
  }
}

class MessageStatusDot extends StatelessWidget {

  const MessageStatusDot();
  @override
  Widget build(BuildContext context) {
    Color dotColor() {
      return kPrimaryColor;
    }

    return Container(
      margin: EdgeInsets.only(left: kDefaultPadding / 2),
      height: 12,
      width: 12,
      decoration: BoxDecoration(
        color: dotColor(),
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.done,
        size: 8,
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
    );
  }
}

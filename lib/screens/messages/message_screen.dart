import 'package:chatzin_qr/models/ChatMessage.dart';
import 'package:chatzin_qr/screens/chats/modelos.dart';
import 'package:chatzin_qr/screens/chats/tribo_controller.dart';
import 'package:flutter/material.dart';

import 'package:chatzin_qr/models/Chat.dart';

import '../../constants.dart';
import 'components/chat_input_field.dart';
import 'components/message.dart';

class MessagesScreen extends StatefulWidget {
  //TODO: Esse é o verdadeiro chat screen
  final Chat chat;
  const MessagesScreen({
    required this.chat,
  });

  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  Chat get chat => widget.chat;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: _MessagensBody(imgUrl: chat.image),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          BackButton(),
          //TODO: FOTO
          CircleAvatar(
            backgroundImage: AssetImage(chat.image),
          ),
          SizedBox(width: kDefaultPadding * 0.75),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                chat.name,
                style: TextStyle(fontSize: 16),
              ),
              Text(
                chat.time,
                style: TextStyle(fontSize: 12),
              )
            ],
          )
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.local_phone),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.videocam),
          onPressed: () {},
        ),
        SizedBox(width: kDefaultPadding / 2),
      ],
    );
  }
}

class _MessagensBody extends StatefulWidget {
  final String imgUrl;

  _MessagensBody({Key? key, required this.imgUrl}) : super(key: key);

  @override
  _MessagensBodyState createState() => _MessagensBodyState();
}

class _MessagensBodyState extends State<_MessagensBody> {
  get messages => TriboController.messages;

  @override
  void initState() {
    super.initState();
    messages.connect();
  }

  @override
  void dispose() {
    super.dispose();
    messages.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var listviewB = ListView.builder(
      itemCount: demeChatMessages.length,
      itemBuilder: (context, index) {
        return Message(
          msg: 'snap[index].mensagem',
          message: demeChatMessages[index],
          imgUrl: widget.imgUrl,
        );
      },
    );

    var streamB = StreamBuilder<List<Mensagem>>(
        stream: messages.stream,
        builder: (context, snapshot) {
          print(snapshot);
          if (snapshot.hasData) {
            var snap = snapshot.data;
            if (snap != null)
              return ListView.builder(
                itemCount: snap.length,
                itemBuilder: (context, index) {
                  return Message(
                    msg: snap[index].mensagem,
                    message: demeChatMessages.first,
                    imgUrl: widget.imgUrl,
                  );
                },
              );
            else
              return Center(
                child: CircularProgressIndicator(),
              );
          } else
            return Center(
              child: CircularProgressIndicator(),
            );
        });

    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: streamB,
          ),
        ),
        ChatInputField(),
      ],
    );
  }
}

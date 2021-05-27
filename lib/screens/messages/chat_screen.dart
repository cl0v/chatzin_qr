import 'package:chatzin_qr/models/ChatMessage.dart';
import 'package:chatzin_qr/screens/chats/modelos.dart';
import 'package:chatzin_qr/screens/chats/tribo_controller.dart';
import 'package:flutter/material.dart';

import 'package:chatzin_qr/models/Chat.dart';

import '../../constants.dart';
import 'components/chat_input_field.dart';
import 'components/message.dart';

class ChatScreen extends StatefulWidget {
  final Chat chat;
  const ChatScreen({
    required this.chat,
  });

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  Chat get chat => widget.chat;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: _Body(imgUrl: chat.image),
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

class _Body extends StatefulWidget {
  final String imgUrl;

  _Body({Key? key, required this.imgUrl}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  final _controller =  TriboController();

  @override
  void initState() {
    super.initState();
    _controller.messages.connect();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.messages.dispose();
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
        stream: _controller.messages.stream,
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

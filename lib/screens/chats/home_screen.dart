import 'package:chatzin_qr/models/Chat.dart';
import 'package:chatzin_qr/screens/messages/chat_screen.dart';
import 'package:flutter/material.dart';
import 'components/chat_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: _Body(),
      //TODO: Adicionar Fab para adicionar novas tribos pra facilitar o acesso

    );
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text("Chats"),
      centerTitle: true,
    );
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chatsData.length,
      itemBuilder: (context, index) => ChatCard(
        chat: chatsData[index],
        press: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatScreen(
              chat: chatsData[index],
            ),
          ),
        ),
      ),
    );
  }
}

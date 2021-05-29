import 'package:chatzin_qr/models/oldChat.dart';
import 'package:chatzin_qr/models/user.dart';
import 'package:chatzin_qr/screens/chats/home_bloc.dart';
import 'package:chatzin_qr/screens/messages/chat_screen.dart';
import 'package:flutter/material.dart';
import 'components/chat_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeBloc _bloc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    /*User.get().then((user)=>_bloc=HomeBloc(user:user));
    */
    _bloc = HomeBloc(
      user: User(
        id: 'tgAErOQtETQT8AMJQqy9mXx8h6X2',
        imgUrl: "assets/images/user.png",
        name: 'Marcelo',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final body = ListView.builder(
      itemCount: chatsData.length,
      itemBuilder: (context, index) => ChatCard(
        chat: chatsData[index],
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatScreen(
              chat: chatsData[index],
            ),
          ),
        ),
      ),
    );

    final appBar = AppBar(
      automaticallyImplyLeading: false,
      title: Text("Guilda"),
    );
    return Scaffold(
        appBar: appBar,
        body: body,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(
            Icons.add,
          ),
        )
        //TODO: Adicionar Fab para adicionar novas tribos pra facilitar o acesso
        );
  }
}

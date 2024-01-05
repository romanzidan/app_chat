import 'package:flutter/material.dart';

import '../constrants/colors.dart';
import '../model/chat.dart';
import '../widgets/chat_item.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //final variable sama dengan const
  final chatsList = Chat.chatList();
  List<Chat> _foundToDo = [];
  final _chatController = TextEditingController();
  ScrollController ctr = ScrollController();

  @override
  void initState() {
    _foundToDo = chatsList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            margin: const EdgeInsets.only(bottom: 80),
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    controller: ctr,
                    children: [
                      for (Chat todoo in _foundToDo)
                        ChatItem(
                          chat: todoo,
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(
                      bottom: 20,
                      right: 20,
                      left: 20,
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0, 0),
                          blurRadius: 10.0,
                          spreadRadius: 0.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: _chatController,
                      autofocus: true,
                      onSubmitted: (value) {
                        ctr.animateTo(10 * 100,
                            duration: const Duration(milliseconds: 1000),
                            curve: Curves.bounceOut);
                        _addChatItem(_chatController.text);
                      },
                      decoration: const InputDecoration(
                        hintText: 'Type a message...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20, right: 20),
                  child: ElevatedButton(
                      onPressed: () {
                        ctr.animateTo(10 * 100,
                            duration: const Duration(milliseconds: 1000),
                            curve: Curves.bounceOut);
                        _addChatItem(_chatController.text);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: tdBlue,
                          minimumSize: const Size(10, 70),
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          )),
                      child: const Icon(
                        Icons.send,
                        color: tdWhite,
                        size: 20,
                      )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void _addChatItem(String chatText) {
    setState(() {
      chatsList.add(Chat(
        avatar: 'assets/images/avatar1.png',
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        text: chatText,
        sender: true,
      ));
    });
    _chatController.clear();
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: tdWhite,
      scrolledUnderElevation: 0,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            child: Text(
              '# general',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: tdBlack,
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.groups,
                color: tdBlack,
                size: 30,
              ),
            ),
          )
        ],
      ),
    );
  }
}

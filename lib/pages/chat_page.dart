import 'dart:io';

import 'package:chat_front/widgets/chat_messages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  final chatController = TextEditingController();
  bool estaEscribiendo = false;
  final _focusNode = FocusNode();
  List<ChatMessagee> _messages = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Column(
          children: [
            CircleAvatar(
              backgroundColor: Colors.blue[100],
              radius: 12,
              child: const Text('Ke', style: TextStyle(fontSize: 12)),
            ),
            const SizedBox(
              height: 3,
            ),
            const Text(
              'Keñito',
              style: TextStyle(color: Colors.black87, fontSize: 12),
            )
          ],
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Flexible(
                child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: _messages.length,
              itemBuilder: (_, i) => _messages[i],
              reverse: true,
            )),
            const Divider(
              height: 1,
            ),
            Container(
              color: Colors.white,
              child: _inputChat(),
            )
          ],
        ),
      ),
    );
  }

  Widget _inputChat() {
    return SafeArea(
        child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(children: [
        Flexible(
            child: TextField(
          controller: chatController,
          onSubmitted: estaEscribiendo ? (value) => hadleSubmit(value) : null,
          onChanged: (value) {
            setState(() {
              estaEscribiendo = value.trim().isNotEmpty;
            });
          },
          decoration: const InputDecoration.collapsed(
            hintText: 'Enviar mensaje',
          ),
          focusNode: _focusNode,
        )),
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Platform.isIOS
                ? CupertinoButton(
                    onPressed: estaEscribiendo
                        ? () => hadleSubmit(chatController.text)
                        : null,
                    child: const Text('enviar'),
                  )
                : Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: IconTheme(
                      data: IconThemeData(color: Colors.blue[400]),
                      child: IconButton(
                        icon: const Icon(Icons.send),
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onPressed: estaEscribiendo
                            ? () => hadleSubmit(chatController.text)
                            : null,
                      ),
                    ),
                  ))
      ]),
    ));
  }

  void hadleSubmit(String value) {
    print(value);
    chatController.clear();
    final newMessage = ChatMessagee(
        texto: value,
        uid: '123',
        animationController: AnimationController(
            vsync: this, duration: const Duration(milliseconds: 1000)));
    _messages.insert(0, newMessage);
    newMessage.animationController.forward();
    setState(() {
      estaEscribiendo = false;
    });
    _focusNode.requestFocus();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    for (ChatMessagee message in _messages) {
      message.animationController.dispose();
    }
    super.dispose();
  }
}

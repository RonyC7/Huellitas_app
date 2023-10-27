import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChatsScreen(),
    );
  }
}

class ChatsScreen extends StatefulWidget {
  @override
  _ChatsScreenState createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  bool _searching = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _searching
            ? TextField(
                decoration: InputDecoration(
                  hintText: 'Buscar...',
                  icon: Icon(Icons.search),
                ),
              )
            : Center(child: Text('Chats')),
        actions: [
          IconButton(
            icon: Icon(_searching ? Icons.cancel : Icons.search),
            onPressed: () {
              setState(() {
                _searching = !_searching;
              });
            },
          ),
        ],
      ),
      body: Center(
        child: ListView(
          children: [
            ContactItem(contactName: 'Amigo 1'),
            ContactItem(contactName: 'Amigo 2'),
            ContactItem(contactName: 'Amigo 3'),
            ContactItem(contactName: 'Amigo 4'),
            ContactItem(contactName: 'Amigo 5'),
            ContactItem(contactName: 'Amigo 6'),
            ContactItem(contactName: 'Amigo 7'),
          ],
        ),
      ),
    );
  }
}

class ContactItem extends StatelessWidget {
  final String contactName;

  ContactItem({required this.contactName});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(contactName),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ChatConversation(contactName: contactName),
          ),
        );
      },
    );
  }
}

class ChatConversation extends StatelessWidget {
  final String contactName;

  ChatConversation({required this.contactName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(contactName),
      ),
      body: ListView(
        children: [
          ChatMessage(isMe: true, message: 'Hola, ¿cómo estás?'),
          ChatMessage(isMe: false, message: '¡Hola! Estoy bien, gracias.'),
          ChatMessage(isMe: true, message: 'Eso suena genial.'),
          // Agregar más mensajes de chat aquí
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.camera_alt),
              onPressed: () {
                // Lógica para abrir la cámara
              },
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Escribe un mensaje',
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.send),
              onPressed: () {
                // Lógica para enviar el mensaje
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final bool isMe;
  final String message;

  ChatMessage({required this.isMe, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: isMe ? Colors.blue : Colors.grey,
          borderRadius: isMe
              ? BorderRadius.only(
                  topLeft: Radius.circular(12.0),
                  topRight: Radius.circular(12.0),
                  bottomLeft: Radius.circular(12.0),
                )
              : BorderRadius.only(
                  topLeft: Radius.circular(12.0),
                  topRight: Radius.circular(12.0),
                  bottomRight: Radius.circular(12.0),
                ),
        ),
        child: Text(
          message,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

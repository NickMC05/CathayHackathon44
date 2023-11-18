import 'package:cathay/services/gpt3_service.dart';
import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';


enum MessageType { user, ai }

class ChatMessage {
  final String text;
  final MessageType type;

  ChatMessage({required this.text, required this.type});
}

void main() => runApp(ChatApp());

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Flutter ChatBot',
      home: ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<ChatMessage> _messages = [];
  final TextEditingController _textController = TextEditingController();

  void _handleSubmitted(String text) {
    _textController.clear();
    setState(() {
      _messages.add(ChatMessage(text: text, type: MessageType.user));
    });

    chatGPT([
      {'role': 'system', 'content': '''
      Your name is Bob.
      You work as a customer service for a user.
      
      User info:
      name = Tin Hei
      age = 24
      sex = Male
      country/home = Hong Kong
      has disability = asthma, broken leg, visual impairment
      tools needed = wheelchair, service dog
      medicines needed = oxygen mask
      allergies = seafood
      
      act like a normal human, make sure he dont get sick/injured, keep the message short like 1-2 sentences only
      '''},
      {"role": "user", "content": text}
    ]).then(
      (value) {
        print(value);
        setState(() {
          _messages.add(ChatMessage(text: value, type: MessageType.ai));
        });
      },
    );
  }
 @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('ChatBot'),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                    child: Align(
                      alignment: message.type == MessageType.user
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: message.type == MessageType.user
                              ? CupertinoColors.systemBlue
                              : Color(0xFF00645A),
                        ),
                        child: Text(
                          message.text,
                          style: TextStyle(
                            color: message.type == MessageType.user ? CupertinoColors.black : CupertinoColors.white,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            _buildCupertinoTextComposer(),
          ],
        ),
      ),
    );
  }

  Widget _buildCupertinoTextComposer() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          SizedBox(width: 16.0),
          Expanded(
            child: CupertinoTextField(
              controller: _textController,
              onSubmitted: _handleSubmitted,
              placeholder: 'Send a message',
            ),
          ),
          CupertinoButton(
            child: Icon(CupertinoIcons.arrow_right_circle_fill),
            onPressed: () => _handleSubmitted(_textController.text),
          ),
        ],
      ),
    );
  }
}
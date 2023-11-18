import 'package:cathay/services/gpt3_service.dart';
import 'package:flutter/cupertino.dart';

class Option1 extends StatelessWidget {
  const Option1({super.key});

  @override
  Widget build(BuildContext context) {
    String text = "";
    return CupertinoPageScaffold(
      child: Center(
          child: Column(
        children: [
          Text(text),
          CupertinoButton(
            child: const Text('Run'),
            onPressed: () async {
              chatGPT([
                {
                  "role": "system",
                  "content":
                      "You are an AI assistant that helps people find information."
                }
              ]);
            },
          ),
        ],
      )),
    );
  }
}
//  response = await chatGPT([
//         {
//           "role": "user",
//           "content":
//               "Please rephrase the sentences below to be under 25 words, keep the original tone:\n  $response"
//         }
//       ]);
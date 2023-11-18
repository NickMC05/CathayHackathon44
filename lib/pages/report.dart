import 'package:cathay/components/report_components/custom_card.dart';
import 'package:cathay/components/report_components/emoji_slider.dart';
import 'package:cathay/components/report_components/horizontal_slider.dart';
import 'package:cathay/components/report_components/todolist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Report Card',
      home: ReportScreen(),
    );
  }
}

class ReportScreen extends StatefulWidget {
  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          leading: Text('Report Card',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold)),
        ),
        child: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Divider(height: 2.0),
              const SizedBox(height: 10.0),
              Align(alignment: Alignment.center, child: GradualBlurCard()),
              // Slider(),
              Container(
                padding: const EdgeInsets.all(20.0),
                child: const Row(
                  children: [
                    Text(
                      "Documents",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Text("53%"),
                        SizedBox(width: 10.0),
                        CircularProgressIndicator(
                            value: 0.53,
                            color: CupertinoColors.systemGreen,
                            backgroundColor: CupertinoColors.systemGrey4,
                            strokeWidth: 8.0)
                      ],
                    )
                  ],
                ),
              ),
              // Text("Report Slider 1"),
              // HorizontalSlider(),
              EmojiSlider(),
              Container(
                padding: EdgeInsets.all(20.0),
                child: const Row(
                  children: [
                    Text(
                      "Medicine",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Text("20%"),
                        SizedBox(width: 10.0),
                        CircularProgressIndicator(
                            value: 0.20,
                            color: CupertinoColors.systemGreen,
                            backgroundColor: CupertinoColors.systemGrey4,
                            strokeWidth: 8.0)
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 220.0,
                child: TodoListWidget(),),
              SizedBox(height: 20.0),
              Container(
                padding: EdgeInsets.all(20.0),
                child: const Row(
                  children: [
                    Text(
                      "Allergies",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Icon(CupertinoIcons.check_mark_circled,
                        color: CupertinoColors.activeGreen, size: 30)
                  ],
                ),
              ),
              Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(color: CupertinoColors.systemGrey6, borderRadius: BorderRadius.circular(20.0)),
                    padding: EdgeInsets.all(10.0),
                    // padding: EdgeInsets.all(20.0),
                    child: Text("Seafood-free meal prepared", style: TextStyle(fontSize: 20),),
              ),
              SizedBox(height: 20.0),
              Container(
                padding: EdgeInsets.all(20.0),
                child: const Row(
                  children: [
                    Text(
                      "When you arrive",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              HorizontalSlider()


              // Text("Report Slider 1"),
            ],
          ),
        )));
  }
}

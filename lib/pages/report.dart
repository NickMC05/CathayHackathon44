import 'package:cathay/components/report_components/custom_card.dart';
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
                      "Docs",
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
              HorizontalSlider(),
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
                height: 400,
                child: TodoListWidget(),)
              // Text("Report Slider 1"),
            ],
          ),
        )));
  }
}

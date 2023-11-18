
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TodoItem {
  bool isDone;
  final String title;
  final String detail;

  TodoItem({this.isDone = false, required this.title, required this.detail});
}

class TodoListWidget extends StatefulWidget {
  @override
  _TodoListWidgetState createState() => _TodoListWidgetState();
}

class _TodoListWidgetState extends State<TodoListWidget> {
  final List<TodoItem> _items = [
    TodoItem(title: 'Oxygen Mask', detail: '2'),
    TodoItem(title: 'Zyprexa', detail: '14 tablets'),
    TodoItem(title: 'Vitamin D', detail: '7 tablets'),
    // Add more items here
  ];

  void _toggleTodoItem(int index) {
    setState(() {
      _items[index].isDone = !_items[index].isDone;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      padding: const EdgeInsets.all(10.0),
      // appBar: AppBar(title: Text('To-Do List')),
      decoration: BoxDecoration(
        color: CupertinoColors.systemGrey5,
        borderRadius: BorderRadius.circular(20)
      ),
      child: ListView.separated(
        itemCount: _items.length,
        separatorBuilder: (context, index) => Divider(
          height: 1,
          thickness: 1,
          color: Colors.black,
          indent: MediaQuery.of(context).size.width * 0.1,
          endIndent: MediaQuery.of(context).size.width * 0.1,
        ),
        itemBuilder: (context, index) {
          final item = _items[index];
          return CupertinoListTile(
            leading: CupertinoCheckbox(
              value: item.isDone,
              onChanged: (bool? newValue) {
                _toggleTodoItem(index);
              },
            ),
            title: Container(
              padding: EdgeInsets.only(left: 10.0, right: 30.0),
              child: Row(children: [
                Text(
                item.title,
                style: TextStyle(
                  decoration: item.isDone ? TextDecoration.lineThrough : null,
                  fontSize: 20
                ),
              ),
              Spacer(),
              Text(item.detail)
              ],),
            )
          );
        },
      )
    );
  }
}


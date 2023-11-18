
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
    TodoItem(title: 'Task 1', detail: 'Detail 1'),
    TodoItem(title: 'Task 2', detail: 'Detail 2'),
    // Add more items here
  ];

  void _toggleTodoItem(int index) {
    setState(() {
      _items[index].isDone = !_items[index].isDone;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('To-Do List')),
      body: ListView.separated(
        itemCount: _items.length,
        separatorBuilder: (context, index) => Divider(
          height: 1,
          thickness: 1,
          indent: MediaQuery.of(context).size.width * 0.1,
          endIndent: MediaQuery.of(context).size.width * 0.1,
        ),
        itemBuilder: (context, index) {
          final item = _items[index];
          return ListTile(
            leading: Checkbox(
              value: item.isDone,
              onChanged: (bool? newValue) {
                _toggleTodoItem(index);
              },
            ),
            title: Text(
              item.title,
              style: TextStyle(
                decoration: item.isDone ? TextDecoration.lineThrough : null,
              ),
            ),
            subtitle: Text(item.detail),
          );
        },
      ),
      backgroundColor: Colors.grey,
    );
  }
}


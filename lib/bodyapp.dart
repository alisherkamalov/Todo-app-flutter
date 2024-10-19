import 'package:flutter/material.dart';
import 'package:mpf_app/infotodo.dart';
import 'package:mpf_app/newtodo.dart';

class Todo {
  final String name;
  final String desc;

  Todo({
    required this.name,
    required this.desc,
  });
}

class BodyApp extends StatefulWidget {
  const BodyApp({super.key});

  @override
  State<BodyApp> createState() => _BodyAppState();
}

class _BodyAppState extends State<BodyApp> {
  final List<Todo> _tasks = [];
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Список задач'),
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          itemCount: _tasks.length,
          itemBuilder: (context, index) {
            final task = _tasks[index];
            return ListTile(
              title: Text(task.name),
              subtitle: Text(task.desc.length > 30 ? '${task.desc.substring(0, 30)}...' : task.desc),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Infotodo(
                      taskName: task.name,
                      taskDesc: task.desc,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => NewTodo(
                nameController: _nameController,
                descController: _descController,
              ),
            ),
          );

          if (_nameController.text.isNotEmpty && _descController.text.isNotEmpty) {
            setState(() {
              _tasks.add(Todo(
                name: _nameController.text,
                desc: _descController.text,
              ));
            });

            _nameController.clear();
            _descController.clear();
          }
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}

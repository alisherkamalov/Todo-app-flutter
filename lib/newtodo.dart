import 'package:flutter/material.dart';

class NewTodo extends StatefulWidget {
  final TextEditingController nameController;
  final TextEditingController descController;

  const NewTodo({
    Key? key,
    required this.nameController,
    required this.descController,
  }) : super(key: key);

  @override
  _NewTodoState createState() => _NewTodoState();
}

class _NewTodoState extends State<NewTodo> {
  late FocusNode _nameFocusNode;
  late FocusNode _descFocusNode;

  @override
  void initState() {
    super.initState();
    _nameFocusNode = FocusNode();
    _descFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _nameFocusNode.dispose();
    _descFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Новая задача'),
      ),
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Text(
                  'Введите информацию о задаче',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 20),
                Theme(
                  data: Theme.of(context).copyWith(
                    textSelectionTheme: TextSelectionThemeData(
                      cursorColor: Colors.blue, 
                      selectionColor: Colors.blue.withOpacity(0.5), 
                      selectionHandleColor: Colors.blue,
                    ),
                  ),
                  child: TextField(
                    controller: widget.nameController,
                    focusNode: _nameFocusNode,
                    decoration: InputDecoration(
                      labelText: 'Название задачи',
                      labelStyle: TextStyle(
                        color: _nameFocusNode.hasFocus ? Colors.blue : Colors.grey,
                      ),
                      border: const OutlineInputBorder(),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Theme(
                  data: Theme.of(context).copyWith(
                    textSelectionTheme: TextSelectionThemeData(
                      cursorColor: Colors.blue, 
                      selectionColor: Colors.blue.withOpacity(0.5), 
                      selectionHandleColor: Colors.blue, 
                    ),
                  ),
                  child: TextField(
                    controller: widget.descController,
                    focusNode: _descFocusNode,
                    decoration: InputDecoration(
                      labelText: 'Описание задачи',
                      labelStyle: TextStyle(
                        color: _descFocusNode.hasFocus ? Colors.blue : Colors.grey,
                      ),
                      border: const OutlineInputBorder(),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: const Text(
                    'Сохранить',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

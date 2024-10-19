import 'package:flutter/material.dart';
class HeaderApp extends StatelessWidget implements PreferredSizeWidget {
  const HeaderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: const Text(
        'TODO App',
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
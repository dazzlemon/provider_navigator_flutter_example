import 'package:flutter/material.dart';
import '../widgets/theme_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
    Scaffold(
			floatingActionButton: const ThemeButton(),
			body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.pushNamed(context, '/settings'),
          child: const Text('Settings'),
        ),
      ),
    );
}
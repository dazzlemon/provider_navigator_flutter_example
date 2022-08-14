import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() =>
  runApp(ChangeNotifierProvider(
		create: (_) => ThemeModel(),
		child: const MyApp()
	));

class ThemeModel extends ChangeNotifier {
	var isDarkMode = false;

	ThemeMode get mode => isDarkMode ? ThemeMode.dark  : ThemeMode.light;
	IconData  get icon => isDarkMode ? Icons.dark_mode : Icons.light_mode;

	void toggle() {
		isDarkMode = !isDarkMode;
		notifyListeners();
	}
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
		Consumer<ThemeModel>(
			builder: (_, theme, __) =>
				MaterialApp(
					theme: ThemeData.light(),
					darkTheme: ThemeData.dark(),
					themeMode: theme.mode,
					home: const HomeScreen(),
				)
		);
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
    Scaffold(
			floatingActionButton: Consumer<ThemeModel>(
				builder: (_, theme, __) => FloatingActionButton(
					onPressed: theme.toggle,
					child: Icon(theme.icon),
				),
			),
    );
}
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';
import 'screens/settings_screen.dart';
import 'models/theme_model.dart';
import 'models/volume_model.dart';

void main() =>
  runApp(MultiProvider(
		providers: [
			ChangeNotifierProvider<ThemeModel>(create: (_) => ThemeModel(false)),
			ChangeNotifierProvider<VolumeModel>(
				create: (_) => VolumeModel(15, 0, 100))
		],
		child: const MyApp()
	));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
		Consumer<ThemeModel>(
			builder: (_, theme, __) =>
				MaterialApp(
					initialRoute: '/',
					routes: {
						'/': (_) => const HomeScreen(),
						'/settings': (_) => const SettingsScreen(),
					},
					theme: ThemeData.light(),
					darkTheme: ThemeData.dark(),
					themeMode: theme.mode,
				)
		);
}
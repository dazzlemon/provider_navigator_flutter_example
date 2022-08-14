import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() =>
  runApp(MultiProvider(
		providers: [
			ChangeNotifierProvider<ThemeModel>(create: (_) => ThemeModel(false)),
			ChangeNotifierProvider<VolumeModel>(create: (_) => VolumeModel(15, 0, 100))
		],
		child: const MyApp()
	));

class ThemeModel extends ChangeNotifier {
	bool _isDarkMode;
	ThemeModel(this._isDarkMode);

	bool get isDarkMode => _isDarkMode;
	ThemeMode get mode => isDarkMode ? ThemeMode.dark  : ThemeMode.light;
	IconData  get icon => isDarkMode ? Icons.dark_mode : Icons.light_mode;

	void toggle() {
		_isDarkMode = !isDarkMode;
		notifyListeners();
	}
}

class VolumeModel extends ChangeNotifier {
	double _value;
	final double max;
	final double min;
	VolumeModel(this._value, this.min, this.max);

	double get value => _value;

	set value(double newValue) {
		if (newValue >= min && newValue <= max && newValue != _value) {
			_value = newValue;
			notifyListeners();
		}
	}
}

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

class ThemeButton extends StatelessWidget {
  const ThemeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
		Consumer<ThemeModel>(
			builder: (_, theme, __) => FloatingActionButton(
				onPressed: theme.toggle,
				child: Icon(theme.icon),
			),
		);
}

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

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
    Scaffold(
			floatingActionButton: const ThemeButton(),
			body: Consumer<VolumeModel>(
				builder: (_, volume, __) => Column(
					mainAxisAlignment: MainAxisAlignment.center,
				  crossAxisAlignment: CrossAxisAlignment.center,
					children: [
						Text(volume.value.toStringAsFixed(2)),
						Slider(
							value: volume.value,
							max: volume.max,
							min: volume.min,
							onChanged: (newValue) => volume.value = newValue
						),
					]
				)
			)
		);
}
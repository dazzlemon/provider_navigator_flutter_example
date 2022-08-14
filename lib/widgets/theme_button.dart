import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/theme_model.dart';

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
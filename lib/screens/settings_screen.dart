import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/volume_model.dart';
import '../widgets/theme_button.dart';

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
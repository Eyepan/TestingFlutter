import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

// ignore: use_key_in_widget_constructors
class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: SettingsBody(),
    );
  }
}

// ignore: use_key_in_widget_constructors
class SettingsBody extends StatefulWidget {
  @override
  _SettingsBodyState createState() => _SettingsBodyState();
}

class _SettingsBodyState extends State<SettingsBody> {
  @override
  Widget build(BuildContext context) {
    return SettingsGroup(
      title: 'Appearance',
      children: [
        DropDownSettingsTile(
          title: 'Choose layout',
          settingKey: 'visual-layout',
          selected: Settings.getValue('visual-layout', 1),
          values: const <int, String>{1: "Cards", 2: "Compact"},
          onChange: (value) async {
            await Settings.setValue('visual-layout', value);
          },
        ),
      ],
    );
  }
}

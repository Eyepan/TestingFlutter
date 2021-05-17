import 'package:flutter/material.dart';
import 'package:flash_reads/main.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

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

class SettingsBody extends StatefulWidget {
  @override
  _SettingsBodyState createState() => _SettingsBodyState();
}

class _SettingsBodyState extends State<SettingsBody> {
  @override
  Widget build(BuildContext context) {
    return SettingsList(
      sections: [
        SettingsSection(
          title: "Appearance",
          tiles: [
            SettingsTile(
              title: 'Layout',
              subtitle: "Choose the layout in which the aricles are shown",
              leading: const Icon(Icons.layers),
              onPressed: (context) {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => LayoutsScreen()));
              },
            ),
            SettingsTile(
              title: "Theme",
              subtitle: "Change the theme of the app",
              leading: const Icon(Icons.color_lens),
              onPressed: (context) {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => ThemesScreen()));
              },
            )
          ],
        )
      ],
    );
  }
}

class LayoutsScreen extends StatefulWidget {
  @override
  LayoutsScreenState createState() => LayoutsScreenState();
}

class LayoutsScreenState extends State<LayoutsScreen> {
  int layoutIndex = ['card', 'compact']
      .indexOf(prefs.getString('visual-layout-type') ?? 'card');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Layouts"),
      ),
      body: SettingsList(sections: [
        SettingsSection(
          tiles: [
            SettingsTile(
              title: 'Cards',
              trailing: trailingWidget(0),
              onPressed: (BuildContext context) {
                changeLayout(0);
              },
            ),
            SettingsTile(
              title: 'Compact',
              trailing: trailingWidget(1),
              onPressed: (BuildContext context) {
                changeLayout(1);
              },
            )
          ],
        )
      ]),
    );
  }

  Widget trailingWidget(int index) {
    return (layoutIndex == index)
        ? const Icon(Icons.check, color: Colors.blue)
        : const Icon(null);
  }

  void changeLayout(int index) {
    setState(() {
      layoutIndex = index;
    });
    Navigator.pop(context);
    prefs.setString('visual-layout-type', ['card', 'compact'][index]);
  }
}

class ThemesScreen extends StatefulWidget {
  @override
  _ThemesScreenState createState() => _ThemesScreenState();
}

class _ThemesScreenState extends State<ThemesScreen> {
  int themeIndex =
      ['dark', 'light'].indexOf(prefs.getString('theme') ?? 'dark');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Themes"),
      ),
      body: SettingsList(sections: [
        SettingsSection(
          tiles: [
            SettingsTile(
              title: 'Dark',
              trailing: trailingWidget(0),
              onPressed: (BuildContext context) {
                changeTheme(0);
              },
            ),
            SettingsTile(
              title: 'Light',
              trailing: trailingWidget(1),
              onPressed: (BuildContext context) {
                changeTheme(1);
              },
            ),
          ],
        )
      ]),
    );
  }

  Widget trailingWidget(int index) {
    return (themeIndex == index)
        ? const Icon(Icons.check, color: Colors.blue)
        : const Icon(null);
  }

  void changeTheme(int index) {
    setState(() {
      themeIndex = index;
    });
    Navigator.pop(context);
    prefs.setString('theme', ['dark', 'light'][index]);
    Phoenix.rebirth(context);
  }
}

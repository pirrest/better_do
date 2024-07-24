import 'package:better_do/view/settings/notifications_settings_widget.dart';
import 'package:better_do/view/settings/theme_setting_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ThemeSettingWidget(),
                SizedBox(height: 32),
                NotificationsSettingsWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
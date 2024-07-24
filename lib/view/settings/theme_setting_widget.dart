import 'package:better_do/providers/theme_setting.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ThemeSettingWidget extends ConsumerWidget {
  const ThemeSettingWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTheme = ref.watch(rpThemeSettingProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text("Theme"),
        const SizedBox(height: 16),
        ToggleButtons(
          borderRadius: BorderRadius.circular(16),
          onPressed: (index) {
            ref
                .read(rpThemeSettingProvider.notifier)
                .set(ThemeMode.values[index]);
          },
          isSelected: [
            selectedTheme.index == 0,
            selectedTheme.index == 1,
            selectedTheme.index == 2
          ],
          children: const [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text("System"),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text("Light"),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text("Dark"),
            )
          ],
        ),
      ],
    );
  }
}
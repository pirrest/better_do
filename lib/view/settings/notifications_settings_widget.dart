import 'package:better_do/providers/local_notifications.dart';
import 'package:better_do/repositories/preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class NotificationsSettingsWidget extends ConsumerStatefulWidget {
  const NotificationsSettingsWidget({super.key});

  @override
  ConsumerState createState() => _NotificationsSettingsWidgetState();
}

class _NotificationsSettingsWidgetState
    extends ConsumerState<NotificationsSettingsWidget> {
  late DateTime _date;
  late DateFormat _dateFormat;

  @override
  void initState() {
    super.initState();
    _dateFormat = DateFormat("hh:mm");
    final time =
        ref.read(rpPreferencesProvider).getWholeDayTaskNotificationTime();
    _date = DateTime.now();
    _date = _date.copyWith(hour: time.hour, minute: time.minute);
    ref.read(localNotificationsServiceProvider);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text("Full day tasks notification time"),
        GestureDetector(
          onTap: _select,
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const Icon(CupertinoIcons.clock),
            title: Text(
              _dateFormat.format(_date),
                      overflow: TextOverflow.ellipsis,
                    ),
            trailing: ElevatedButton(onPressed: _select, child: const Text("Change")),
          ),
        ),
      ],
    );
  }

  void _select() async {
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_date),
    );
    setState(() {
      if (time != null) {
        _date = _date.copyWith(
          hour: time.hour,
          minute: time.minute,
          second: 0,
          millisecond: 0,
        );
        ref
            .read(rpPreferencesProvider)
            .setWholeDayTaskNotificationTime(TimeOfDay.fromDateTime(_date));
      }
    });
  }
}
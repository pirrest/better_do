import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DueTimeFormField extends StatefulWidget {
  const DueTimeFormField({
    super.key,
    this.date,
    required this.onSelected,
  });

  final DateTime? date;
  final void Function(DateTime? date) onSelected;

  @override
  State<DueTimeFormField> createState() => _DueTimeFormFieldState();
}

class _DueTimeFormFieldState extends State<DueTimeFormField> {
  bool _enabled = false;
  DateTime? _date;

  @override
  void initState() {
    super.initState();
    _date = widget.date;
    _enabled = _date != null;
  }

  @override
  Widget build(BuildContext context) {
    final formatter = DateFormat("hh:mm");
    return AnimatedSize(
      duration: const Duration(milliseconds: 600),
      alignment: Alignment.topLeft,
      curve: Curves.easeInOut,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
            onTap: _select,
            child: Row(
              children: [
                const Icon(CupertinoIcons.clock),
                const SizedBox(width: 8),
                Expanded(
                    child: Text(
                      _enabled ? formatter.format(_date!) : "Time",
                  overflow: TextOverflow.ellipsis,
                )),
                const SizedBox(width: 8),
                Switch.adaptive(
                  value: _enabled,
                  onChanged: (value) async {
                    if (value) {
                      _select();
                    } else {
                      setState(() {
                        _enabled = false;
                      });
                    }
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _select() async {
    final now = DateTime.now();
    _date ??= now;
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_date!),
    );
    setState(() {
      _enabled = time != null;
      if (time != null) {
        _date?.copyWith(
          hour: time.hour,
          minute: time.minute,
          second: 0,
          millisecond: 0,
        );
      }
    });
  }
}
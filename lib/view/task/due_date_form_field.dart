import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DueDateFormField extends StatefulWidget {
  const DueDateFormField({
    super.key,
    this.date,
    required this.onSelected,
  });

  final DateTime? date;
  final void Function(DateTime? date) onSelected;

  @override
  State<DueDateFormField> createState() => _DueDateFormFieldState();
}

class _DueDateFormFieldState extends State<DueDateFormField> {
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
    final formatter = DateFormat("dd MMMM yyyy");
    return AnimatedSize(
      duration: const Duration(milliseconds: 600),
      alignment: Alignment.topLeft,
      curve: Curves.easeInOut,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
            onTap: _selectDate,
            child: Row(
              children: [
                const Icon(CupertinoIcons.calendar),
                const SizedBox(width: 8),
                Expanded(
                    child: Text(
                      _enabled ? formatter.format(_date!) :  "Date",
                  overflow: TextOverflow.ellipsis,
                )),
                const SizedBox(width: 8),
                Switch.adaptive(
                  value: _enabled,
                  onChanged: (value) async {
                    if (value) {
                      _selectDate();
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

  void _selectDate() async {
    final now = DateTime.now();
    _date ??= now;
    _date = await showDatePicker(
      initialDate: _date,
      context: context,
      firstDate: now,
      lastDate: DateTime(now.year + 10),
    );
    setState(() {
      _enabled = _date != null;
    });
  }

}
import 'package:flutter/material.dart';

class NotesFilterWidget extends StatefulWidget {
  const NotesFilterWidget({super.key});

  @override
  State<NotesFilterWidget> createState() => _NotesFilterWidgetState();
}

class _NotesFilterWidgetState extends State<NotesFilterWidget> {
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 100,
      child: ExpansionTile(
        title: Text('title'),
      ),
    );
  }
}

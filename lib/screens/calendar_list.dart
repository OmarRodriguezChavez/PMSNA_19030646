import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psmna10/screens/list_events.dart';

class EventList extends StatefulWidget {
  const EventList({super.key});

  @override
  State<EventList> createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Events List'),
      ),
      body: ListEvents(),
    );
  }
}
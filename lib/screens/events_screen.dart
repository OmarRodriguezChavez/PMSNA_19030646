import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psmna10/screens/event.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:psmna10/screens/event.dart';
import 'package:psmna10/database/database_helper.dart';

class CalendarEvents extends StatefulWidget {
  const CalendarEvents({super.key});

  @override
  State<CalendarEvents> createState() => _CalendarEventsState();
}

class _CalendarEventsState extends State<CalendarEvents> {

  late Map<DateTime, List<Event>> selectedEvents;
  CalendarFormat format = CalendarFormat.month;
  DateTime daySelection = DateTime.now();
  DateTime onDay = DateTime.now();
  Event? objEvent;
  final _eventController = TextEditingController();
  final _descController = TextEditingController();

  @override
  void initState() {
    selectedEvents = {};
    super.initState();
  }
  List<Event> _getEventsfromDay(DateTime date) {
    return selectedEvents[date] ?? [];
  }
  @override
  void dispose() {
    _eventController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    DatabaseHelper database = DatabaseHelper();
    if (ModalRoute.of(context)!.settings.arguments != null) {
      objEvent = ModalRoute.of(context)!.settings.arguments as Event;
      _eventController.text = objEvent!.titlEvento!;
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calendario"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/eventsList');
            },
            icon: const Icon(Icons.list),
          )
        ],
      ),
      body: Column(
        children: [
          TableCalendar(
            focusedDay: daySelection,
            firstDay: DateTime(1990),
            lastDay: DateTime(2050),
            calendarFormat: format,
            onFormatChanged: (CalendarFormat _format) {
              setState(() {
                format = _format;
              });
            },
            startingDayOfWeek: StartingDayOfWeek.sunday,
            daysOfWeekVisible: true,

            //Day Changed
            onDaySelected: (DateTime selectDay, DateTime focusDay) {
              setState(() {
                daySelection = selectDay;
                onDay = focusDay;
              });
              print(onDay);
            },
            selectedDayPredicate: (DateTime date) {
              return isSameDay(daySelection, date);
            },
            eventLoader: _getEventsfromDay,
            calendarStyle: const CalendarStyle(
              isTodayHighlighted: true,
              selectedDecoration: const BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
              selectedTextStyle: const TextStyle(color: Colors.white),
              todayDecoration: const BoxDecoration(
                color: Colors.yellow,
                shape: BoxShape.circle,
              ),
              defaultDecoration: BoxDecoration(
                shape: BoxShape.rectangle,
              ),
              weekendDecoration: BoxDecoration(
                shape: BoxShape.rectangle,
              ),
            ),
            headerStyle: HeaderStyle(
              formatButtonVisible: true,
              titleCentered: true,
              formatButtonShowsNext: false,
              formatButtonDecoration: BoxDecoration(

                borderRadius: BorderRadius.circular(5.0),
              ),
              formatButtonTextStyle: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          ..._getEventsfromDay(daySelection).map(
            (Event event) => ListTile(
              title: Text(
                event.titlEvento.toString(),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Nuevo Evento"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _eventController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    hintText: 'Title',
                    labelText: 'Ingresa el titulo del evento',
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _descController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    hintText: 'Description',
                    labelText: 'Ingresa la descripción del evento',
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                child: const Text("Cancelar"),
                onPressed: () => Navigator.pop(context),
              ),
              TextButton(
                child: const Text("Ok"),
                onPressed: () {
                  if (_eventController.text.isEmpty) {
                  } else {
                    if (objEvent == null) {
                      database.INSERT_Evento('eventos', {
                        'titlEvento': _eventController.text,
                        'dscEvento': _descController.text,
                        'fechaEvento': daySelection.toString(),
                      });
                      if (selectedEvents[daySelection] != null) {
                        selectedEvents[daySelection]?.add(
                          Event(titlEvento: _eventController.text),
                        );
                      } else {
                        selectedEvents[daySelection] = [
                          Event(titlEvento: _eventController.text)
                        ];
                      }
                    }
                  }
                  Navigator.pop(context);
                  _eventController.clear();
                  _descController.clear();
                  setState(() {});
                  return;
                },
              ),
            ],
          ),
        ),
        label: Text("New Event"),
        icon: Icon(Icons.add_box_outlined),
      ),
    );
  }
}
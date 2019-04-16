
import 'package:flutter/material.dart';
import 'package:my_form/Pages/event_list_view/models/list_item.dart';
import 'package:my_form/Pages/event_list_view/ui/event_list_view.dart';
import 'package:my_form/Service/event_api.dart';
import 'package:my_form/data_models/event.dart';
import 'package:my_form/data_models/event_list.dart';
//import 'package:my_form/data_models/event.dart';

class EventListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EventListState();
  }

}
class EventListState extends State<EventListPage> {
  //final List<ListItem> items;
  List<EventCellItem> items = [];

  bool needReload = true;
  @override
  Widget build(BuildContext context) {
    final title = 'Event List';
    if (needReload == true) {
      _showList();
    }
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title)
        ),
        body: new EventListView(items: items)

      ),

    );
  }

  void _showList() {
    eventService.getEventList().then((EventList result) => _handleFetchedResult(result));
  }

  void _handleFetchedResult(EventList result) {
    List<EventCellItem> eventCellItem = <EventCellItem>[];

    for (Event event  in result.eventList) {
      EventCellItem item = EventCellItem(event.category, event.image, event.description);
      eventCellItem.add(item);
    }

    setState(() {
      items = eventCellItem;
      needReload = false;
    });
  }


}

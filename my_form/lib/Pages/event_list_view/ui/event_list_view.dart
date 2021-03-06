import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_form/Pages/event_list_view/models/list_item.dart';
import 'package:my_form/Pages/event_list_view/ui/event_cell.dart';

class EventListView extends StatelessWidget {
  const EventListView({
    Key key,
    @required this.items,
  }) : super(key: key);

  final List<ListItem> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          if (item is HeadingItem) {
            return ListTile(
              title: Text(
                item.heading,
                style: Theme.of(context).textTheme.headline,
              ),
            );
          } else if (item is EventCellItem) {
            return new FlatButton(
              child: new EventCell(item),
              padding: const EdgeInsets.all(0.0),
              onPressed: () {
//                Navigator.push(context, new MaterialPageRoute(builder: (context){
//                  return new MovieDetail(movies[i]);
//                }));
                debugPrint("");
              },
              color: Colors.white,
            );
          }
        });
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_form/Pages/event_list_view/models/list_item.dart';
import 'package:my_form/Pages/event_list_view/ui/event_cell.dart';
import 'package:my_form/Pages/event_list_view/ui/session_cell.dart';

class SessionListView extends StatelessWidget {
  const SessionListView({
    Key key,
    @required this.items,
  }) : super(key: key);

  final List<ListItem> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
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
          } else if (item is SessionCellItem) {
            return new FlatButton(
              child: new SessionCell(item),
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

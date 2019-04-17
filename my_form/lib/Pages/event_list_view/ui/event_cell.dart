import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_form/Pages/event_list_view/models/list_item.dart';
import 'package:my_form/Pages/event_list_view/ui/session_cell.dart';
import 'package:my_form/Pages/event_list_view/ui/session_list_view.dart';
import 'package:my_form/ui/custom_button.dart';

class EventCell extends StatelessWidget {
  final EventCellItem model;
  Color mainColor = const Color(0xff3C3261);

  EventCell(this.model);

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Row(
          children: <Widget>[
            new Expanded(
              //padding: const EdgeInsets.all(0.0),
              child: new ImageHeaderView(model: model, mainColor: mainColor),
            ),
          ],
        ),
        new Row(
          children: <Widget>[
            new Expanded(
                child: new ContentView(model: model, mainColor: mainColor)),
          ],
        ),
        new Container(
          width: 300.0,
          height: 0.5,
          color: const Color(0xD2D2E1ff),
          margin: const EdgeInsets.all(16.0),
        )
      ],
    );
  }
}

class ImageHeaderView extends StatelessWidget {
  const ImageHeaderView({
    Key key,
    @required this.model,
    @required this.mainColor,
  }) : super(key: key);

  final EventCellItem model;
  final Color mainColor;

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Container(
        margin: const EdgeInsets.all(8.0),
//                                child: new Image.network(image_url+movies[i]['poster_path'],width: 100.0,height: 100.0),
        constraints: new BoxConstraints.expand(
          height: 200.0,
        ),
        alignment: Alignment.bottomLeft,
//        child: Text(
//          model.name,
//          style: TextStyle(
//              fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
//        ),
        decoration: new BoxDecoration(
          borderRadius: new BorderRadius.circular(0.0),
          color: Colors.purple,
//          gradient: new LinearGradient(
//              colors: [Colors.black, Colors.white],
//              begin: Alignment.bottomCenter,
//              end: Alignment.topCenter),
          image: new DecorationImage(
              image: new NetworkImage(model.imageUrl), fit: BoxFit.cover),
//          boxShadow: [
//            new BoxShadow(
//                color: mainColor, blurRadius: 5.0, offset: new Offset(2.0, 5.0))
//          ],
        ),
      ),
      Positioned(
        top: 8.0,
        bottom: 0.0,
        left: 8.0,
        right: 8.0,
        child: new Container(
          decoration: new BoxDecoration(
            borderRadius: new BorderRadius.circular(0.0),
            color: Colors.purple,
            gradient: new LinearGradient(
                colors: [Colors.black, Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter),
          ),
        ),
      ),
      Positioned(
        bottom: 10.0,
        left: 18.0,
        right: 10.0,
        child: Text(
          model.name,
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    ]);
  }
}

class ContentView extends StatelessWidget {
  const ContentView({
    Key key,
    @required this.model,
    @required this.mainColor,
  }) : super(key: key);

  final EventCellItem model;
  final Color mainColor;

  @override
  Widget build(BuildContext context) {
    List<SessionCellItem> _sessionCellItem = _transform(model);
    return new Container(
      margin: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
      child: new Column(
        children: [
          new Padding(padding: const EdgeInsets.all(2.0)),
          new Text(
            model.description,
            //maxLines: 3,
            style: new TextStyle(
                color: const Color(0xff8785A4), fontFamily: 'Arvo'),
          ),
          new Row(
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: new CustomButton(
                    title: "Call",
                    onPressed: () {
                      debugPrint("Tapped Me");
                    }),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: new CustomButton(
                    title: "CBRE",
                    onPressed: () {
                      debugPrint("Tapped Me");
                    }),
              ),
            ],
          ),
          RichText(
            text: TextSpan(
              text: '',
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                TextSpan(
                    text: 'Location: ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: model.eventData.location),
              ],
            ),
          ),
//          Container(
//              decoration: BoxDecoration(color: Colors.white),
//              child: new SessionListView(items: _transform(model))),
//          Column(
//            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//            children: [
//              Text('images/pic1.jpg'),
//              Text('images/pic2.jpg'),
//              Text('images/pic3.jpg'),
//            ],
//          ),
//          ListView.builder(
//              shrinkWrap: true,
//              itemCount: _sessionCellItem.length,
//              itemBuilder: (context, index) {
//                final item = _sessionCellItem[index];
//                if (item is SessionCellItem) {
//                  return new FlatButton(
//                    child: new SessionCell(item),
//                    padding: const EdgeInsets.all(0.0),
//                    onPressed: () {
////                Navigator.push(context, new MaterialPageRoute(builder: (context){
////                  return new MovieDetail(movies[i]);
////                }));
//                      debugPrint("");
//                    },
//                    color: Colors.white,
//                  );
//                }
//              }),
          new SessionListView(items: _transform(model)),
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }

  List<SessionCellItem> _transform(EventCellItem eventCellItem) {
    return eventCellItem.eventData.sessions
        .map((session) => SessionCellItem(session.sessionTime, session.duration,
            eventCellItem.eventData.cost, eventCellItem.eventData))
        .toList();
  }
}

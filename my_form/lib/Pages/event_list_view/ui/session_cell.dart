import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_form/Pages/event_list_view/models/list_item.dart';
import 'package:my_form/ui/custom_button.dart';
//import 'package:my_form/ui/custom_button.dart';

class SessionCell extends StatelessWidget {
  final SessionCellItem model;

  //Color mainColor = const Color(0xff3C3261);

  SessionCell(this.model);

  @override
  Widget build(BuildContext context) {
//    return Container(
//      alignment: Alignment.topCenter,
//      height: 30,
//      child: Text(model.duration),
//    );

    final leftColumn = Container(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(model.time,
              textAlign: TextAlign.left,
              style: TextStyle(fontWeight: FontWeight.bold)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(model.duration,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.normal)),
              Text(model.cost,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.normal)),
            ],
          ),
//          RichText(
//            text: TextSpan(
//              text: '',
//              style: DefaultTextStyle.of(context).style,
//              children: <TextSpan>[
//                TextSpan(
//                    text: 'Location: ',
//                    style: TextStyle(fontWeight: FontWeight.bold)),
//                TextSpan(text: model.eventData.location),
//              ],
//            ),
//          ),
        ],
      ),
    );

    final rightColumn = SizedBox(
      width: 130,
      child: CustomButton(
          title: "RESERVE",
          onPressed: () {
            debugPrint("Tapped Me");
          }),
    );

    final durationAndCostRow = new Expanded(
        child: new Container(
      padding: new EdgeInsets.only(left: 0.0),
      child: new Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: new Text(
              model.duration,
              style: new TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 16.0,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(5.0),
            color: Colors.grey,
            child: new Text(
              model.cost,
              style: new TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    ));
    return SizedBox(
      height: 60,
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
//        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//        textDirection: TextDirection.ltr,
        //textBaseline: TextBaseline.alphabetic,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  //color: Colors.red,
                  child: Text(model.time),
                ),
                durationAndCostRow,
              ],
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.topRight,
              child: ButtonTheme(
                minWidth: 100,
                height: 30,
                child: new CustomButton(
                    title: "RESERVE",
                    onPressed: () {
                      debugPrint("Tapped Me");
                    }),
              ),
            ),
          ),
//          Expanded(
//            //padding: const EdgeInsets.only(right: 8.0),
//            child: ButtonTheme(
//              minWidth: 100,
//              child: new CustomButton(
//                  title: "RESERVE",
//                  onPressed: () {
//                    debugPrint("Tapped Me");
//                  }),
//            ),
//          ),
//          Expanded(
//            child: Container(
//              child: ButtonTheme(
//                minWidth: 100,
//                child: new CustomButton(
//                    title: "RESERVE",
//                    onPressed: () {
//                      debugPrint("Tapped Me");
//                    }),
//              ),
//            ),
//          ),
        ],
      ),
    );
  }
}

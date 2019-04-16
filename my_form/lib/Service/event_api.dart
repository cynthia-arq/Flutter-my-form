import 'dart:async';
import 'dart:convert';

import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_middleware/http_with_middleware.dart';

import 'package:my_form/data_models/event_list.dart';
import 'package:http_logger/http_logger.dart';

class EventService {

  static const String baseUrl = "https://pulse-enage-staging.i1-isolated.p.azurewebsites.net/app/api.php";

  static const String authToken = "277ab3cdae5b82404b9991abd61b561f";

  final _httpClient = new HttpClient();

  //{"action":"getEvents"}
//  Future<EventList> getEventList() async {
//    var uri = Uri.https(
//      baseUrl,
//      '/getEvents',
//      <String, String>{
//        'Authorization': authToken,
//        'Language': 'eng',
//        'API_VERSION': '1.19',
//      },
//    );
//
//    var response = await _getRequest(uri);
//
//
//    //EventList list = EventList.fromJSON(json.decode(response));
//
//    // Give some additional delay to simulate slow network
//    //await Future.delayed(const Duration(seconds: 1));
//
//    return list;
//  }

  Future<EventList> getEventList() async {

    HttpWithMiddleware httpClient = HttpWithMiddleware.build(middlewares: [
      HttpLogger(logLevel: LogLevel.BODY),
    ]);

    String url = """https://pulse-enage-staging.i1-isolated.p.azurewebsites.net/app/api.php?payload={"action":"getEvents"}""";
    final response = await httpClient.get(
      url,
      headers: {
        "Authorization": '9732893C-E118-4B7E-A0B5-FC952E24792E',
        "Api-Version": '1.18'
      },
    );

    Map<String, dynamic> data = json.decode(response.body);
    return EventList.fromJSON(data["data"]);
  }

  Future<EventList> getServicesList() async {

    HttpWithMiddleware httpClient = HttpWithMiddleware.build(middlewares: [
      HttpLogger(logLevel: LogLevel.BODY),
    ]);

    String url = """https://pulse-enage-staging.i1-isolated.p.azurewebsites.net/app/api.php?payload={"action":"getServices"}""";
    final response = await httpClient.get(
      url,
      headers: {
        "Authorization": '9732893C-E118-4B7E-A0B5-FC952E24792E',
        "Api-Version": '1.18'
      },
    );

    Map<String, dynamic> data = json.decode(response.body);
    return EventList.fromJSON(data["data"]);
  }

  ///
  /// Routine to invoke the TMDB Web Server to get answers
  ///
//  Future<String> _getRequest(Uri uri) async {
//    var request = await _httpClient.getUrl(uri).
//    then((HttpClientRequest request) {
//
//      return request.close();
//    }).then((HttpClientResponse response) {
//
//      if (response.statusCode == 200) {
//        // If the call to the server was successful, parse the JSON
//        return EventList.fromJson(json.decode(response.body));
//      } else {
//        // If that call was not successful, throw an error.
//        throw Exception('Failed to load post');
//      }
//      //return response.transform(utf8.decoder).join();
//    });
    
    //var response = await request.close();

    //return response.transform(utf8.decoder).join();
  //}
}

EventService eventService = EventService();
import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {
  String location = ""; // location name for the UI
  String time = ""; // the time in that location
  String flag = ""; // url to an asset flag icon
  String url = "Asia/Karachi"; // location url for and api endpoint

  WorldTime({this.location = "", this.flag = "", this.url = ""});

  Future<void> getTime() async {
    try {
      Response response =
          await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      // print(data);

      // get properties from data
      String dateTime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      // print(dateTime);
      // print(offset);

      // Create dateTime object
      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offset)));

      time = now.toString();
    } catch (e) {
      print("Error caught: $e");
      time = "Couldn't got time";
    }
  }
}

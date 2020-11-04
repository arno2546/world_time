import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  String location;
  String time;
  String flag;
  String url;
  String dOfWeek;
  String dOfYear;
  String timeZone;

  WorldTime({this.location,this.flag,this.url});

  Future<void> getTime() async {    
    try {
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map timeMap = jsonDecode(response.body);
      String dateTime = timeMap['datetime'];
      //print(dateTime);    //for debugging
      DateTime now = DateTime.parse(dateTime.substring(0,dateTime.length-6));
      time = DateFormat.jm().format(now);
      dOfWeek = timeMap['day_of_week'].toString();
      dOfYear = timeMap['day_of_year'].toString();
      timeZone = timeMap['timezone'];
      print('Time at $location is $time');    //for debugging
      //print('now $now');      //for debugging
    } catch (e) {
      print("Error: $e");
      time="Could not Fetch info :(";
    }
  }
}
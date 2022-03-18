import 'dart:convert';
import 'package:http/http.dart';

class WorldTime{
  late String time;
  late String location;
  late String flag;
  late String url;
  late bool isDayTime;

  WorldTime({ required this.location, required this.flag, required this.url});

  Future<void> setTime() async {
    try {
      Response response = await get(
          Uri.parse("http://worldtimeapi.org/api/timezone/$url"));
      Map data = jsonDecode(response.body);

      String datetime = data['datetime'];
      String formattedDate =  datetime.substring(11,16);
      int hour = int.parse(datetime.substring(11,13));

      isDayTime = hour > 6 && hour < 20 ? true : false;
      time = formattedDate;
      print(time);
    }catch(e){
      print('The error was catch: $e');
      time = 'Could not load the time';
    }

  }
}
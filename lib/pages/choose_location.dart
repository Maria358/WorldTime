import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.jpg'),
    WorldTime(url: 'Asia/Tbilisi', location: 'Tbilisi', flag: 'georgia.jpg'),
    WorldTime(url: 'Europe/Berlin', location: 'Berlin', flag: 'germany.jpg'),
    WorldTime(url: 'Europe/Vienna', location: 'Vienna', flag: 'italy.jpg'),
    WorldTime(url: 'Europe/Kiev', location: 'Kiev', flag: 'ukraine.jpg'),
    WorldTime(url: 'Europe/Zaporozhye', location: 'Zaporozhye', flag: 'ukraine.jpg'),
    WorldTime(url: 'Europe/Madrid', location: 'Madrid', flag: 'spain.jpg'),
    WorldTime(url: 'Europe/Warsaw', location: 'Warsaw', flag: 'poland.jpg'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.setTime();

    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'isDayTime': instance.isDayTime,
      'time': instance.time
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: const Text('Choose a location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2),
              child: Card(
                child: ListTile(
                  onTap: (){
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          }),
    );
  }
}

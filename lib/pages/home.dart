import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map;

    String bgImage = data['isDayTime'] ? 'day.jpg' : 'night.jpg';

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/$bgImage'), fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(120.0, 160.0, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TextButton.icon(
                    onPressed: () async {
                      dynamic result =
                          await Navigator.pushNamed(context, '/location');
                      setState(() {
                        data = {
                          'location': result['location'],
                          'flag': result['flag'],
                          'isDayTime': result['isDayTime'],
                          'time': result['time'],
                        };
                      });
                    },
                    icon: const Icon(
                      Icons.edit_location,
                      color: Colors.white,
                    ),
                    label: const Text(
                      'Edit a location',
                      style: TextStyle(color: Colors.white),
                    )),
                const SizedBox(
                  height: 30.0,
                ),
                Text(data['location'],
                    style: const TextStyle(
                        fontSize: 18.0,
                        letterSpacing: 2.0,
                        color: Colors.white)),
                const SizedBox(
                  height: 20.0,
                ),
                Text(data['time'],
                    style: const TextStyle(fontSize: 38.0, color: Colors.white))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

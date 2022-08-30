import 'package:flutter/material.dart';

import '../services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  Future<void> setupWorldTIme() async {
    WorldTime instance = WorldTime(
        location: 'Karachi', flag: 'pakistan.png', url: 'Asia/Karachi');
    await instance.getTime();

    // Navigator.pushNamed(context, '/home'); // this will add widget on the top of loading widget
    // Navigator.pushReplacementNamed(context, '/home'); // this will replace widget on the loading widget
    /*
    * Now to send data from here to home widget
    * */
    Navigator.pushReplacementNamed(context, '/home', arguments:  {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTIme();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(50.0),
        child: Text('Loading'),
      ),
    );
  }
}

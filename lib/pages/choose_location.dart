import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  void getData() async {
    /*
    * Going to simulate network request for user name
    * */
    String userName = await Future.delayed(Duration(seconds: 3), () {
      return "Hell boy";
    });

    // Wait for first request to complete because it depends on first
    String moreParts = await Future.delayed(Duration(seconds: 2), () {
      return "New parts of the movie might come in future";
    });

    print("$userName - $moreParts");
  }

  @override
  void initState() {
    super.initState();
    getData();
    print("I'm outside scope I'll run instead of blocking");

  }

  int counter = 0;

  @override
  Widget build(BuildContext context) {
    print("build function run");

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("Choose a Location"),
        centerTitle: true,
        elevation: 0,
      ),
      body: RaisedButton(
          onPressed: () {
            setState(() {
              counter += 1;
            });
          },
          child: Text("Counter is $counter")),
    );
  }
}

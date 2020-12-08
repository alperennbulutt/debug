import 'package:debug/firabeseconnet.dart';
import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.amber,
      body: SafeArea(
        child: Container(
          height: _size.height,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: <Widget>[
              Container(
                width: 50,
                height: 100,
                color: Colors.yellowAccent,
              ),
              Container(
                child: RaisedButton(
                  child: new Text('Hi'),
                  onPressed: () {
                    Route route = MaterialPageRoute(
                        builder: (context) =>
                            ProfilePage()); //burası fribase.dart da profilepage kısmına götürdü
                    Navigator.push(context, route);
                  },
                ),
                width: 50,
                height: 100,
                color: Colors.blue,
              ),
              Container(
                width: 50,
                height: 100,
                color: Colors.green,
              ),
              Container(
                width: 50,
                height: 100,
                color: Colors.red,
              ),
              Container(
                width: 50,
                height: 100,
                color: Colors.yellowAccent,
              ),
              Container(
                width: 50,
                height: 100,
                color: Colors.blue,
              ),
              Container(
                width: 50,
                height: 100,
                color: Colors.green,
              ),
              Container(
                width: 50,
                height: 100,
                color: Colors.red,
              )
            ],
          ),
        ),
      ),
    );
  }
}

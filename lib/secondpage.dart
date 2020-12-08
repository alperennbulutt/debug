import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //debug yazısını silmek için
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.amber,
        body: SafeArea(
          //1.kısım dikey kaydırılan alan
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 200,
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
                //2.kısım yatay kaydırılan
                Container(
                  height: 300,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Container(
                        width: 300,
                        color: Colors.grey,
                      ),
                      Container(
                        width: 300,
                        color: Colors.blueGrey,
                      ),
                      Container(
                        width: 300,
                        color: Colors.green,
                      ),
                      Container(
                        width: 300,
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

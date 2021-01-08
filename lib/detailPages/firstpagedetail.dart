import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirstPageDetail extends StatefulWidget {
  @override
  _FirstPageDetailState createState() => _FirstPageDetailState();
}

class _FirstPageDetailState extends State<FirstPageDetail> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Center(child: Text("Haber baslik burada yazacak")),
        ),
        body: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SizedBox(
                child: Column(
                  children: [
                    Image.asset("assets/images/logo3.png"),
                    Text(
                      "haber icerik alakalı şeyeler burada yazacaktır lutfen duzenlı bir sekilde okuyunuz",
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text(
                  "haber tarihi",
                  style: TextStyle(color: Colors.black38),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

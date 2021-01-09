import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';

class FirstPageDetail extends StatefulWidget {
  final int index;
  FirstPageDetail({this.index});
  @override
  _FirstPageDetailState createState() => _FirstPageDetailState();
}

class _FirstPageDetailState extends State<FirstPageDetail> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream:
          FirebaseFirestore.instance.collection('firstpagedetail').snapshots(),
      builder: (context, snapshot) {
        return !snapshot.hasData
            //loading page is here
            ? Scaffold(
                backgroundColor: Colors.white,
                body: Container(
                  child: LoadingFlipping.circle(
                    borderColor: Colors.white,
                    borderSize: 3.0,
                    size: 75.0,
                    backgroundColor: Colors.white,
                    duration: Duration(milliseconds: 500),
                  ),
                ),
              )
            : MaterialApp(
                debugShowCheckedModeBanner: false,
                home: Scaffold(
                  appBar: AppBar(
                    backgroundColor: Colors.amber,
                    title: Center(
                        child:
                            Text(snapshot.data.docs[widget.index]["baslik"])),
                  ),
                  body: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: SizedBox(
                          child: Column(
                            children: [
                              Image.network(
                                  snapshot.data.docs[widget.index]["foto"]),
                              Text(
                                snapshot.data.docs[widget.index]["icerik"],
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Text(
                            snapshot.data.docs[widget.index]["tarih"],
                            style: TextStyle(color: Colors.black38),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
      },
    );
  }
}

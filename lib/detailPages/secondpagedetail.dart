import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';

class SecondPageDetail extends StatefulWidget {
  final int index;
  SecondPageDetail({this.index});
  @override
  _SecondPageDetailState createState() => _SecondPageDetailState();
}

class _SecondPageDetailState extends State<SecondPageDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)),
        ),
        backgroundColor: Colors.amber[100],
      ),
      backgroundColor: Colors.yellow[50],
      body: SafeArea(
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("secondpagedetail")
              .snapshots(),
          builder: (context, snapshot) {
            //print("deneme 1234 " + widget.index.toString());
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
                : Scaffold(
                    backgroundColor: Colors.yellow[50],
                    body: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    snapshot.data.docs[widget.index]["baslik"],
                                    style: TextStyle(
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                              child: Image.network(
                                snapshot.data.docs[widget.index]["foto"],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Text(
                                  snapshot.data.docs[widget.index]["tarih"],
                                  style: TextStyle(
                                    color: Color(0xFF325384).withOpacity(0.5),
                                    fontSize: 12.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              snapshot.data.docs[widget.index]["icerik"],
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
          },
        ),
      ),
    );
  }
}

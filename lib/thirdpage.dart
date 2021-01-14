import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection("Oyun").snapshots(),
              builder: (context, snapshot) {
                return !snapshot.hasData
                    ? SafeArea(
                        child: Scaffold(
                          backgroundColor: Colors.amber[50],
                          //loading page is here
                          body: Container(
                            child: LoadingFlipping.circle(
                              borderColor: Colors.brown,
                              borderSize: 3.0,
                              size: 75.0,
                              duration: Duration(milliseconds: 500),
                            ),
                          ),
                        ),
                      )
                    : Scaffold(
                        backgroundColor: Colors.yellow[50],
                        body: ListView.builder(
                          itemCount: snapshot.data.docs.length,
                          itemBuilder: (context, index) {
                            DocumentSnapshot products =
                                snapshot.data.docs[index];
                            return SafeArea(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white70,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        topRight: Radius.circular(5),
                                        bottomLeft: Radius.circular(5),
                                        bottomRight: Radius.circular(5)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black38.withOpacity(0.4),
                                        spreadRadius: 3,
                                        blurRadius: 10,
                                        offset: Offset(
                                            0, 8), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  margin: EdgeInsets.all(4.0),
                                  height: _size.height * 0.25,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: Center(
                                                    child: Text(
                                                      products["baslik"],
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 30,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Expanded(
                                              child: SingleChildScrollView(
                                                child: Text(
                                                  products["icerik"],
                                                  style: TextStyle(
                                                    fontSize:
                                                        _size.width * 0.05,
                                                    color: Colors.black87,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Text(
                                              products["tarih"],
                                              style: TextStyle(
                                                color: Color(0xFF325384)
                                                    .withOpacity(0.5),
                                                fontSize: 12.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(10),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10.0),
                                          ),
                                          child: Image.network(
                                            products["foto"],
                                            cacheWidth: 100,
                                            cacheHeight: 100,
                                            fit: BoxFit.scaleDown,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
              }),
        ),
      ),
    );
  }
}

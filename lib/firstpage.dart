import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:debug/detailPages/firstpagedetail.dart';
import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("firtspage").snapshots(),
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
              : SafeArea(
                  child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1),
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot products = snapshot.data.docs[index];
                      return Scaffold(
                        backgroundColor: Colors.yellow[50],
                        body: Center(
                          child: Column(
                            children: [
                              Expanded(
                                child: Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    color: Colors.white70,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  FirstPageDetail(
                                                      index: index)),
                                        );
                                      },
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Title(
                                                    color: Colors.white,
                                                    child: Expanded(
                                                      child: Center(
                                                        child: Text(
                                                          products['baslik'],
                                                          style: TextStyle(
                                                              fontSize: 35,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                    )),
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
                                                fit: BoxFit.fill,
                                                height: 120,
                                              ),
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(1.0),
                                                child: Text(
                                                  products["tarih"],
                                                  style: TextStyle(
                                                    color: Color(0xFF325384)
                                                        .withOpacity(0.5),
                                                    fontSize: 12.0,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(2.0),
                                              child: SingleChildScrollView(
                                                child: Text(
                                                  products['icerik'],
                                                  style:
                                                      TextStyle(fontSize: 25),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
        });
  }
}

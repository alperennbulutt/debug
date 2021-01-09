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
              ? Scaffold(
                  backgroundColor: Colors.amber,
                  //loading page is here
                  body: Container(
                    child: LoadingFlipping.circle(
                      borderColor: Colors.white,
                      borderSize: 3.0,
                      size: 75.0,
                      backgroundColor: Colors.orange,
                      duration: Duration(milliseconds: 500),
                    ),
                  ),
                )
              : GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1),
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot products = snapshot.data.docs[index];
                    {
                      return MaterialApp(
                        debugShowCheckedModeBanner:
                            false, //debug yazısını kaldırmak icin
                        home: Scaffold(
                          backgroundColor: Colors.amber,
                          body: SafeArea(
                            child: SingleChildScrollView(
                              child: Container(
                                child: Column(
                                  children: <Widget>[
                                    //1.kısım yatay kaydırılan
                                    Container(
                                      height: 300,
                                      child: ListView(
                                        scrollDirection: Axis.horizontal,
                                        children: <Widget>[
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        FirstPageDetail(
                                                            index: index)),
                                              );
                                            },
                                            child: Container(
                                              width: 300,
                                              child: Scaffold(
                                                appBar: AppBar(
                                                  title:
                                                      Text(products['baslik']),
                                                ),
                                                body: Column(
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(products['tarih']),
                                                      ],
                                                    ),
                                                    Image.network(
                                                        products['foto']),
                                                    Text(products['icerik']),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                  },
                );
        });
  }
}

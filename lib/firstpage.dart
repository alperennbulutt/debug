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
                      duration: Duration(milliseconds: 500),
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
                        body: Center(
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black38.withOpacity(0.3),
                                      spreadRadius: 3,
                                      blurRadius: 3,
                                      offset: Offset(
                                          0, 8), // changes position of shadow
                                    ),
                                  ],
                                ),
                                width: 390,
                                height: 385,
                                child: Card(
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                FirstPageDetail(index: index)),
                                      );
                                    },
                                    child: Column(
                                      children: [
                                        Title(
                                            color: Colors.white,
                                            child: Text(
                                              products['baslik'],
                                              style: TextStyle(
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                        Expanded(
                                            child: Image.network(
                                                products['foto'])),
                                        Expanded(
                                            child: Text(
                                          products['icerik'],
                                          style: TextStyle(fontSize: 20),
                                        )),
                                      ],
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

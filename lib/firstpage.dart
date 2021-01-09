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
                  scrollDirection: Axis.horizontal,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1),
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot products = snapshot.data.docs[index];
                    return Scaffold(
                      body: Column(
                        children: [
                          Container(
                            color: Colors.green,
                            width: 400,
                            height: 300,
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
                                        child: Image.network(products['foto'])),
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
                    );
                  },
                );
        });
  }
}

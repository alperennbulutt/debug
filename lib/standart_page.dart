import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';

import 'detailPages/secondpagedetail.dart';

class StandartPage extends StatelessWidget {
  const StandartPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection("secondpage").snapshots(),
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
            : ListView.builder(
                itemCount: snapshot.data.docs.length,
                scrollDirection: Axis.vertical,
                //shrinkWrap: true,

                //veritanabından ilk iki haber burada gösterilecek
                itemBuilder: (context, index) {
                  DocumentSnapshot products = snapshot.data.docs[index];

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                SecondPageDetail(index: index)),
                      );
                    },
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          color: Colors.brown[50],
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.all(5),
                                      child: Title(
                                        color: Colors.white,
                                        child: Center(
                                          child: Text(
                                            products['baslik'],
                                            style: TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.all(5),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.all(1),
                                    margin: const EdgeInsets.all(10),
                                    child: Image.network(
                                      products["foto"],
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      child: Text(
                                        products["tarih"],
                                        style: TextStyle(
                                          color: Color(0xFF325384)
                                              .withOpacity(0.5),
                                          fontSize: 12.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.all(5),
                                child: Text(
                                  products['icerik'],
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
      },
    );
  }
}

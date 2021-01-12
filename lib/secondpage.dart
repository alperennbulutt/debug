import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';

import 'detailPages/secondpagedetail.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection("secondpage").snapshots(),
      builder: (context, snapshot) {
        return !snapshot.hasData
            ? SafeArea(
                child: Scaffold(
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
                ),
              )
            : SafeArea(
                child: Scaffold(
                  backgroundColor: Colors.yellow[50],
                  body: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 200,
                            //dikey kayan kısım
                            child: SafeArea(
                              child: Expanded(
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount:
                                      4, //veritanabından ilk iki haber burada gösterilecek
                                  itemBuilder: (context, index) {
                                    DocumentSnapshot products =
                                        snapshot.data.docs[index];

                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SecondPageDetail(
                                                      index: index)),
                                        );
                                      },
                                      child: Container(
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          color: Colors.brown[50],
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                      padding:
                                                          EdgeInsets.all(5),
                                                      child: Title(
                                                        color: Colors.white,
                                                        child: Center(
                                                          child: Text(
                                                            products['baslik'],
                                                            style: TextStyle(
                                                                fontSize: 30,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
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
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(10.0),
                                                  ),
                                                  child: Container(
                                                    padding: EdgeInsets.all(1),
                                                    margin:
                                                        const EdgeInsets.all(
                                                            10),
                                                    child: Image.network(
                                                      products["foto"],
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                      child: Text(
                                                        products["tarih"],
                                                        style: TextStyle(
                                                          color: Color(
                                                                  0xFF325384)
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
                                                  style:
                                                      TextStyle(fontSize: 20),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                        //ikinci yatay kayan kısım
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            height: 300,
                            child: Expanded(
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount:
                                    5, //veritanabından yukarıda gösterilen 2 haberden sonra 3 haber de burada gösterilecek
                                itemBuilder: (context, index) {
                                  DocumentSnapshot products =
                                      snapshot.data.docs[index +
                                          4]; //yukarıda gösterilmiş iki haber atlandı

                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SecondPageDetail(
                                                    index: index + 4)),
                                      );
                                    },
                                    child: Container(
                                      margin: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        color: Colors.yellow[50],
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                            bottomLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(10)),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black38.withOpacity(0.5),
                                            spreadRadius: 3,
                                            blurRadius: 3,
                                            offset: Offset(0,
                                                8), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Container(
                                          width: 350,
                                          color: Colors.brown[50],
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                    child: Title(
                                                      color: Colors.black,
                                                      child: Center(
                                                        child: Text(
                                                          products["baslik"],
                                                          style: TextStyle(
                                                              fontSize: 25,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Container(
                                                  margin: EdgeInsets.all(5),
                                                  child: Image.network(
                                                    products['foto'],
                                                    fit: BoxFit.fill,
                                                    width: 300,
                                                    height: 70,
                                                  ),
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    products['tarih'],
                                                    style: TextStyle(
                                                      color: Color(0xFF325384)
                                                          .withOpacity(0.5),
                                                      fontSize: 12.0,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Expanded(
                                                child: SingleChildScrollView(
                                                  child: Text(
                                                    products["icerik"],
                                                    style:
                                                        TextStyle(fontSize: 20),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
      },
    );
  }
}

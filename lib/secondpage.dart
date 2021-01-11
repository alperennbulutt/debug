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
            : Scaffold(
                //yatay kısım
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 200,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount:
                                2, //veritanabından ilk iki haber burada gösterilecek
                            itemBuilder: (context, index) {
                              DocumentSnapshot products =
                                  snapshot.data.docs[index];

                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SecondPageDetail(index: index)),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: 100,
                                    color: Colors.green,
                                    child: Column(
                                      children: [
                                        Text(products['baslik']),
                                        Image.network(products['foto']),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      Container(
                        height: 300,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount:
                              3, //veritanabından yukarıda gösterilen 2 haberden sonra 3 haber de burada gösterilecek
                          itemBuilder: (context, index) {
                            DocumentSnapshot products = snapshot.data.docs[
                                index +
                                    2]; //yukarıda gösterilmiş iki haber atlandı

                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          SecondPageDetail(index: index + 2)),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 200,
                                  color: Colors.green,
                                  child: Column(
                                    children: [
                                      Text(products["baslik"]),
                                      Image.network(products['foto']),
                                      Text(products["icerik"]),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
      },
    );
  }
}

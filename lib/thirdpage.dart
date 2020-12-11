import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.amber,
      body: SafeArea(
        child: Container(
          child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection("Oyun").snapshots(),
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
                    : ListView.builder(
                        itemCount: snapshot.data.docs.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot products = snapshot.data.docs[index];
                          return SafeArea(
                            child: Container(
                              margin: EdgeInsets.all(3.0),
                              color: Colors.white,
                              height: _size.height * 0.2,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            products["baslik"],
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20.0,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                            products["icerik"],
                                            style: TextStyle(
                                              fontSize: _size.width * 0.03,
                                              color: Colors.black87,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          Wrap(
                                            crossAxisAlignment:
                                                WrapCrossAlignment.center,
                                            children: [
                                              Text(
                                                products["tarih"],
                                                style: TextStyle(
                                                  color: Color(0xFF325384)
                                                      .withOpacity(0.5),
                                                  fontSize: 12.0,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 16.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10.0),
                                      ),
                                      child: Image.network(
                                        products["foto"],
                                        width: 80,
                                        height: 90,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      );
              }),
        ),
      ),
    );
  }

  //firebase e ekleme fonksiyonu
  CollectionReference users =
      FirebaseFirestore.instance.collection('kullanici');
  void addUser() {
    users
        .add({
          'full_name': "sero", // John Doe
          'company': "sero", // Stokes and Sons
          'age': 42 // 42
        })
        .then((value) => print(
            "User Added")) //buradaki then eğerki add fonksiyonu başarılı olursa burası çalışacaktır
        .catchError((error) => print("Failed to add user: $error"));
  }
}

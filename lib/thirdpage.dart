import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:debug/firabeseconnet.dart';
import 'package:flutter/material.dart';

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
                    ? Text('PLease Wait')
                    : ListView.builder(
                        itemCount: snapshot.data.docs.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot products = snapshot.data.docs[index];
                          return Container(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: _size.height * 0.15,
                                      width: _size.width * 0.25,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            products["foto"],
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      color: Colors.grey,
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            top: _size.height * 0.0001,
                                            child: Container(
                                              child: Text(products["baslik"]),
                                            ),
                                          ),
                                          Container(
                                            child: Text(products["icerik"]),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: _size.height * 0.03,
                                ),
                              ],
                            ),
                          );
                        },
                      );
              }),
        ),
      ),
    );
  }

  //firebase e ekleme
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

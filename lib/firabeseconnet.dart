import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Future<void> initState() {
    final databaseReference = FirebaseDatabase.instance.reference();

    databaseReference.child("a").set({
      'Baslik': "deneme deneme deneme",
    });

    super.initState();
    asyncInitState();
  }

  void asyncInitState() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.amber,
            ),
            Text("data"),
          ],
        ),
      ),
    );
  }
}

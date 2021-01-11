//class kütüphanelerini import ettik
import 'package:debug/secondpage.dart';
import 'package:debug/thirdpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'firstpage.dart';
import 'secondpage.dart';
import 'thirdpage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return UygulamaSayfasi();
  }
}

class UygulamaSayfasi extends State<MyApp> {
  int _secilmisSayfa = 0;
  final _sayfaOptions = [
    //classlar burada çalıştırılır
    //uygulama fikri sonradan değiştiğindne class isimleri alakasız
    FirstPage(),
    SecondPage(),
    ThirdPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //debug yazısını kaldırmak için

      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber[200],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
          ),
          title: Center(
            child: Text(
              'DEBUG',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: _sayfaOptions[_secilmisSayfa],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _secilmisSayfa,
          onTap: (int index) {
            setState(() {
              _secilmisSayfa = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.red[900],
              ),
              // ignore: deprecated_member_use
              title: Text(
                'Ana Sayfa',
                style: TextStyle(color: Colors.red[900]),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.trending_up, color: Colors.brown[900]),
              // ignore: deprecated_member_use
              title: Text(
                'Popüler',
                style: TextStyle(color: Colors.brown[900]),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.public,
                color: Colors.deepPurple,
              ),
              // ignore: deprecated_member_use
              title: Text(
                'Sıradışı',
                style: TextStyle(color: Colors.deepPurple),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

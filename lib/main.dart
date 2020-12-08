//class kütüphanelerini import ettik
import 'package:debug/secondpage.dart';
import 'package:debug/thirdpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'firstpage.dart';
import 'secondpage.dart';
import 'thirdpage.dart';

void main() => runApp(MyApp());

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
      title: "TEKNOLOJI",
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: Scaffold(
        backgroundColor: Colors.amber,
        appBar: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(20)),
          ),
          title: Center(
            child: Image.asset(
              'assets/images/debugLogo.png',
              cacheHeight: 100,
              cacheWidth: 100,
              height: 100,
              width: 100,
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
                color: Colors.orange,
              ),
              // ignore: deprecated_member_use
              title: Text(
                'Haberler',
                style: TextStyle(color: Colors.orange),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.smartphone,
                color: Colors.lightBlue,
              ),
              // ignore: deprecated_member_use
              title: Text(
                'Donanım',
                style: TextStyle(color: Colors.lightBlue),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.videogame_asset,
                color: Colors.deepPurple,
              ),
              // ignore: deprecated_member_use
              title: Text(
                'Oyun',
                style: TextStyle(color: Colors.deepPurple),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pathfinder/screen/ilanlar.dart';
import 'package:pathfinder/screen/ilangir.dart';
import 'package:pathfinder/screen/map.dart';
import 'package:pathfinder/screen/profil.dart';
import 'package:pathfinder/screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Scout Fields',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const SplashScreen(),
    );
  }
}

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({Key? key}) : super(key: key);

  @override
  _AnaSayfaState createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  int currentIndex = 0;
  final screens = [
    const IlanlarSayfasi(),
    IlanGir(),
    const MapSample(),
    const ProfilSayfa(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      // ignore: prefer_const_literals_to_create_immutables
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.green,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        iconSize: 30,
        selectedFontSize: 20,
        unselectedFontSize: 12,
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.list), label: '''
Ilanlar'''),
          const BottomNavigationBarItem(icon: Icon(Icons.add), label: '''
Ilan Ekle'''),
          const BottomNavigationBarItem(icon: Icon(Icons.map), label: '''
Harita'''),
          const BottomNavigationBarItem(icon: Icon(Icons.person), label: """
Profil"""),
        ],
      ),
    );
  }
}

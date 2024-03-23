import 'package:ecomercev2/screens/explore.dart';
import 'package:ecomercev2/screens/homepage.dart';
import 'package:ecomercev2/screens/mail.dart';
import 'package:ecomercev2/screens/search.dart';
import 'package:ecomercev2/screens/settings.dart';
import 'package:ecomercev2/themes/themes.dart';
import 'package:ecomercev2/utils/constants.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppThem.apptheme,
        home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  List bottomNavPges = [
    HomePage(),
    SearchPage(),
    ExplorePages(),
    SettingsPage(),
    MailPage(),
  ];

  int _currentPage = 0;

  String getBottomnavbarValue(number){
    String value;
   Map map = {
      1: 'Search',
      2: 'Explore',
      3: 'Settings',
      4: 'Mails',
    };
    value = map[number] ?? 'Home';
    return value;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: (){},
            icon: Icon(Icons.menu, color:Colors.black54)),

        title: Text(getBottomnavbarValue(_currentPage),
          style: TextStyle(
            color: Colors.black54,
              fontSize: 16,
              fontWeight: FontWeight.bold),),

        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search, color: Colors.black54,)),
          IconButton(onPressed: (){}, icon: Icon(Icons.shopping_bag_outlined, color:  Colors.black54,))
        ],
      ),
      
      body: bottomNavPges[_currentPage],
      
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPage,
          items: [
            BottomNavigationBarItem(icon: IconButton(onPressed: (){
             setState(() {
               _currentPage = 0;
             });
            }, icon: Icon(Icons.home, color: primaryColor,)),label: 'Home'),
            BottomNavigationBarItem(icon: IconButton(onPressed: (){
              setState(() {
                _currentPage = 1;
              });
            }, icon: Icon(Icons.search, color: primaryColor,)), label: 'Search'),
            BottomNavigationBarItem(icon: IconButton(onPressed: (){
              setState(() {
                _currentPage = 2;
              });
            }, icon: Icon(Icons.explore, color: primaryColor,)), label: 'Explore'),
            BottomNavigationBarItem(icon: IconButton(onPressed: (){
              setState(() {
                _currentPage = 3;
              });
            }, icon: Icon(Icons.settings, color: primaryColor,)), label: 'Settings'),
            BottomNavigationBarItem(icon: IconButton(onPressed: (){
              setState(() {
                _currentPage = 4;
              });
            }, icon: Icon(Icons.mail, color: primaryColor,)), label: 'Mail'),
          ]),
    );
  }
}

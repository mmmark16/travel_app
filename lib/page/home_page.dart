import 'package:flutter/material.dart';
import 'package:travel_app/page/select_rooms_page.dart';
import 'package:travel_app/page/travel_cards_page.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    TravelsCardsPage(),
    SelectRoomPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(94, 132, 237,1),
     appBar: AppBar(
        backgroundColor: Color.fromRGBO(94, 132, 237,1),
        title: Text("Travel_app",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 32),),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromRGBO(244, 246, 251,1),
       selectedItemColor: Color.fromRGBO(94, 132, 237,1),
        currentIndex: _selectedIndex, //New
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon( Icons.travel_explore,color: Color.fromRGBO(94, 132, 237,1),),
            label: 'Travel',
          ),
          BottomNavigationBarItem(
            icon: Icon( Icons.meeting_room, color: Color.fromRGBO(94, 132, 237,1),),
            label: 'Rooms',
          ),
        ],
      ),
    );
  }
}
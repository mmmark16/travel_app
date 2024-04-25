import 'package:flutter/material.dart';
import 'package:travel_app/page/select_rooms_page.dart';
import 'package:travel_app/page/travel_cards_page.dart';

import '../widget/travel_card.dart';

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
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Travel_app"),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, //New
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon( Icons.travel_explore,),
            label: 'Travel',
          ),
          BottomNavigationBarItem(
            icon: Icon( Icons.meeting_room, ),
            label: 'Rooms',
          ),
        ],
      ),
    );
  }
}
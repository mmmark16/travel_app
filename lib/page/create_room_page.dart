import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travel_app/page/swipe_room_page.dart';
import '../global.dart';



class CreatePageRoom extends StatefulWidget {
  final String title;
  const CreatePageRoom({super.key, required this.title});


  @override
  State<CreatePageRoom> createState() => _CreatePageRoomState();
}

class _CreatePageRoomState extends State<CreatePageRoom> {

  int code = Random().nextInt(899999) + 100000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Создание комнаты"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 12.0, right: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 64.0),
              child: Text(
                setCountry.name,
                style: TextStyle(fontSize: 36),
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              "Код вашей комнаты:",
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            Text(
              code.toString(),
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            Text(
              "Сообщите его вашим друзьям, чтобы они смогли вступить в вашу комнату.",
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () async {
                  await Clipboard.setData(ClipboardData(text: code.toString()));
                },

                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple.shade200,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    "Скопировать",
                    style: TextStyle(fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () async {
                  for(int i = 0; i < setCountry.tours.length; i++){
                    for(int j = 0; j < tourList.length; j++){
                      if(setCountry.tours[i] == tourList[j].id){
                        setTourList.add(tourList[j]);
                      }
                    }
                  }
                  List<String> zero = [];
                  await FirebaseFirestore.instance.collection("room").doc(code.toString()).set({'id_country':'${setCountry.id}', 'answers':zero});
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SwipeRoomPage(roomCode: code,)),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple.shade200,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    "Создать комнату",
                    style: TextStyle(fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

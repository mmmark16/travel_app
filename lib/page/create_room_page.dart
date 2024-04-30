import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
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
      backgroundColor: Color.fromRGBO(
        94,
        132,
        237,
        1,
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
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(244, 246, 251, 1),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0, bottom: 36),
              child: Container(
                padding:
                    EdgeInsets.only(left: 12, right: 12, top: 24, bottom: 24),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(244, 246, 251, 1),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: const Offset(
                        5.0,
                        5.0,
                      ),
                      blurRadius: 10.0,
                      spreadRadius: 2.0,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      "Код вашей комнаты:",
                      style: TextStyle(fontSize: 24),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0, bottom: 12),
                      child: Text(
                        code.toString(),
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SvgPicture.asset(
                          'assets/image/Iconsmile.svg',
                          width: 24,
                          height: 24,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.3,
                          child: Text(
                            "Сообщите его вашим друзьям, чтобы они смогли вступить в вашу комнату.",
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () async {
                    await Clipboard.setData(
                        ClipboardData(text: code.toString()));
                  },
                  child: Container(
                    height: 86,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(58, 207, 233, 1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Скопировать",
                        style: TextStyle(
                          fontSize: 24,
                          color: Color.fromRGBO(244, 246, 251, 1),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    for (int i = 0; i < setCountry.tours.length; i++) {
                      for (int j = 0; j < tourList.length; j++) {
                        if (setCountry.tours[i] == tourList[j].id) {
                          setTourList.add(tourList[j]);
                        }
                      }
                    }
                    List<String> zero = [];
                    await FirebaseFirestore.instance
                        .collection("room")
                        .doc(code.toString())
                        .set({
                      'id_country': '${setCountry.id}',
                      'answers': zero
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SwipeRoomPage(
                                roomCode: code,
                              )),
                    );
                  },
                  child: Container(
                    height: 86,
                    width: MediaQuery.of(context).size.width / 2.5,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(58, 207, 233, 1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      "Создать комнату",
                      style: TextStyle(
                        fontSize: 24,
                        color: Color.fromRGBO(244, 246, 251, 1),
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

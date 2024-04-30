import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/global.dart';
import 'package:travel_app/model/country_model.dart';
import 'package:travel_app/model/room_model.dart';
import 'package:travel_app/page/home_page.dart';
import 'package:travel_app/page/swipe_room_page.dart';

class FinishPage extends StatefulWidget {
  final String code;

  const FinishPage({super.key, required this.code});

  @override
  State<FinishPage> createState() => _FinishPageState();
}

class _FinishPageState extends State<FinishPage> {
  RoomModel setRoom = new RoomModel(id: '', id_country: '', answers: []);
  CountryModel _setCountry =
      new CountryModel(id: '', name: '', photo: '', tours: []);
  List<String> allAnswers = [];
  List<dynamic> splitArray = [];
  List<String> resultAnswer = ['', '', '', ''];
  List<String> resultTitle = ['', '', '', ''];
  String countryName = '';

  returnAllAnswers() async {
    QuerySnapshot qSnap =
        await FirebaseFirestore.instance.collection('room').get();
    int roomLength = qSnap.docs.length;
    await FirebaseFirestore.instance.collection("room").get().then((snapshot) {
      for (int i = 0; i < roomLength; i++) {
        if (snapshot.docs[i].id == widget.code) {
          setRoom = RoomModel(
            id: snapshot.docs[i].id,
            id_country: snapshot.docs[i].get('id_country'),
            answers: snapshot.docs[i].get('answers'),
          );
        }
      }
    });
    for (int i = 0; i < setRoom.answers.length; i++) {
      allAnswers.add(setRoom.answers[i]);
    }
    print(allAnswers);
    for (int i = 0; i < allAnswers.length; i++) {
      splitArray.add(allAnswers[i].split(''));
    }
    print(splitArray);
    for (int i = 0; i < splitArray.length; i++) {
      if (i == 0) {
        resultAnswer = splitArray[i];
      } else {
        for (int j = 0; j < resultAnswer.length; j++) {
          if (resultAnswer[j] == splitArray[i][j] && splitArray[i][j] == '1') {
            resultAnswer[j] = '1';
          } else {
            resultAnswer[j] = '0';
          }
        }
      }
    }
    setState(() {});
    for (int i = 0; i < countryList.length; i++) {
      if (setRoom.id_country == countryList[i].id) {
        countryName = countryList[i].name;
        _setCountry = countryList[i];
      }
    }

    for (int i = 0; i < _setCountry.tours.length; i++) {
      for (int j = 0; j < tourList.length; j++) {
        if (_setCountry.tours[i] == tourList[j].id) {
          resultTitle[i] = tourList[j].name;
        }
      }
    }
    print("ИТОГ");
    print(resultAnswer);
    print(resultTitle);
    print(_setCountry.tours);

    allAnswers = [];
    splitArray = [];
  }

  Timer timer = Timer(Duration(seconds: 1), () {});

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      returnAllAnswers().then(() {
        setState(() {});
      });
    });
    timer = Timer.periodic(Duration(seconds: 5), (Timer t) async {
      returnAllAnswers();
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

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
        padding: const EdgeInsets.only(left: 24.0, right: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              countryName,
              style: TextStyle(
                fontSize: 52,
                color: Color.fromRGBO(244, 246, 251, 1),
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 24.0, top: 12),
              child: Container(
                  padding: EdgeInsets.all(24),
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
                        "Результаты ответов:",
                        style: TextStyle(fontSize: 24),
                      ),
                      Container(
                        child: ListView.separated(
                          shrinkWrap: true,
                          itemCount: resultTitle.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width/1.7,
                                  padding: EdgeInsets.only(top: 8, bottom: 8),
                                  child: Text(resultTitle[index], style: TextStyle(fontSize: 18),),
                                ),
                                Container(
                                  padding: EdgeInsets.all(8),
                                  child: Center(
                                      child: resultAnswer[index] == '1'
                                          ? Icon(
                                              Icons.check_circle,
                                              color: Color.fromRGBO(
                                                94,
                                                132,
                                                237,
                                                1,
                                              ),
                                              size: 32,
                                            )
                                          : Icon(
                                              Icons.cancel,
                                              color: Color.fromRGBO(
                                                94,
                                                132,
                                                237,
                                                1,
                                              ),
                                              size: 32,
                                            )),
                                )
                              ],
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) =>
                              const Divider(),
                        ),
                      ),
                    ],
                  )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      for (int i = 0; i < _setCountry.tours.length; i++) {
                        for (int j = 0; j < tourList.length; j++) {
                          if (_setCountry.tours[i] == tourList[j].id) {
                            setTourList.add(tourList[j]);
                          }
                        }
                      }
                      int _code = int.parse(widget.code);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                SwipeRoomPage(roomCode: _code)),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(58, 207, 233, 1),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        "Добавить ответ",
                        style: TextStyle(fontSize: 24, color: Color.fromRGBO(244, 246, 251, 1),fontWeight: FontWeight.bold,),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => MyHomePage()),
                        (route) => false,
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(58, 207, 233, 1),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        "Выйти",
                        style: TextStyle(fontSize: 24, color: Color.fromRGBO(244, 246, 251, 1),fontWeight: FontWeight.bold,),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/model/room_model.dart';

class FinishPage extends StatefulWidget {
  final String code;
  final List<bool> answer;
  final List<String> titles;

  const FinishPage(
      {super.key,
      required this.answer,
      required this.titles,
      required this.code});

  @override
  State<FinishPage> createState() => _FinishPageState();
}

class _FinishPageState extends State<FinishPage> {
  RoomModel setRoom = new RoomModel(id: '', id_country: '', answers: []);
  List<String> allAnswers = [];
  List<dynamic> splitArray = [];
  List<String> resultAnswer = [];

  void returnAllAnswers() async {
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
    for(int i = 0; i < splitArray.length; i++){
      if(i == 0){
        resultAnswer = splitArray[i];
      } else {
        for(int j = 0; j < resultAnswer.length; j++){
          if(resultAnswer[j] == splitArray[i][j] && splitArray[i][j] == '1'){
            resultAnswer[j] = '1';
          } else {
            resultAnswer[j] = '0';
          }
        }
      }
    }
    print('ИТОГ');
    print(resultAnswer);
  }

  @override
  void initState() {
    returnAllAnswers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Итоги"),
      ),
      body: Column(
        children: [
          Text("Ваши ответы:"),
          Container(
            child: Row(
              children: [
                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: widget.titles.length,
                        itemBuilder:
                            (BuildContext context, int index) {
                          return Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.all(8),
                                child: Text(widget.titles[index]),
                                width: MediaQuery.of(context)
                                    .size
                                    .width /
                                    2,
                              ),
                              Container(
                                padding: EdgeInsets.all(8),
                                child: Center(
                                  child: Text(
                                      resultAnswer[index] == '1'
                                          ? "Понравилось"
                                          : "Не понравилось"),
                                ),
                                width: MediaQuery.of(context)
                                    .size
                                    .width /
                                    2,
                              )
                            ],
                          );
                        },
                      ),
/*                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: widget.titles.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.all(8),
                                child: Text(widget.titles[index]),
                                width: MediaQuery.of(context).size.width / 2,
                              ),
                              Container(
                                padding: EdgeInsets.all(8),
                                child: Center(
                                  child: Text(widget.answer[index] == true
                                      ? "Понравилось"
                                      : "Не понравилось"),
                                ),
                                width: MediaQuery.of(context).size.width / 2,
                              )
                            ],
                          );
                        },
                      ),*/
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}




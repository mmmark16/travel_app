import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:travel_app/page/finish_page.dart';

import '../global.dart';
import '../model/room_model.dart';

class SelectRoomPage extends StatefulWidget {
  const SelectRoomPage({super.key});

  @override
  State<SelectRoomPage> createState() => _SelectRoomPagePageState();
}

TextEditingController _controller = new TextEditingController();

class _SelectRoomPagePageState extends State<SelectRoomPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(left: 12, right: 12, top: 24, bottom: 24),
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
                  "Введите код комнаты, в которую хотите присоедениться.",
                  style: TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0, bottom: 12),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: TextField(
                      controller: _controller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "000000",
                        hintStyle: TextStyle(
                          fontSize: 24,
                        ),
                        filled: true,
                        fillColor: Colors.blueAccent,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(2)),
                      ),
                    ),
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
                        "Его вы можете узнать у создателя комнаты.",
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24),
            child: GestureDetector(
              onTap: () async {
                QuerySnapshot qSnapRoom =
                    await FirebaseFirestore.instance.collection('room').get();
                int roomLength = qSnapRoom.docs.length;
                await FirebaseFirestore.instance
                    .collection("room")
                    .get()
                    .then((snapshot) {
                  for (int i = 0; i < roomLength; i++) {
                    RoomModel _timeRoom = new RoomModel(
                      id: '',
                      id_country: '',
                      answers: [],
                    );
                    _timeRoom = RoomModel(
                      id: snapshot.docs[i].id,
                      id_country: snapshot.docs[i].get('id_country'),
                      answers: snapshot.docs[i].get('answers'),
                    );
                    roomList.add(_timeRoom);
                  }
                });
                for (int i = 0; i < roomList.length; i++) {
                  if (_controller.text != roomList[i].id) {
                    if (i == roomList.length - 1) {
                      Fluttertoast.showToast(
                          msg: "Неверный код!",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              FinishPage(code: _controller.text)),
                    );
                    break;
                  }
                }
              },
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(58, 207, 233, 1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  "Войти в комнату",
                  style: TextStyle(
                    fontSize: 24,
                    color: Color.fromRGBO(244, 246, 251, 1),
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

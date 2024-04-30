import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
          Text(
            "Введите код комнаты, в которую хотите присоедениться.\nЕго вы можете узнать у создателя комнаты.",
            style: TextStyle(fontSize: 24),
            textAlign: TextAlign.center,
          ),
          Container(
            width: MediaQuery.of(context).size.width / 2,
            child: TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "000000",
                hintStyle: TextStyle(fontSize: 24,),
                filled: true,
                fillColor: Colors.blueAccent,
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(2)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
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
                for(int i = 0; i < roomList.length; i++){
                  if(_controller.text != roomList[i].id){
                    if(i == roomList.length-1){
                      Fluttertoast.showToast(
                          msg: "Неверный код!",    toastLength:
                      Toast.LENGTH_SHORT,    gravity:
                      ToastGravity.CENTER,    timeInSecForIosWeb: 1,    backgroundColor:
                      Colors.red,    textColor: Colors.white,    fontSize: 16.0);
                    }

                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FinishPage(code: _controller.text)),
                    );
                    break;
                  }
                }

              },
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade200,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  "Войти в комнату",
                  style: TextStyle(fontSize: 24),
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

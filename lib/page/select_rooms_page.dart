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
TextEditingController _pass1 = TextEditingController();
TextEditingController _pass2 = TextEditingController();
TextEditingController _pass3 = TextEditingController();
TextEditingController _pass4 = TextEditingController();
TextEditingController _pass5 = TextEditingController();
TextEditingController _pass6 = TextEditingController();

FocusNode _focus1 = FocusNode();
FocusNode _focus2 = FocusNode();
FocusNode _focus3 = FocusNode();
FocusNode _focus4 = FocusNode();
FocusNode _focus5 = FocusNode();
FocusNode _focus6 = FocusNode();
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
          /*      Padding(
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
                ),*/

                Container(
                  margin: EdgeInsets.only(top:24,bottom: 24),
                  // width: MediaQuery.of(context).size.width-30,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          // height: 66,
                          width: (MediaQuery.of(context).size.width-30)/7,

                          padding: EdgeInsets.only(left: 8,right: 8),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(94, 132, 237,1),
                            borderRadius: BorderRadius.all(Radius.circular(10)),

                          ),
                          child: Center(child:TextField(
                            onChanged: (_pass1){
                              _pass1.length==1 ?
                              FocusScope.of(context).requestFocus(_focus2):FocusScope.of(context).requestFocus(_focus1);},
                            maxLength: 1,
                            focusNode: _focus1,
                            controller:  _pass1,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 30,color: Colors.white),

                            decoration: InputDecoration(
                              counterText: '',
                              hintText: "",
                              border: InputBorder.none,
                            ),
                            maxLines: 1,
                          )),
                        ),
                        Container(
                          //  height: 66,
                          width: (MediaQuery.of(context).size.width-30)/7,

                          padding: EdgeInsets.only(left: 8,right: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color.fromRGBO(94, 132, 237,1),
                          ),
                          child: Center(child:TextField(
                            onChanged: (_pass2){
                              _pass2.length==1 ?
                              FocusScope.of(context).requestFocus(_focus3):FocusScope.of(context).requestFocus(_focus1);},
                            maxLength: 1,
                            focusNode: _focus2,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 30,color: Colors.white),
                            controller: _pass2,
                            decoration: InputDecoration(
                              counterText: '',
                              hintText: "",
                              border: InputBorder.none,
                            ),
                            maxLines: 1,
                          )),
                        ),
                        Container(
                          // height: 66,
                          width: (MediaQuery.of(context).size.width-30)/7,

                          padding: EdgeInsets.only(left: 8,right: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color.fromRGBO(94, 132, 237,1),
                          ),
                          child: Center(child:TextField(
                            onChanged: (_pass3){
                              _pass3.length==1 ?
                              FocusScope.of(context).requestFocus(_focus4):FocusScope.of(context).requestFocus(_focus2);},
                            maxLength: 1,
                            focusNode: _focus3,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 30,color: Colors.white),
                            controller: _pass3,
                            decoration: InputDecoration(
                              hintText: "",
                              counterText: '',
                              border: InputBorder.none,
                            ),
                            maxLines: 1,
                          )),
                        ),
                        Container(
                          //  height: 66,
                          width: (MediaQuery.of(context).size.width-30)/7,

                          padding: EdgeInsets.only(left: 8,right: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color.fromRGBO(94, 132, 237,1),
                          ),
                          child: Center(child:TextField(
                            onChanged: (_pass4){
                              _pass4.length==1 ?
                              FocusScope.of(context).requestFocus(_focus5):FocusScope.of(context).requestFocus(_focus3);},
                            maxLength: 1,
                            focusNode: _focus4,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 30,color: Colors.white),
                            controller: _pass4,
                            decoration: InputDecoration(
                              counterText: '',
                              hintText: "",
                              border: InputBorder.none,
                            ),
                            maxLines: 1,
                          )),
                        ),
                        Container(
                          //  height: 66,
                          width: (MediaQuery.of(context).size.width-30)/7,

                          padding: EdgeInsets.only(left: 8,right: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color.fromRGBO(94, 132, 237,1),
                          ),
                          child: Center(child:TextField(
                            onChanged: (_pass5){
                              _pass5.length==1 ?
                              FocusScope.of(context).requestFocus(_focus6):FocusScope.of(context).requestFocus(_focus4);},
                            maxLength: 1,
                            focusNode: _focus5,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 30,color: Colors.white),
                            controller: _pass5,
                            decoration: InputDecoration(
                              counterText: '',
                              hintText: "",
                              border: InputBorder.none,
                            ),
                            maxLines: 1,
                          )),
                        ),
                        Container(
                          //  height: 66,
                          width: (MediaQuery.of(context).size.width-30)/7,

                          padding: EdgeInsets.only(left: 8,right: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color.fromRGBO(94, 132, 237,1),
                          ),
                          child: Center(child:TextField(
                            onChanged: (_pass6){
                              _pass6.length==1 ?
                              FocusScope.of(context).requestFocus(_focus6):FocusScope.of(context).requestFocus(_focus5);},
                            maxLength: 1,
                            focusNode: _focus6,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 30,color: Colors.white),
                            controller: _pass6,
                            decoration: InputDecoration(
                              counterText: '',
                              hintText: "",
                              border: InputBorder.none,
                            ),
                            maxLines: 1,
                          )),
                        )
                      ],
                    )),


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
                String _codeRoom = '';
                _codeRoom = _pass1.text + _pass2.text + _pass3.text + _pass4.text + _pass5.text + _pass6.text ;
                for (int i = 0; i < roomList.length; i++) {
                  if (_codeRoom != roomList[i].id) {
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
                    _pass1.clear();
                    _pass2.clear();
                    _pass3.clear();
                    _pass4.clear();
                    _pass5.clear();
                    _pass6.clear();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              FinishPage(code:_codeRoom)),
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

import 'package:flutter/material.dart';
import 'package:travel_app/page/finish_page.dart';

class SelectRoomPage extends StatefulWidget {
  const SelectRoomPage({super.key});

  @override
  State<SelectRoomPage> createState() => _SelectRoomPagePageState();
}

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
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FinishPage(answer: [true, false, true], titles: ['','',''], code: '263485')),
                );
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

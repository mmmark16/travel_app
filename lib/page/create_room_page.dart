import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travel_app/page/room_page.dart';

class CreatePageRoom extends StatefulWidget {
  const CreatePageRoom({super.key});

  @override
  State<CreatePageRoom> createState() => _CreatePageRoomState();
}

class _CreatePageRoomState extends State<CreatePageRoom> {
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
                "Тур по Японии",
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
              "202020",
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
                  await Clipboard.setData(ClipboardData(text: "202020"));
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RoomPage()),
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

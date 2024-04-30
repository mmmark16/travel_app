import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:travel_app/model/room_model.dart';
import 'package:travel_app/page/finish_page.dart';
import '../global.dart';
import '../widget/tour_card.dart';

class SwipeRoomPage extends StatefulWidget {
  final int roomCode;

  const SwipeRoomPage({super.key, required this.roomCode});

  @override
  State<SwipeRoomPage> createState() => _SwipeRoomPageState();
}

class _SwipeRoomPageState extends State<SwipeRoomPage> {
  final CardSwiperController controller = CardSwiperController();
  final cards = setTourList.map(TourCard.new).toList();

  List<dynamic> answer = [];
  List<dynamic> allAnswer = [];
  List<String> titles = [];

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
    clearSetTourList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(94, 132, 237,1),

      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              child: CardSwiper(
                controller: controller,
                cardsCount: setTourList.length,
                isLoop: false,
                onSwipe: _onSwipe,
                numberOfCardsDisplayed: 3,
                backCardOffset: const Offset(40, 40),
                padding: const EdgeInsets.all(24.0),
                cardBuilder: (
                  context,
                  index,
                  horizontalThresholdPercentage,
                  verticalThresholdPercentage,
                ) =>
                    cards[index],
                onEnd: _onEnd,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(

                    onPressed: () => controller.swipe(CardSwiperDirection.left),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16.0, bottom: 16),
                      child: Icon(
                        Icons.check,
                        color: Colors.green,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () =>
                        controller.swipe(CardSwiperDirection.right),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16.0, bottom: 16),
                      child: Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _onSwipe(
    int previousIndex,
    int? currentIndex,
    CardSwiperDirection direction,
  ) {
    if (direction == CardSwiperDirection.top ||
        direction == CardSwiperDirection.bottom) {
      return false;
    } else if (direction == CardSwiperDirection.left) {
      answer.add('1');
    } else if (direction == CardSwiperDirection.right) {
      answer.add('0');
    }
    return true;
  }


  _onEnd() async {
    for (int i = 0; i < setTourList.length; i++) {
      titles.add(setTourList[i].name);
    }
    for (int i = 0; i < roomList.length; i++) {
      if (widget.roomCode.toString() == roomList[i].id) {
        allAnswer = roomList[i].answers;
      }
    }
    allAnswer.add(answer.join());
    print("проверка");
    print(allAnswer);
    await FirebaseFirestore.instance.collection("room").doc(widget.roomCode.toString()).set({'id_country':'${setCountry.id}', 'answers':allAnswer});
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => FinishPage(
                code: widget.roomCode.toString(),
              )),
    );
    print(answer);
    print(titles);
    clearSetTourList();
  }
}

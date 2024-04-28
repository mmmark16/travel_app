import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:travel_app/page/finish_page.dart';
import '../global.dart';
import '../widget/tour_card.dart';

class SwipeRoomPage extends StatefulWidget {
  const SwipeRoomPage({
    super.key,
  });

  @override
  State<SwipeRoomPage> createState() => _SwipeRoomPageState();
}

class _SwipeRoomPageState extends State<SwipeRoomPage> {
  final CardSwiperController controller = CardSwiperController();
  final cards = setTourList.map(TourCard.new).toList();

  List<bool> answer = [];
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
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Ваша комната"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              child: CardSwiper(
                controller: controller,
                cardsCount: setTourList.length,
                isLoop: false,
                onSwipe: _onSwipe,
                onUndo: _onUndo,
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
                    style: ButtonStyle(),
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
                  ElevatedButton(
                    onPressed: controller.undo,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16.0, bottom: 16),
                      child: Icon(Icons.rotate_left),
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
      answer.add(true);
    } else if (direction == CardSwiperDirection.right) {
      answer.add(false);
    }
    return true;
  }

  bool _onUndo(
    int? previousIndex,
    int currentIndex,
    CardSwiperDirection direction,
  ) {
    debugPrint(
      'The card $currentIndex was undod from the ${direction.name}',
    );
    return true;
  }

  _onEnd() {
    for (int i = 0; i < setTourList.length; i++) {
      titles.add(setTourList[i].name);
    }
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => FinishPage(answer: answer, titles: titles, code: '000000',)),
    );
    print(answer);
    print(titles);
  }
}

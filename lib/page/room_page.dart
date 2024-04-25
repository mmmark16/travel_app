import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:travel_app/page/finish_page.dart';
import '../model/card_model.dart';
import '../widget/tour_card.dart';

class RoomPage extends StatefulWidget {
  const RoomPage({
    super.key,
  });

  @override
  State<RoomPage> createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {

  final CardSwiperController controller = CardSwiperController();
  final cards = candidates.map(TourCard.new).toList();

  List<bool> answer = [];
  List<String> titles = [];

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
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
                cardsCount: cards.length,
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
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    onPressed: () => controller.swipe(CardSwiperDirection.left),
                    child: const Icon(
                      Icons.check,
                      color: Colors.green,
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: () =>
                        controller.swipe(CardSwiperDirection.right),
                    child: const Icon(
                      Icons.close,
                      color: Colors.red,
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: controller.undo,
                    child: const Icon(Icons.rotate_left),
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
    } else if(direction == CardSwiperDirection.left) {
      answer.add(true);
    } else  if(direction == CardSwiperDirection.right) {
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
    for(int i = 0; i <= cards.length-1; i++){
      titles.add(candidates[i].name);
      print("проверка названия");
    }
    print(titles);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FinishPage(answer: answer, titles: titles)),
    );
    print(answer);
  }
}

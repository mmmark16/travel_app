import 'package:flutter/material.dart';
import '../widget/travel_card.dart';

class TravelsCardsPage extends StatefulWidget {
  const TravelsCardsPage({super.key});

  @override
  State<TravelsCardsPage> createState() => _TravelsCardsPageState();
}

class _TravelsCardsPageState extends State<TravelsCardsPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(8),
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return TravelCard();
      },
    );
  }
}

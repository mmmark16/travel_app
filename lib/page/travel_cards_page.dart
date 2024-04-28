import 'package:flutter/material.dart';
import '../global.dart';
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
      itemCount: countryList.length,
      itemBuilder: (BuildContext context, int index) {
        return TravelCard(
          id: countryList[index].id,
          title: countryList[index].name,
          photo: countryList[index].photo,
          tours: countryList[index].tours,
        );
      },
    );
  }
}

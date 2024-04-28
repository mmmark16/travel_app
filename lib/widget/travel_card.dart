import 'package:flutter/material.dart';
import '../global.dart';
import '../model/country_model.dart';
import '../page/create_room_page.dart';

class TravelCard extends StatelessWidget {
  final String id;
  final String title;
  final String photo;
  final List<dynamic> tours;

  const TravelCard({
    super.key,
    required this.id,
    required this.title,
    required this.photo,
    required this.tours,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: GestureDetector(
        onTap: () {
          setCountry = CountryModel(
            id: id,
            name: title,
            photo: photo,
            tours: tours,
          );
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CreatePageRoom(
                      title: title,
                    )),
          );
        },
        child: Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.deepPurple.shade200,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Container(
                  height: 160,
                  child: Image.network(photo),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  title,
                  style: TextStyle(fontSize: 24),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

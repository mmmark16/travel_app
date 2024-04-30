import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/page/home_page.dart';
import 'global.dart';
import 'model/country_model.dart';
import 'model/room_model.dart';
import 'model/tour_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  QuerySnapshot qSnap =
      await FirebaseFirestore.instance.collection('country').get();
  int countryLength = qSnap.docs.length;
  await FirebaseFirestore.instance.collection("country").get().then((snapshot) {
    for (int i = 0; i < countryLength; i++) {
      CountryModel _timeCountry = new CountryModel(
        id: '',
        name: '',
        photo: '',
        tours: [],
      );
      _timeCountry = CountryModel(
        id: snapshot.docs[i].id,
        name: snapshot.docs[i].get('name'),
        photo: snapshot.docs[i].get('photo'),
        tours: snapshot.docs[i].get('tours'),
      );
      countryList.add(_timeCountry);
    }
  });
  QuerySnapshot qSnapTour =
      await FirebaseFirestore.instance.collection('tours').get();
  int tourLength = qSnapTour.docs.length;
  await FirebaseFirestore.instance.collection("tours").get().then((snapshot) {
    for (int i = 0; i < tourLength; i++) {
      TourModel _timeTour = new TourModel(
        id: '',
        name: '',
        night: '',
        cities: '',
        food: '',
        excursions: '',
        photo_path: '',
        cost: '',
      );
      _timeTour = TourModel(
        id: snapshot.docs[i].id,
        name: snapshot.docs[i].get('name'),
        night: snapshot.docs[i].get('night'),
        cities: snapshot.docs[i].get('cities'),
        food: snapshot.docs[i].get('food'),
        excursions: snapshot.docs[i].get('trip'),
        photo_path: snapshot.docs[i].get('photo'),
        cost: snapshot.docs[i].get('cost'),
      );
      tourList.add(_timeTour);
    }
  });
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
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
          fontFamily: 'Gilroy'
      ),
      home: const MyHomePage(),
    );
  }
}

import 'package:flutter/material.dart';

class CardModel {
  final String name;
  final String night;
  final String citys;
  final String food;
  final String excursions;
  final String photo_path;
  final String cost;

  CardModel({
    required this.name,
    required this.night,
    required this.citys,
    required this.food,
    required this.excursions,
    required this.photo_path,
    required this.cost,
  });
}

final List<CardModel> candidates = [
  CardModel(
      name: 'ОСЕННИЙ ТУР «ЧЕТЫРЕ СТОЛИЦЫ + ГОРА ФУДЗИ» 2024',
      night: '9 дней (8 ночей)',
      citys: 'Токио — Камакура — Эносима — Хаконе — Киото — Нара — Фудзи',
      food: '8 завтраков, 1 ужин',
      excursions: '6 экскурсий с русским гидом',
      photo_path: "assets/japan_tour.jpg",
      cost: "200 000 p"),
  CardModel(
      name: 'ОСЕННИЙ ТУР «ЧЕТЫРЕ СТОЛИЦЫ + ГОРА ФУДЗИ» 2024',
      night: '9 дней (8 ночей)',
      citys: 'Токио — Камакура — Эносима — Хаконе — Киото — Нара — Фудзи',
      food: '8 завтраков, 1 ужин',
      excursions: '6 экскурсий с русским гидом',
      photo_path: "assets/japan_tour.jpg",
      cost: "210 000 p"),
  CardModel(
      name: 'ОСЕННИЙ ТУР «ЧЕТЫРЕ СТОЛИЦЫ + ГОРА ФУДЗИ» 2024',
      night: '9 дней (8 ночей)',
      citys: 'Токио — Камакура — Эносима — Хаконе — Киото — Нара — Фудзи',
      food: '8 завтраков, 1 ужин',
      excursions: '6 экскурсий с русским гидом',
      photo_path: "assets/japan_tour.jpg",
      cost: "220 000 p"),
  CardModel(
      name: 'ОСЕННИЙ ТУР «ЧЕТЫРЕ СТОЛИЦЫ + ГОРА ФУДЗИ» 2024',
      night: '9 дней (8 ночей)',
      citys: 'Токио — Камакура — Эносима — Хаконе — Киото — Нара — Фудзи',
      food: '8 завтраков, 1 ужин',
      excursions: '6 экскурсий с русским гидом',
      photo_path: "assets/japan_tour.jpg",
      cost: "230 000 p"),
];

import 'package:flutter/material.dart';

import '../model/tour_model.dart';

class TourCard extends StatelessWidget {
  final TourModel setTour;

  const TourCard(
    this.setTour, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
         AspectRatio(aspectRatio: 500 / 451,
         child: Container(
            decoration: BoxDecoration(
                image: new DecorationImage(
                  fit: BoxFit.cover,
                  alignment: FractionalOffset.topCenter,
                  image: new NetworkImage(setTour.photo_path),
                )
            ),


          )),
          Container(
            height: MediaQuery.of(context).size.height/2.5,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    setTour.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                  ),
                 // SizedBox(height: 8,),
                  Row(
                    children: [
                      Icon(Icons.place, color: Colors.grey,),
                      Container(
                        width: MediaQuery.of(context).size.width/1.5,
                        child: Text(
                          setTour.cities,
                          overflow: TextOverflow.clip,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    setTour.night,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    ),
                  ),

                  Text(
                    setTour.food,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    setTour.excursions,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    ),
                  ),
                //  SizedBox(height: 12,),
                Align(
                    alignment: Alignment.centerRight,
                    child:  Padding(
                    padding: const EdgeInsets.only(top: 24.0,),
                    child: Text(
                      setTour.cost,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

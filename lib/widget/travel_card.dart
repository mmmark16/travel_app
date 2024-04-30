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
          width: MediaQuery.of(context).size.width-24,

          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: const Offset(
                  5.0,
                  5.0,
                ),
                blurRadius: 10.0,
                spreadRadius: 2.0,
              ),
            ],
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: [

              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.network(
                  photo,
                  height: 150.0,


                ),
              ),
             Container(
               height: 150,
                 decoration: BoxDecoration(

                   gradient: LinearGradient(
                       colors: [
                          Colors.transparent,
                         Color.fromRGBO(244, 246, 251,0.4),
                         Color.fromRGBO(244, 246, 251,0.9),
                         Color.fromRGBO(244, 246, 251,1),
                       ],
                       begin:  FractionalOffset(0.0, 0.0),
                       end:  FractionalOffset(1.0, 0.0),
                       stops: [0.0,0.3,0.6,0.8],
                       tileMode: TileMode.clamp),
                   borderRadius: BorderRadius.circular(20),
                 ),
                 width: MediaQuery.of(context).size.width,
                 child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  margin: EdgeInsets.only(right: 24),
                    width: 150,
                    child:Text(

                  title,
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 24, color: Color.fromRGBO(94, 132, 237,1),fontWeight: FontWeight.bold),
                )),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

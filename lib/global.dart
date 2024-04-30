import 'package:travel_app/model/room_model.dart';

import 'model/tour_model.dart';
import 'model/country_model.dart';

CountryModel setCountry = new CountryModel(id: '', name: '', photo: '', tours: [], );
List<CountryModel> countryList = [];
List<TourModel> tourList = [];
List<RoomModel> roomList = [];
List<TourModel> setTourList = [];
void clearSetTourList(){
  setTourList.clear();
}

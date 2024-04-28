import 'model/tour_model.dart';
import 'model/country_model.dart';

CountryModel setCountry = new CountryModel(id: '', name: '', photo: '', tours: [], );
List<CountryModel> countryList = [];
List<TourModel> tourList = [];
List<TourModel> setTourList = [];
void clearSetTourList(){
  setTourList.clear();
}

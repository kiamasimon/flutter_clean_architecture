import 'package:hive/hive.dart';
import 'package:travel_app/features/trip/data/models/trip_model.dart';

// Fetch data from e.g local data source or API
class TripLocalDataSource{
  final Box<TripModel> tripBox;

  TripLocalDataSource(this.tripBox);
  List<TripModel> getTrips(){
    return tripBox.values.toList();
  }

  addTrip(TripModel trip) {
    tripBox.add(trip);
  }

  deleteTrip(int index){
    tripBox.delete(index);
  }
}
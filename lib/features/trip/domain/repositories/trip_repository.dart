import 'package:dartz/dartz.dart';
import 'package:travel_app/core/error/failures.dart';
import 'package:travel_app/features/trip/domain/entities/trip.dart';

abstract class TripRepository{
  Future<Either<Failure, List<Trip>>> getTrips();
  Future<void> addTrips(Trip trip);
  Future<void> deleteTrip(int index);
}
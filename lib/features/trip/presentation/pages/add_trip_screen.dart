import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/features/trip/domain/entities/trip.dart';
import 'package:travel_app/features/trip/presentation/providers/trip_provider.dart';


class AddTripScreen extends ConsumerWidget{
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController(text: "City 1");
  final _descController = TextEditingController(text: "Description 1");
  final _locationController = TextEditingController(text: "Location 1");
  final _pictureController = TextEditingController(text: "https://docs.hivedb.dev/assets/logo.svg");
  List<String> pictures = [];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _titleController,
            decoration: InputDecoration(labelText: 'Title'),
          ),
          TextFormField(
            controller: _descController,
            decoration: InputDecoration(labelText: 'Description'),
          ),
          TextFormField(
            controller: _locationController,
            decoration: InputDecoration(labelText: 'Location'),
          ),
          TextFormField(
            controller: _pictureController,
            decoration: InputDecoration(labelText: 'Photo'),
          ),
          ElevatedButton(
              onPressed: (){
                pictures.add(_pictureController.text);
                if(_formKey.currentState!.validate()){
                  final newTrip = Trip(
                    title: _titleController.text,
                    description: _descController.text,
                    date: DateTime.now(),
                    location: _locationController.text,
                    photos: pictures
                  );
                  ref.read(tripListNotifierProvider.notifier).addNewTrip(newTrip);
                  ref.read(tripListNotifierProvider.notifier).loadTrips();
                }
              },
              child: Text("Add trip")
          )
        ],
      )
    );
  }
}
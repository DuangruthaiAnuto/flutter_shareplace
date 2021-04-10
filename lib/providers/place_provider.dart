import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

import '../models/place.dart';

class PlaceProvider {
  Future<List<Place>> getPlaces() async {
    List<Place> _places = [];

    //Add Code
    await Firebase.initializeApp();
    await FirebaseFirestore.instance
        .collection("places")
        .get()
        .then((lstPlace) {
      lstPlace.docs.forEach((plc) {
        var data = plc.data();
        String placeId = plc.id;
        GeoPoint geoLocation = data['location'];
        _places.add(Place(placeId, plc['title'], plc['description'],
            plc['imageUrl'], geoLocation.latitude, geoLocation.longitude));
      });
    });

    return _places;
  }

  Future<Place> findByPlaceId(String placeId) async {
    List<Place> _places = await getPlaces();
    return _places.firstWhere((plc) => plc.placeId == placeId);
  }

  Future<String> addImageToFireStorage(
      BuildContext context, File _imageFile) async {
    String imagUrl = "";

    //Add Code

    return imagUrl;
  }

  Future<String> addPlaces(String title, String description, String imagUrl,
      double lat, double lng) async {
    String placeId = "";

    //Add Code

    return placeId;
  }

  Future removePlaces(String _placeId) async {
    //Add Code
  }
}

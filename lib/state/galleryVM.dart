import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rover_watch/data/models/roverPhotos.dart';

class GalleryVM extends ChangeNotifier {
  GalleryVM() {
    _selectedRoverIndex = 0;
    camOptions = curiosityCameras;
  }

  final List<String> curiosityCameras = [
    "all",
    "fhaz",
    "rhaz",
    "mast",
    "chemcam",
    "mahli",
    "mardi",
    "navcam"
  ];
  final List<String> opportunitySpiritCameras = [
    "all",
    "fhaz",
    "rhaz",
    "navcam",
    "pancam",
    "minites"
  ];

  final List<String> roverNames = ["curiosity", "opportunity", "spirit"];
  int _selectedRoverIndex;
  List<String> _camOptions;
  String selectedCam; //null ise seçilmemiş :)

  List<String> get camOptions => _camOptions;

  final String endPoint = "https://api.nasa.gov/mars-photos/api/v1/rovers/";
  String selectedRoverAPIName = "curiosity";
  final String fixQuery =
      "/photos?api_key=34GEounDGYVWATdri13FpLtCifWfylswMEWoFYI6&page=1";
  String _selectedCamAPIName = "all";
  int _solParameter = 999;

  int get solParameter => _solParameter;

  set solParameter(int value) {
    _solParameter = value;
    notifyListeners();
  }

  set camOptions(List<String> value) {
    _camOptions = value;
    notifyListeners();
  }

  int get selectedRoverIndex => _selectedRoverIndex;

  set selectedRoverIndex(int value) {
    _selectedRoverIndex = value;
    notifyListeners();
  }

  String get selectedCamAPIName => _selectedCamAPIName;

  set selectedCamAPIName(String value) {
    _selectedCamAPIName = value;
    notifyListeners();
  }

  // final String fixQuery =
  //     "/photos?api_key=DEMO_KEY&sol=1000&page=1";
  //https://api.nasa.gov/mars-photos/api/v1/rovers/opportunity/photos?sol=1000&api_key=DEMO_KEY&page=1

  updateSelectedRover(int index) {
    selectedRoverIndex = index;
    selectedRoverAPIName = roverNames[index];
    camOptions = index == 0 ? curiosityCameras : opportunitySpiritCameras;
    //getPhotos();
  }

  Future<RoverPhotos> getPhotos() async {
    String url = endPoint +
        selectedRoverAPIName +
        fixQuery +"&sol=" + solParameter.toString()+
        (selectedCamAPIName == "all"
            ? ""
            : "&camera=" + selectedCamAPIName);
    print(url);

    var response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);
      //print(jsonResponse);

      if ((jsonResponse["photos"] as List).length == 0) {
        throw Exception("Girdiğiniz kriterlere uygun bir sonuç bulunamadı :/ ");
      }
      //print(jsonResponse["photos"]);
      return RoverPhotos.fromJson(jsonResponse);
    } else {
      throw Exception(
          "hata meydana geldi statusCode: " + response.statusCode.toString());
    }
  }
}

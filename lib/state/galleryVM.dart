import 'package:flutter/material.dart';

// enum roverName {
//   Curiosity,Opportunity,Spirit
// }
class GalleryVM extends ChangeNotifier {
  final List<String> roverNames = ["curiosity", "opportunity", "spirit"];

  //roverName selectedRover= roverName.Opportunity;
  int _selectedRoverIndex;
  List<String> _camOptions;
  String selectedCam; //null ise seçilmemiş :)

  List<String> get camOptions => _camOptions;

  set camOptions(List<String> value) {
    _camOptions = value;
    notifyListeners();
  }

  GalleryVM() {
    _selectedRoverIndex = 0;
    camOptions = curiosityCameras;
  }

  final String endPointWithOutApiKey = "https://mars-photos.herokuapp.com/";
  final String endPoint = "https://api.nasa.gov/mars-photos/api/v1/rovers/";
  String selectedRoverAPIName = "curiosity";

  //page eklenerek max 25 tane alınması sağlandı
  final String fixQuery =
      "photos?api_key=34GEounDGYVWATdri13FpLtCifWfylswMEWoFYI6&sol=1000&page=1";

  final String latest =
      "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/latest_photos?api_key=34GEounDGYVWATdri13FpLtCifWfylswMEWoFYI6&camera=rhaz";

  final List<String> curiosityCameras = [
    "fhaz",
    "rhaz",
    "mast",
    "chemcam",
    "mahli",
    "mardi",
    "navcam"
  ];
  final List<String> opportunitySpiritCameras = [
    "fhaz",
    "rhaz",
    "navcam",
    "pancam",
    "minites"
  ];

  int get selectedRoverIndex => _selectedRoverIndex;

  set selectedRoverIndex(int value) {
    _selectedRoverIndex = value;
    notifyListeners();
  }

  updateSelectedRover(int index) {
    selectedRoverIndex = index;
    camOptions = index ==0 ? curiosityCameras : opportunitySpiritCameras;
  }
}

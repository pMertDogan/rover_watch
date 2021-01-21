enum RoverTypes {Curiosity, Opportunity , Spirit}

const String fixQuery =
      "/photos?api_key=34GEounDGYVWATdri13FpLtCifWfylswMEWoFYI6&page=1";
class RoverAppConfig {

  static const List<String> curiosityCameras = [
    "all",
    "fhaz",
    "rhaz",
    "mast",
    "chemcam",
    "mahli",
    "mardi",
    "navcam"
  ];
  static const List<String> opportunitySpiritCameras = [
    "all",
    "fhaz",
    "rhaz",
    "navcam",
    "pancam",
    "minites"
  ];


}
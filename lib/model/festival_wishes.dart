class MaptoModel {
  String? wishes, festival, image;

  MaptoModel(this.wishes, this.festival, this.image);

  factory MaptoModel.festival(Map festival) {
    MaptoModel m1 =
        MaptoModel(festival["wishes"], festival["festival"], festival["image"]);
    return m1;
  }
}

class Festivallist
{

}

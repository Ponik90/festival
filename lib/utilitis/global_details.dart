import 'package:festival/model/festival_wishes.dart';

Global g1 = Global();

class Global {
  List<MaptoModel> festivaldetail = [];
  List<Map> l1 = [
    {'wishes': "The colors of your life may never fade, Happy Holi", 'festival': "Holi"},
    {'wishes': "May every color of Holi bring happiness and love into your life", 'festival': "Holi"},
    {'wishes': "Holi is a time to forget and forgive and make a new beginning with happiness and love", 'festival': "Holi"},
    {'wishes': "Celebrate the festivals of Holi with joy and enthusiasm. Happy Holi to all", 'festival': "Holi"},
  ];

  void create() {
    festivaldetail = l1.map((e) => MaptoModel.festival(e)).toList();
  }
}

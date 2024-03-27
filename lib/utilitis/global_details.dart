import 'package:festival/model/festival_wishes.dart';

Global g1 = Global();

class Global {
  List<Map> festivalname = [
    {'festival': "Holi", "image": "assets/image/holi.jpg"},
    {'festival': "Dussehra", "image": "assets/image/dussehra.jpg"},
    {'festival': "Raksha Bandhan", "image": "assets/image/rakhsa.jpg"},
    {'festival': "Uttarayan", "image": "assets/image/uttrayan.jpg"},
    {'festival': "Diwali", "image": "assets/image/diwali.jpg"},
  ];
  List<MaptoModel> festivaldetail = [];
  List<Map> l1 = [
    {'wishes': "The colors of your life may never fade, Happy Holi",},
    {
      'wishes':
          "May every color of Holi bring happiness and love into your life",
    },
    {
      'wishes':
          "Holi is a time to forget and forgive and make a new beginning with happiness and love",
    },
    {
      'wishes':
          "Celebrate the festivals of Holi with joy and enthusiasm. Happy Holi to all",
    },

    {'wishes': "Wishing you and your family a Diwali filled with love, light, and prosperity.",},
    {
      'wishes':
      "May the glow of the diyas light up your life and bring you happiness. Happy Diwali!",
    },
    {
      'wishes':
      "Wishing you a Diwali that's as bright and beautiful as your smile.",
    },
    {
      'wishes':
      "Wishing you a Diwali filled with enlightenment and the victory of good over evil.",
    },

  ];

  void create() {
    festivaldetail = l1.map((e) => MaptoModel.festival(e)).toList();
  }

  String? name;
  String? phone;
  String? email;
  String? image;
}

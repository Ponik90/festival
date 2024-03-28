import 'package:festival/model/festival_wishes.dart';

Global g1 = Global();

class Global {
  List<Map> festivalname = [
    {'festival': "Holi", "image": "assets/image/holi.jpg", 'wishes': 'holi'},
    {'festival': "Dussehra", "image": "assets/image/dussehra.jpg"},
    {'festival': "Raksha Bandhan", "image": "assets/image/rakhsa.jpg"},
    {'festival': "Uttarayan", "image": "assets/image/uttrayan.jpg"},
    {'festival': "Diwali", "image": "assets/image/diwali.jpg"},
  ];
  List<MaptoModel> festivaldetail = [];

  List<Map> allinone = [];

  List<Map> diwali = [
    {
      'wishes':
          "Wishing you and your family a Diwali filled with love, light, and prosperity.",
    },
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

  List<Map> dussehra = [
    {
      'wishes':
          "May the triumph of good over evil in the epic of Ramayana inspire us to conquer our inner demons this Dussehra",
    },
    {
      'wishes':
          "On this Dussehra, let's strive to be as virtuous and courageous as Lord Rama in our own lives",
    },
    {
      'wishes':
          "May the goodness of Lord Rama guide you towards righteousness and truth in all your endeavours. Wishing you a blessed Dussehra!",
    },
    {
      'wishes':
          "Let the celebrations of Dussehra bring happiness and harmony into your life, just as Lord Rama brought peace to the world. Happy Dussehra!",
    },
  ];

  List<Map> raksha = [
    {
      'wishes': "May God always keep you safe all the days of your life",
    },
    {
      'wishes':
          "Thank you for being my number one supporter and my motivation.",
    },
    {
      'wishes':
          "Life is a better place and a beautiful experience because you’re in it.",
    },
    {
      'wishes':
          "Thank you for being my number one supporter and my motivation.",
    },
  ];

  List<Map> holi = [
    {
      'wishes': "The colors of your life may never fade, Happy Holi",
    },
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
  ];

  List<Map> uttarayan = [
    {
      'wishes': "The colors of your life may never fade, Happy Holi",
    },
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
  ];
  List<String> holimage = [
    "assets/bgimage/holi1.jpg",
    "assets/bgimage/holi2.jpg",
    "assets/bgimage/holi3.jpg",
    "assets/bgimage/holi4.jpg",
  ];
  List<String> dussehraimage = [
    "assets/bgimage/dussehra1.jpg",
    "assets/bgimage/dussehra2.jpg",
    "assets/bgimage/dussehra3.jpg",
    "assets/bgimage/dussehra4.jpg",
  ];
  List<String> utrryanimage = [
    "assets/bgimage/uttarayan1.jpg",
    "assets/bgimage/uttarayan2.jpg",
    "assets/bgimage/uttarayan3.jpg",
    "assets/bgimage/uttarayan4.jpg",
  ];
  List<String> rakhsaimage = [
    "assets/bgimage/rakshabandhan1.jpg",
    "assets/bgimage/rakshabandhan2.jpg",
    "assets/bgimage/rakshabandhan3.jpg",
    "assets/bgimage/rakshabandhan4.jpg",
  ];
  List<String> diwaliimage = [
    "assets/bgimage/diwali1.jpg",
    "assets/bgimage/diwali2.jpg",
    "assets/bgimage/diwali3.jpg",
    "assets/bgimage/diwali4.png",
  ];

  void create() {
    festivaldetail = festivalname.map((e) => MaptoModel.festival(e)).toList();
  }

  String? name;
  String? phone;
  String? email;
  String? image;
}

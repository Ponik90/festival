import 'package:festival/screen/edit_post/edit_post_screen.dart';
import 'package:festival/screen/home/home_screen.dart';
import 'package:festival/screen/personal_detail/personal_screen.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> screen = {
  '/': (context) => const HomeScreen(),
  'edit': (context) => const EditPostScreen(),
  'personal': (context) => const PersonalScreen(),
};

import 'package:festival/screen/edit_post/edit_post_screen.dart';
import 'package:festival/screen/home/home_screen.dart';
import 'package:festival/screen/personal_detail/personal_screen.dart';
import 'package:festival/screen/post/post_screen.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> screen = {
  '/': (context) => const HomeScreen(),
  'post': (context) => const PostScreen(),
  'edit': (context) => const EditPostScreen(),
  'personal': (context) => const PersonalScreen(),
};

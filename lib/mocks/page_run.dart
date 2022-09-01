import 'package:flutter/material.dart';

class RunPage {
  final String image;
  final MaterialColor color;

  RunPage({required this.image, required this.color});
}

List<RunPage> heroes = [
  RunPage(image: "", color: Colors.blue),
  RunPage(image: "", color: Colors.red),
  RunPage(image: "", color: Colors.yellow),
];

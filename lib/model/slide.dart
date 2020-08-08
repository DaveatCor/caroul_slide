import 'package:flutter/material.dart';

class SlideModel{
  final String image;
  final String title;
  final String description;

  SlideModel({
    @required this.image,
    @required this.title,
    @required this.description
  });
}

final slideList = [
  SlideModel(
    image: "assets/number1.png", 
    title: "Blockchain as a Customer Loyalty solution",
    description: "Customer loyalty programs allow companies to reward customers who make purchases frequently or on a specified period"
  ),
  SlideModel(
    image: "assets/number3.png", 
    title: "API for Payment Solutions",
    description: "With our robust API developers can access payment ecosystems for a more dynamic transition of value."
  ) 
];
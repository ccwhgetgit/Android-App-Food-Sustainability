
import 'package:flutter/material.dart';

class ShoeModel {
  final String name;
  final int price;

  final Color color;
  final String brand;
  final String imgPath;

  ShoeModel({
    this.name,
    this.price,

    this.color,
    this.brand,
    this.imgPath,
  });

  static List< ShoeModel> list = [
   ShoeModel(
      name: "Mini Cycler",
       price: 300,
      color: Colors.orangeAccent,
      brand: "It all starts from somewhere. Work your way up to Gold!",
      imgPath: "images/1.png",
    ),
    ShoeModel(
      name: "Budding Cycler",
      price: 500,
      color: Colors.blueGrey,
      brand: "That's amazing! You can do it!",
      imgPath: "images/2.png",
    ),
     ShoeModel(
      name: "Foodie Warrior",
       price: 700,
      color: Colors.amber,
      brand: "Well Done! Receive your very own exclusive physical gold card",
      imgPath: "images/3.png",
    ),
  ];
}

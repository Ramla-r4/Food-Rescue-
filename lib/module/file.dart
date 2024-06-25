import 'package:flutter/material.dart';

class Box {
  String img;
  Color color;
  String location;
  String name;
  String quilty;
  Color boxColor;
  double price;

  Box({
    required this.img,
    required this.color,
    required this.boxColor,
    required this.location,
    required this.name,
    required this.quilty,
    required this.price,
  });

  static List<Box> getfiles() {
    List<Box> categories = [];
    categories.add(Box(
        img: 'assests/images/img.jpeg',
        name: 'Health Food',
        quilty: 'Good',
        location: 'Somali',
        color: Color.fromRGBO(233, 243, 238, 1),
        price: 19.5,
        boxColor: Color.fromRGBO(2, 2, 2, 1)));
    categories.add(Box(
        img: 'assests/images/img2.jpg',
        name: 'Burger',
        quilty: 'Good',
        price: 6.5,
        location: 'Somali',
        color: Color.fromRGBO(233, 243, 238, 1),
        boxColor: Color.fromRGBO(104, 162, 138, 1)));
    categories.add(Box(
        img: 'assests/images/img3.jpg',
        name: 'Rice',
        quilty: 'Good',
        price: 13.5,
        location: 'Somali',
        color: Color.fromRGBO(233, 243, 238, 1),
        boxColor: Color.fromRGBO(104, 162, 138, 1)));
    categories.add(Box(
        img: 'assests/images/img4.jpg',
        name: 'Pizza',
        quilty: 'Good',
        price: 8.5,
        location: 'Somali',
        color: Color.fromRGBO(233, 243, 238, 1),
        boxColor: Color.fromRGBO(104, 162, 138, 1)));
    categories.add(Box(
        img: 'assests/images/img7.jpeg',
        name: 'Sushi',
        quilty: 'Good',
        price: 23.5,
        location: 'Somali',
        color: Color.fromRGBO(233, 243, 238, 1),
        boxColor: Color.fromRGBO(104, 162, 138, 1)));
    categories.add(Box(
        img: 'assests/images/img6.jpg',
        name: 'chicken',
        quilty: 'Good',
        price: 10.5,
        location: 'Somali',
        color: Color.fromRGBO(233, 243, 238, 1),
        boxColor: Color.fromRGBO(104, 162, 138, 1)));

    return categories;
  }
}

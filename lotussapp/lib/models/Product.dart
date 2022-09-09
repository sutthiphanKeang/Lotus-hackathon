import 'package:flutter/material.dart';

class Product {
  final int id;
  final String title, description;
  final List<String> images;
  final double rating, price;
  final bool isFavourite, isPopular;

  Product({
    required this.id,
    required this.images,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    required this.title,
    required this.price,
    required this.description,
  });
}

// Our demo Products

List<Product> demoProducts = [
  Product(
    id: 1,
    images: [
      "assets/images/hot1.png",
    ],
    title: "Farmhouse ขนมปังฟาร์มเฮ้าส์",
    price: 18.50,
    description: description,
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 2,
    images: [
      "assets/images/hot2.png",
    ],
    title: "Tipco Profiber ",
    price: 35.00,
    description: description,
    rating: 4.1,
    isPopular: true,
  ),
  Product(
    id: 3,
    images: [
      "assets/images/glap.png",
    ],
    title: "Gloves XC Omega - Polygon",
    price: 439.00,
    description: description,
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 4,
    images: [
      "assets/images/wireless headset.png",
    ],
    title: "Logitech Head",
    price: 629.0,
    description: description,
    rating: 4.1,
    isFavourite: true,
  ),
];

const String description =
    "ใส่รายละเอียดดดดดดเพื่ออออมีนะ แต่กูคิดไม่ออกจ้าาาา ตอนนี้ ง่วง  …";

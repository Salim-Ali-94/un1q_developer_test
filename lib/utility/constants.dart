import "package:flutter/material.dart";


const Color grey = Color(0xFFF2F3F5);
const Color dark_grey = Color(0xFF9E9E9E);
const Color black = Color(0xFF181818);
const Color red = Color(0xFFFF0626);
const Color green = Color(0xFF019C00);
const Color orange = Color(0xFFFFCA51);

const List<Map<String, String>> categories = [{ "icon": "sandwich", "category": "Mexican", "cover": "assets/icons/mexican.jpg" },
                                              { "icon": "sushi", "category": "Asian", "cover": "assets/icons/asian.jpg" },
                                              { "icon": "fries", "category": "Fast Food", "cover": "assets/icons/fast.jpg" },
                                              { "icon": "burger", "category": "American", "cover": "assets/icons/american.jpg" },
                                              { "icon": "salad", "category": "Vegetarian", "cover": "assets/icons/vegetarian.jpg" },
                                              { "icon": "pizza", "category": "Italian", "cover": "assets/icons/italian.jpg" }];

const String meal_endpoint = "https://stagingshop.threls.dev/api/products?filter[class]=food";

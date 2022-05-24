
// ignore_for_file: prefer_const_constructors, must_be_immutable, use_key_in_widget_constructors, prefer_adjacent_string_concatenation

import 'package:dazllapp/model/category.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatefulWidget{
  Category category;
  CategoryCard({required this.category});


  @override
  _CategoryCardState createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(left: 10, right: 10),
          child: SizedBox(
            width: 100,
            height: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Stack(
                children: [
                  Image.asset(
                    "assets/images/" + widget.category.image,
                    height: 150,
                    width: 100,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFF343434).withOpacity(0.4),
                          Color(0xFF343434).withOpacity(0.15),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.0,
                      vertical: 10,
                    ),
                    child: Text.rich(
                      TextSpan(
                        style: TextStyle(color: Colors.white),
                        children: [
                          TextSpan(
                            text: "DAZL IS FOR" + "\n",
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xffffffff),
                            ),
                          ),
                          TextSpan(
                              text: widget.category.tittle,
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xffffffff),
                              ))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
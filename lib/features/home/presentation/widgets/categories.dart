import 'package:flutter/material.dart';

Widget buildSpecialOfferCard({
  required final String category,
  required final String image,
  required final int numOfBrands,
  required final GestureTapCallback press,
}) =>
    SizedBox(
      // width: 215,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: GestureDetector(
          onTap: press,
          child: Stack(
            children: [
              Image.network(
                image,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                child: Text.rich(
                  TextSpan(
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    children: [
                      TextSpan(
                        text: '$category\n',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(text: '$numOfBrands Brands'),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );

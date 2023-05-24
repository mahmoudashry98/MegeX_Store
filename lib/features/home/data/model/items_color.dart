import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ItemsColorModel extends Equatable {
  final List<ItemsColor> itemsColor;

  const ItemsColorModel({
    required this.itemsColor,
  });

  @override
  List<Object?> get props => [
        ItemsColor,
      ];
}

class ItemsColor extends Equatable {
  final String colorName;
  final Color color;

  const ItemsColor({
    required this.colorName,
    required this.color,
    
  });

  @override
  List<Object?> get props => [
        colorName,
        color,
      ];
}

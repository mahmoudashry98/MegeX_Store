
import 'package:e_commerce_app/core/utils/media_query_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../utils/app_colors.dart';

class TextFromFieldWidget extends StatelessWidget {
  const TextFromFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Container(
              height: context.height * 0.06,
              width: context.width * 0.77,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white,
              ),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextField(
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                     
                    }
                  },
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                      color: AppColors.errorColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                    ),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintText: 'London...',
                    contentPadding: const EdgeInsets.only(
                      left: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const Spacer(),
        GestureDetector(
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              color: Colors.teal[400],
            ),
            child: Icon(
              Icons.search,
              size: 35,
              color: AppColors.lightGrey,
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';


class HomeCreditScore extends StatelessWidget {
  const HomeCreditScore({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: ZohSizes.fontSizeLg,
        right: ZohSizes.fontSizeLg,
        bottom: ZohSizes.spaceBtwZoh,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            spreadRadius: 0,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          RichText(
            text: const TextSpan(
              style: TextStyle(fontSize: ZohSizes.md, color: Colors.black),
              children: [
                TextSpan(text: 'My Credit Score is '),
                TextSpan(
                  text: '550',
                  style: TextStyle(
                    color: Color(0xFFE8A020),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: ZohSizes.iconXs),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: ZohSizes.sm,
              vertical: ZohSizes.sm,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(ZohSizes.spaceBtwZoh),
              color: const Color(0xFFFDF8E8),
            ),
            child: Row(
              children: [
                Image(
                  image: AssetImage(ZohImageStrings.medium),
                  height: ZohSizes.spaceBtwZoh,
                ),
                const SizedBox(width: 5),
                const Text(
                  'Medium',
                  style: TextStyle(fontSize: ZohSizes.md, color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
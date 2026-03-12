import 'package:flutter/material.dart';

import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helper_functions/helper_functions.dart';


class HomePromoBanner extends StatelessWidget {
  const HomePromoBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: ZohSizes.iconXs),
      height: HelperFunctions.screenHeight(context) * .18,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(ZohSizes.md),
        image: const DecorationImage(
          image: AssetImage(ZohImageStrings.promoBanner),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
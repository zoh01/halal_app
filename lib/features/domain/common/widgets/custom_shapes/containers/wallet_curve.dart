import 'package:flutter/material.dart';
import 'package:halal_app/features/domain/common/widgets/custom_shapes/curved_edges/curved_edges_widgets.dart';
import 'package:halal_app/utils/constants/colors.dart';
import 'package:halal_app/utils/constants/image_strings.dart';
import 'package:halal_app/utils/helper_functions/helper_functions.dart';

class WalletCurve extends StatelessWidget {
  const WalletCurve({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ZCurvedEdgeWidget(
      child: Container(
        height: HelperFunctions.screenHeight(context) * .17,
        color: ZohColors.primaryColor,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Image(image: AssetImage(ZohImageStrings.backgroundWallet)),
            ),
            child,
          ],
        ),
      ),
    );
  }
}

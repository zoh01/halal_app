import 'package:flutter/material.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../domain/common/widgets/custom_shapes/containers/wallet_curve.dart';

class HomeWalletCard extends StatelessWidget {
  final bool balanceVisible;
  final VoidCallback onToggleBalance;

  const HomeWalletCard({
    super.key,
    required this.balanceVisible,
    required this.onToggleBalance,
  });

  @override
  Widget build(BuildContext context) {
    return WalletCurve(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: ZohSizes.md),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Wallet Balance',
                  style: TextStyle(
                    fontSize: ZohSizes.fontSizeSm,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      balanceVisible ? '₦500,387.00' : '₦••••••',
                      style: const TextStyle(
                        fontSize: ZohSizes.defaultSpace,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        letterSpacing: -0.5,
                      ),
                    ),
                    const SizedBox(width: 8),
                    GestureDetector(
                      onTap: onToggleBalance,
                      child: Icon(
                        balanceVisible
                            ? Icons.remove_red_eye_outlined
                            : Icons.visibility_off_outlined,
                        color: Colors.white.withOpacity(0.85),
                        size: ZohSizes.defaultSpace,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Halal-Welfare MFB',
                  style: TextStyle(
                    fontSize: ZohSizes.fontSizeSm,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: ZohSizes.sm),
                Row(
                  children: [
                    const Text(
                      '0123456789',
                      style: TextStyle(
                        fontSize: ZohSizes.md,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 6),
                    GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.copy_rounded,
                        size: ZohSizes.fontSizeLg,
                        color: Colors.white.withOpacity(0.85),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
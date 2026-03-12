import 'package:flutter/material.dart';
import 'package:halal_app/utils/constants/sizes.dart';

class BillTile extends StatelessWidget {
  final String label;
  final String image;
  final Color bgColor;
  final bool showDivider;

  const BillTile({
    super.key,
    required this.label,
    required this.image,
    required this.bgColor,
    this.showDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(ZohSizes.iconXs),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: ZohSizes.fontSizeSm),
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: bgColor,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.12),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Image(
                    image: AssetImage(image),
                    height: ZohSizes.defaultSpace,
                  ),
                ),
                const SizedBox(width: ZohSizes.md),

                Expanded(
                  child: Text(
                    label,
                    style: const TextStyle(
                      fontSize: ZohSizes.md,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF0D1B2A),
                    ),
                  ),
                ),

                const Icon(
                  Icons.chevron_right_rounded,
                  color: Color(0xFFBBBBBB),
                  size: ZohSizes.defaultSpace,
                ),
              ],
            ),
          ),
        ),

        if (showDivider)
          const Divider(
            height: 1,
            thickness: 1,
            color: Color(0xFFF9E9FF),
          ),
      ],
    );
  }
}
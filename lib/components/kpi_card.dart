import 'package:flutter/material.dart';
import 'package:ordo_test/const/colors.dart';
import 'package:ordo_test/const/text_style.dart';
import 'package:ordo_test/model/data.dart';

class KPICard extends StatelessWidget {
  final KPIData data;
  final bool isFirst;
  final bool isLast;
  final VoidCallback? onTap;

  const KPICard({
    required this.data,
    this.isFirst = false,
    this.isLast = false,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      margin: EdgeInsets.fromLTRB(
        isFirst ? 26 : 4,
        5,
        isLast ? 12 : 4,
        5,
      ),
      decoration: BoxDecoration(
        color: OrdoColors.whiteColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1F7864E6),
            blurRadius: 4,
            spreadRadius: 2,
            blurStyle: BlurStyle.normal,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        color: data.type.color,
                        shape: BoxShape.circle,
                      ),
                      child: data.type.icon,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      data.type.title,
                      style: textVerySmallMedium.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  data.value.toString(),
                  style: textLargeSemiBold.copyWith(
                    fontSize: 27,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Last month',
                      style: textExtraSmall.copyWith(
                        fontSize: 9,
                        color: OrdoColors.gray2Color,
                      ),
                    ),
                    Text(
                      '${data.percentage.isNegative ? '' : '+'}${data.percentage}%',
                      style: textMediumMedium.copyWith(
                        fontSize: 9,
                        color: data.percentage.isNegative
                            ? OrdoColors.redColor
                            : OrdoColors.blackColor,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

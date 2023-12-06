import 'package:flutter/material.dart';
import 'package:ordo_test/const/colors.dart';
import 'package:ordo_test/const/text_style.dart';

enum KPIType {
  totalLead(
    title: 'Total Lead',
    icon: Icon(
      Icons.storefront_rounded,
      size: 11,
      color: OrdoColors.whiteColor,
    ),
    color: OrdoColors.lightPurple100Color,
  ),
  hotLead(
    title: 'Hot Lead',
    icon: Icon(
      Icons.local_fire_department_rounded,
      size: 11,
      color: OrdoColors.whiteColor,
    ),
    color: OrdoColors.lightRedColor,
  ),
  totalDeal(
    title: 'Total Deal',
    icon: Icon(
      Icons.check,
      size: 11,
      color: OrdoColors.whiteColor,
    ),
    color: OrdoColors.green1Color,
  ),
  grandOpening(
    title: 'Grand Opening',
    icon: Icon(
      Icons.navigation_sharp,
      size: 11,
      color: OrdoColors.whiteColor,
    ),
    color: OrdoColors.green2Color,
  ),
  coldLead(
    title: 'Cold Lead',
    icon: Icon(
      Icons.ac_unit,
      size: 11,
      color: OrdoColors.whiteColor,
    ),
    color: OrdoColors.lightPurple100Color,
  ),
  failedDeal(
    title: 'Failed Deal',
    icon: Icon(
      Icons.clear,
      size: 11,
      color: OrdoColors.whiteColor,
    ),
    color: OrdoColors.lightPurple100Color,
  ),
  ;

  final String title;
  final Widget icon;
  final Color color;
  const KPIType({
    required this.title,
    required this.icon,
    required this.color,
  });
}

class KPICard extends StatelessWidget {
  final int value;
  final double percentage;
  final KPIType type;

  const KPICard(
      {required this.value,
      required this.percentage,
      required this.type,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: OrdoColors.whiteColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color(0xCC7864E6),
            blurRadius: 12,
            spreadRadius: 6,
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            children: [
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  color: type.color,
                  shape: BoxShape.circle,
                ),
                child: type.icon,
              ),
              const SizedBox(width: 8),
              Text(
                type.title,
                style: textVerySmallMedium.copyWith(
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          Text(
            value.toString(),
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
                '${percentage.isNegative ? '' : '+'}$percentage%',
                style: textMediumMedium.copyWith(
                  fontSize: 9,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

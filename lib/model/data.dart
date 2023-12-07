import 'package:flutter/material.dart';
import 'package:ordo_test/components/user_label.dart';
import 'package:ordo_test/const/colors.dart';

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

class KPIData {
  final int value;
  final double percentage;
  final KPIType type;

  KPIData({
    required this.value,
    required this.percentage,
    required this.type,
  });
}

class LeaderboardRecentData {
  final String name;
  final String? subtitle;
  final DateTime? date;
  final String? profile;
  final UserLabelType type;
  final int value;
  final int deals;

  LeaderboardRecentData({
    required this.name,
    this.subtitle,
    this.date,
    this.profile,
    required this.type,
    required this.value,
    required this.deals,
  });
}

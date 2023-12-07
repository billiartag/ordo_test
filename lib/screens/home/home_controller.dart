import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ordo_test/components/user_label.dart';
import 'package:ordo_test/model/data.dart';
import 'package:ordo_test/screens/home/home.dart';

class HomeController extends GetxController {
  ScrollController kpiScrollController = ScrollController();
  int totalRevenue = 2550000;
  RxInt scrollPosition = 0.obs;

  final String profilePicture = 'assets/images/frame.png';

  final Rx<MenuItem> selectedGraph = MenuItem.daily.obs;

  final List<KPIData> dataKpi = [
    KPIData(
      value: 123,
      percentage: -10,
      type: KPIType.totalLead,
    ),
    KPIData(
      value: 123,
      percentage: 10,
      type: KPIType.hotLead,
    ),
    KPIData(
      value: 123,
      percentage: 10,
      type: KPIType.coldLead,
    ),
    KPIData(
      value: 123,
      percentage: 10,
      type: KPIType.grandOpening,
    ),
    KPIData(
      value: 123,
      percentage: 10,
      type: KPIType.failedDeal,
    ),
  ];

  final List<LeaderboardRecentData> dataLeadRecent = [
    LeaderboardRecentData(
      name: 'Lorem Ipsum',
      date: DateTime.now(),
      type: UserLabelType.newLead,
      value: 1500000,
      deals: 10,
    ),
    LeaderboardRecentData(
      name: 'Ipsum Ipsum',
      date: DateTime.now(),
      type: UserLabelType.deals,
      value: 3500000,
      deals: 20,
    ),
    LeaderboardRecentData(
      name: 'Lorem Lorem',
      date: DateTime.now(),
      type: UserLabelType.hotLead,
      value: 1250000,
      deals: 15,
    ),
    LeaderboardRecentData(
      name: 'Lauren Lorem',
      date: DateTime.now(),
      type: UserLabelType.hotLead,
      value: 250000,
      deals: 12,
    ),
    LeaderboardRecentData(
      name: 'Lorem Ipsam',
      date: DateTime.now(),
      type: UserLabelType.hotLead,
      value: 3250000,
      deals: 8,
    ),
    LeaderboardRecentData(
      name: 'Possum Possum?',
      date: DateTime.now(),
      type: UserLabelType.hotLead,
      value: 6250000,
      deals: 23,
    ),
    LeaderboardRecentData(
      name: 'Possum Possum?',
      date: DateTime.now(),
      type: UserLabelType.hotLead,
      value: 225000,
      deals: 12,
    ),
    LeaderboardRecentData(
      name: 'Possum Possum?',
      date: DateTime.now(),
      type: UserLabelType.hotLead,
      value: 3125000,
      deals: 20,
    ),
    LeaderboardRecentData(
      name: 'Possum Possum?',
      date: DateTime.now(),
      type: UserLabelType.hotLead,
      value: 1525000,
      deals: 15,
    ),
    LeaderboardRecentData(
      name: 'Possum Possum?',
      date: DateTime.now(),
      type: UserLabelType.hotLead,
      value: 6025000,
      deals: 30,
    ),
  ];

  void setSelectedGraph(MenuItem value) {
    selectedGraph(value);
    update();
  }

  void setScrollPosition() {
    int position = (kpiScrollController.offset / 240).round();
    scrollPosition(position);
  }
}

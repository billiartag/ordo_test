import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:ordo_test/components/button.dart';
import 'package:ordo_test/components/kpi_card.dart';
import 'package:ordo_test/components/leaderboard_deals_card.dart';
import 'package:ordo_test/components/leaderboard_recent_card.dart';
import 'package:ordo_test/components/navbar.dart';
import 'package:ordo_test/const/colors.dart';
import 'package:ordo_test/const/text_style.dart';
import 'package:ordo_test/screens/home/home_controller.dart';

enum MenuItem { daily, weekly, monthly }

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const HomeNavbar(
        currentIndex: 0,
      ),
      body: SafeArea(
        child: DecoratedBox(
          decoration: const BoxDecoration(color: OrdoColors.whiteColor),
          child: CustomScrollView(
            physics: const ClampingScrollPhysics(),
            slivers: [
              SliverAppBar(
                pinned: true,
                primary: false,
                automaticallyImplyLeading: false,
                backgroundColor: OrdoColors.lightPurpleMainColor,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text(
                    'Dashboard',
                    style: textMedium.copyWith(
                      fontSize: 15,
                      color: OrdoColors.whiteColor,
                    ),
                  ),
                ),
                actions: [
                  const Icon(
                    Icons.notifications,
                    size: 24,
                    color: OrdoColors.whiteColor,
                  ),
                  const SizedBox(width: 12),
                  CircleAvatar(
                    radius: 15,
                    child: CircleAvatar(
                      radius: 13,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          homeController.profilePicture,
                          height: 30,
                          width: 30,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                ],
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    DecoratedBox(
                      decoration: const BoxDecoration(
                          color: OrdoColors.lightPurpleMainColor,
                          boxShadow: [
                            BoxShadow(
                              color: OrdoColors.lightPurpleMainColor,
                              blurRadius: 0.0,
                              spreadRadius: 0.0,
                              offset: Offset(0, -10),
                            )
                          ]),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Total Revenue',
                                      style: textRegular.copyWith(
                                        fontSize: 12,
                                        color: OrdoColors.whiteColor,
                                      ),
                                    ),
                                    Text(
                                      NumberFormat.currency(
                                        locale: "id_ID",
                                        symbol: 'Rp ',
                                        decimalDigits: 0,
                                      ).format(homeController.totalRevenue),
                                      style: textHeadingSemiBold.copyWith(
                                        fontSize: 20,
                                        color: OrdoColors.whiteColor,
                                      ),
                                    )
                                  ],
                                ),
                                PopupMenuButton<MenuItem>(
                                  icon: const Icon(
                                    Icons.more_horiz,
                                    size: 24,
                                    color: OrdoColors.whiteColor,
                                  ),
                                  onSelected: (value) {
                                    homeController.setSelectedGraph(value);
                                  },
                                  itemBuilder: (BuildContext context) =>
                                      <PopupMenuEntry<MenuItem>>[
                                    PopupMenuItem<MenuItem>(
                                      value: MenuItem.daily,
                                      child: Text(
                                        'Daily',
                                        style: textSmallRegular.copyWith(
                                          color: OrdoColors.blackColor,
                                          fontSize: 11,
                                        ),
                                      ),
                                    ),
                                    PopupMenuItem<MenuItem>(
                                      value: MenuItem.weekly,
                                      child: Text(
                                        'Weekly',
                                        style: textSmallRegular.copyWith(
                                          color: OrdoColors.blackColor,
                                          fontSize: 11,
                                        ),
                                      ),
                                    ),
                                    PopupMenuItem<MenuItem>(
                                      value: MenuItem.monthly,
                                      child: Text(
                                        'Monthly',
                                        style: textSmallRegular.copyWith(
                                          color: OrdoColors.blackColor,
                                          fontSize: 11,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const Text('aaa'),
                          const SizedBox(
                            height: 300,
                          ),
                          DotsIndicator(
                            dotsCount: 3,
                            position: 1,
                            decorator: DotsDecorator(
                              color: OrdoColors.whiteColor.withOpacity(0.3),
                              activeColor: OrdoColors.whiteColor,
                              shape: const RoundedRectangleBorder(),
                              activeShape: const RoundedRectangleBorder(),
                              size: const Size(20, 4),
                              activeSize: const Size(20, 4),
                            ),
                          ),
                          const SizedBox(height: 12),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SliverAppBar(
                pinned: false,
                primary: true,
                automaticallyImplyLeading: false,
                backgroundColor: OrdoColors.lightPurpleMainColor,
                flexibleSpace: DecoratedBox(
                  decoration: const BoxDecoration(
                    color: OrdoColors.whiteColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(36),
                      topRight: Radius.circular(36),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: OrdoColors.whiteColor,
                        blurRadius: 0.0,
                        spreadRadius: 0.0,
                        offset: Offset(0, 2),
                      ),
                      BoxShadow(
                        color: OrdoColors.lightPurpleMainColor,
                        blurRadius: 0.0,
                        spreadRadius: 0.0,
                        offset: Offset(0, -30),
                      )
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 20,
                    ),
                    child: Wrap(
                      children: [
                        const Icon(
                          Icons.bar_chart,
                          color: OrdoColors.darkPurpleColor,
                          size: 15,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Key Performance Indicator',
                          style: textMediumMedium.copyWith(
                            fontSize: 13,
                            color: OrdoColors.blackColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    SizedBox(
                      height: 110,
                      child: ListView(
                        controller: homeController.kpiScrollController,
                        physics: const ClampingScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: List.generate(
                          homeController.dataKpi.length,
                          (index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: KPICard(
                                isFirst: index == 0,
                                isLast:
                                    index == homeController.dataKpi.length - 1,
                                data: homeController.dataKpi[index],
                                onTap: () {},
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Obx(
                      () => DotsIndicator(
                        dotsCount: (homeController.dataKpi.length / 2).round(),
                        position: homeController.scrollPosition.value,
                        decorator: const DotsDecorator(
                          color: OrdoColors.gray2Color,
                          activeColor: OrdoColors.lightPurpleColor,
                          shape: RoundedRectangleBorder(),
                          activeShape: RoundedRectangleBorder(),
                          size: Size(20, 2),
                          activeSize: Size(20, 2),
                        ),
                      ),
                    ),
                    const SizedBox(height: 28),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Recent Lead',
                            style: textMediumMedium.copyWith(
                              fontSize: 13,
                            ),
                          ),
                          ArrowButton(onTap: () {}),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  List.generate(
                    3,
                    (index) => Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: LeaderboardRecentCard(
                        name: homeController.dataLeadRecent[index].name,
                        subtitle: homeController.dataLeadRecent[index].subtitle,
                        date: homeController.dataLeadRecent[index].date,
                        profile: homeController.dataLeadRecent[index].profile,
                        type: homeController.dataLeadRecent[index].type,
                        value: homeController.dataLeadRecent[index].value,
                        onTap: () {},
                      ),
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    const SizedBox(height: 28),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Leaderboards',
                            style: textMediumMedium.copyWith(
                              fontSize: 13,
                            ),
                          ),
                          ArrowButton(onTap: () {}),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  List.generate(
                    homeController.dataLeadRecent.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: LeaderboardDealsCard(
                        name: homeController.dataLeadRecent[index].name,
                        date: homeController.dataLeadRecent[index].date ??
                            DateTime.now(),
                        profile: homeController.dataLeadRecent[index].profile,
                        value: homeController.dataLeadRecent[index].deals,
                        queue: index + 1,
                        onTap: () {},
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    homeController = Get.put(HomeController());
    homeController.kpiScrollController.addListener(() {
      homeController.setScrollPosition();
    });
  }
}

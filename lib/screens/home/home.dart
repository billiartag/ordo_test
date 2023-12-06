import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:ordo_test/components/button.dart';
import 'package:ordo_test/components/kpi_card.dart';
import 'package:ordo_test/components/leaderboard_deals_card.dart';
import 'package:ordo_test/components/leaderboard_recent_card.dart';
import 'package:ordo_test/components/navbar.dart';
import 'package:ordo_test/components/user_label.dart';
import 'package:ordo_test/const/colors.dart';
import 'package:ordo_test/const/text_style.dart';

enum MenuItem { daily, weekly, monthly }

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        'images/frame.png',
                        height: 30,
                        width: 30,
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
                                      ).format(123456789),
                                      style: textHeadingSemiBold.copyWith(
                                        fontSize: 20,
                                        color: OrdoColors.whiteColor,
                                      ),
                                    ),
                                  ],
                                ),
                                PopupMenuButton(
                                  icon: const Icon(
                                    Icons.more_horiz,
                                    size: 24,
                                    color: OrdoColors.whiteColor,
                                  ),
                                  initialValue: MenuItem.daily,
                                  onSelected: (value) {},
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
                          const Text('aaa'),
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
                        physics: const ClampingScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: [
                          const SizedBox(width: 20),
                          KPICard(
                            value: 123,
                            percentage: -10,
                            type: KPIType.totalLead,
                            onTap: () {},
                          ),
                          const SizedBox(width: 12),
                          KPICard(
                            value: 123,
                            percentage: 10,
                            type: KPIType.hotLead,
                            onTap: () {},
                          ),
                          const SizedBox(width: 12),
                          KPICard(
                            value: 123,
                            percentage: 10,
                            type: KPIType.coldLead,
                            onTap: () {},
                          ),
                          const SizedBox(width: 12),
                          KPICard(
                            value: 123,
                            percentage: 10,
                            type: KPIType.grandOpening,
                            onTap: () {},
                          ),
                          const SizedBox(width: 12),
                          KPICard(
                            value: 123,
                            percentage: 10,
                            type: KPIType.failedDeal,
                            onTap: () {},
                          ),
                          const SizedBox(width: 20),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    DotsIndicator(
                      dotsCount: 3,
                      position: 1,
                      decorator: DotsDecorator(
                        shape: Border(),
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
                          const ArrowButton(),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    LeaderboardRecentCard(
                      name: 'Lorem Ipsum',
                      date: DateTime.now(),
                      type: UserLabelType.newLead,
                      value: 1500000,
                      onTap: () {},
                    ),
                    const SizedBox(height: 8),
                    LeaderboardRecentCard(
                      name: 'Ipsum Ipsum',
                      date: DateTime.now(),
                      type: UserLabelType.deals,
                      value: 3500000,
                      onTap: () {},
                    ),
                    const SizedBox(height: 8),
                    LeaderboardRecentCard(
                      name: 'Lorem Lorem',
                      date: DateTime.now(),
                      type: UserLabelType.hotLead,
                      value: 1250000,
                      onTap: () {},
                    ),
                  ],
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
                          const ArrowButton(),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    LeaderboardDealsCard(
                      queue: 1,
                      name: 'Lorem Ipsum',
                      date: DateTime.now(),
                      value: 1500000,
                      onTap: () {},
                    ),
                    const SizedBox(height: 8),
                    LeaderboardDealsCard(
                      queue: 2,
                      name: 'Lorem Ipsum',
                      date: DateTime.now(),
                      value: 1500000,
                      onTap: () {},
                    ),
                    const SizedBox(height: 8),
                    LeaderboardDealsCard(
                      queue: 3,
                      name: 'Lorem Ipsum',
                      date: DateTime.now(),
                      value: 1500000,
                      onTap: () {},
                    ),
                    const SizedBox(height: 8),
                    LeaderboardDealsCard(
                      queue: 4,
                      name: 'Lorem Ipsum',
                      date: DateTime.now(),
                      value: 1500000,
                      onTap: () {},
                    ),
                    const SizedBox(height: 8),
                    LeaderboardDealsCard(
                      queue: 5,
                      name: 'Lorem Ipsum',
                      date: DateTime.now(),
                      value: 1500000,
                      onTap: () {},
                    ),
                    const SizedBox(height: 8),
                  ],
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
  }
}

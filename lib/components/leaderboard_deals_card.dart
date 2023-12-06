import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ordo_test/const/colors.dart';
import 'package:ordo_test/const/text_style.dart';

class LeaderboardDealsCard extends StatelessWidget {
  final String name;
  final DateTime date;
  final String? profile;
  final int value;
  final int queue;
  final VoidCallback? onTap;

  const LeaderboardDealsCard({
    super.key,
    required this.name,
    required this.date,
    this.profile,
    required this.value,
    required this.queue,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        color: OrdoColors.whiteColor,
        child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 13,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 18,
                          ),
                          child: Text(
                            queue.toString(),
                            style: textBigSemiBold.copyWith(
                              fontSize: 22,
                              color: OrdoColors.darkPurpleColor,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.zero,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              'images/frame.png',
                              height: 49,
                              width: 49,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.35,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                name,
                                style: textMedium,
                                overflow: TextOverflow.clip,
                              ),
                              const SizedBox(height: 2),
                              Text(
                                DateFormat('dd MMMM yyyy', 'id').format(date),
                                overflow: TextOverflow.clip,
                                style: textSmallRegular.copyWith(
                                  color: OrdoColors.gray2Color,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Wrap(
                      children: [
                        Text(
                          NumberFormat.currency(
                            locale: "id_ID",
                            symbol: '',
                            decimalDigits: 0,
                          ).format(value),
                          style: textMedium.copyWith(
                            color: OrdoColors.darkPurpleColor,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Deals',
                          style: textRegular.copyWith(
                            color: OrdoColors.gray2Color,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )));
  }
}

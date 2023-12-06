import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ordo_test/components/user_label.dart';
import 'package:ordo_test/const/colors.dart';
import 'package:ordo_test/const/text_style.dart';

class LeaderboardRecentCard extends StatelessWidget {
  final String name;
  final String? subtitle;
  final DateTime? date;
  final String? profile;
  final UserLabelType type;
  final int value;
  final VoidCallback? onTap;

  const LeaderboardRecentCard({
    super.key,
    required this.name,
    this.subtitle,
    this.date,
    this.profile,
    required this.type,
    required this.value,
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
              horizontal: 15,
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
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          const SizedBox(height: 2),
                          if (subtitle != null) ...[
                            Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                const Icon(
                                  Icons.message,
                                  size: 12,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  subtitle!,
                                  overflow: TextOverflow.clip,
                                  style: textSmallRegular.copyWith(
                                    color: OrdoColors.gray2Color,
                                  ),
                                ),
                              ],
                            ),
                          ],
                          if (date != null) ...[
                            Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                const Icon(
                                  Icons.calendar_today_outlined,
                                  size: 12,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  DateFormat('dd MMMM yyyy', 'id')
                                      .format(date!),
                                  overflow: TextOverflow.clip,
                                  style: textSmallRegular.copyWith(
                                    color: OrdoColors.gray2Color,
                                  ),
                                ),
                              ],
                            ),
                          ]
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    UserLabel(type: type),
                    const SizedBox(height: 2),
                    Text(
                      NumberFormat.currency(
                        locale: "id_ID",
                        symbol: 'Rp ',
                        decimalDigits: 0,
                      ).format(value),
                      style: textMedium,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

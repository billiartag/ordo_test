import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:ordo_test/const/colors.dart';
import 'package:ordo_test/const/text_style.dart';

enum UserLabelType {
  assigned(
    label: 'Assigned',
    color: OrdoColors.lightPurpleColor,
  ),
  newLead(
    label: 'New Lead',
    color: OrdoColors.lightPurpleColor,
    icon: Icon(
      IconlyBold.star,
      color: OrdoColors.whiteColor,
      size: 12,
    ),
  ),
  approved(
    label: 'Approved',
    color: OrdoColors.green2Color,
    icon: Icon(
      Icons.check,
      color: OrdoColors.whiteColor,
      size: 12,
    ),
  ),
  interested(
    label: 'Interested',
    color: OrdoColors.lightPurpleColor,
    icon: Icon(
      Icons.check_circle,
      color: OrdoColors.whiteColor,
      size: 12,
    ),
  ),
  hotLead(
    label: 'Hot Lead',
    color: OrdoColors.lightRedColor,
    icon: Icon(
      Icons.local_fire_department,
      color: OrdoColors.whiteColor,
      size: 12,
    ),
  ),
  hesitant(
    label: 'Hesitant',
    color: OrdoColors.orangeColor,
    icon: Icon(
      Icons.help,
      color: OrdoColors.whiteColor,
      size: 12,
    ),
  ),
  approvedNoLogo(
    label: 'Approved',
    color: OrdoColors.lightPurpleMainColor,
  ),
  rejected(
    label: 'Rejected',
    color: OrdoColors.redColor,
    icon: Icon(
      Icons.clear,
      color: OrdoColors.whiteColor,
      size: 12,
    ),
  ),
  coldLead(
    label: 'Cold Lead',
    color: OrdoColors.orangeColor,
    icon: Icon(
      Icons.ac_unit,
      color: OrdoColors.whiteColor,
      size: 12,
    ),
  ),
  notInterested(
    label: 'Not Interested',
    color: OrdoColors.lightRedColor,
    icon: Icon(
      Icons.cancel,
      color: OrdoColors.whiteColor,
      size: 12,
    ),
  ),
  needApproval(
    label: 'Need Approval',
    color: OrdoColors.orangeColor,
  ),
  lead(
    label: 'Lead',
    color: OrdoColors.lightPurple100Color,
    icon: Icon(
      Icons.storefront_rounded,
      color: OrdoColors.whiteColor,
      size: 12,
    ),
  ),
  commit(
    label: 'Commit',
    color: OrdoColors.green2Color,
    icon: Icon(
      Icons.check,
      color: OrdoColors.whiteColor,
      size: 12,
    ),
  ),
  deals(
    label: 'Deals',
    color: OrdoColors.green2Color,
    icon: Icon(
      Icons.draw_outlined,
      color: OrdoColors.whiteColor,
      size: 12,
    ),
  ),
  success(
    label: 'Success',
    color: OrdoColors.green2Color,
    icon: Icon(
      Icons.check,
      color: OrdoColors.whiteColor,
      size: 12,
    ),
  ),
  proposal(
    label: 'Proposal',
    color: OrdoColors.darkPurpleColor,
    icon: Icon(
      Icons.file_present_sharp,
      color: OrdoColors.whiteColor,
      size: 12,
    ),
  ),
  failed(
    label: 'Failes',
    color: OrdoColors.lightRedColor,
    icon: Icon(
      Icons.close,
      color: OrdoColors.whiteColor,
      size: 12,
    ),
  ),
  approveKpi(
    label: 'Approve KPI',
    color: OrdoColors.green2Color,
    isColorOutline: true,
  );

  final String label;
  final Widget? icon;
  final Color color;
  final bool isColorOutline;

  const UserLabelType({
    required this.label,
    this.icon,
    required this.color,
    this.isColorOutline = false,
  });
}

class UserLabel extends StatelessWidget {
  final UserLabelType type;

  const UserLabel({
    required this.type,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 3,
      ),
      decoration: BoxDecoration(
        color: type.isColorOutline ? null : type.color,
        border: Border.all(color: type.color),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          type.icon ?? const SizedBox(),
          const SizedBox(
            width: 8,
          ),
          Text(
            type.label,
            style: textSmallMedium.copyWith(
              color: OrdoColors.whiteColor,
            ),
          ),
        ],
      ),
    );
  }
}

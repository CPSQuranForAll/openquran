import 'package:fabrikod_quran/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VerseDetailSettingsButton extends StatelessWidget {
  const VerseDetailSettingsButton({super.key, this.onPressed});
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(kSizeM))),
      onPressed: onPressed,
      backgroundColor: AppColors.grey8,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(),
          child: SvgPicture.asset(
            ImageConstants.settingsIcon,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}

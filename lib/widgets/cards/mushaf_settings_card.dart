import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/providers/quran_provider.dart';
import 'package:fabrikod_quran/screens/translation_setting_screen.dart';
import 'package:fabrikod_quran/widgets/background_color_select.dart';
import 'package:fabrikod_quran/widgets/buttons/layout_options_toggle_buttons.dart';
import 'package:fabrikod_quran/widgets/buttons/quran_font_button.dart';
import 'package:fabrikod_quran/widgets/buttons/read_options_toggle_buttons.dart';
import 'package:fabrikod_quran/widgets/buttons/sound_drop_down_button.dart';
import 'package:fabrikod_quran/widgets/buttons/translation_box.dart';
import 'package:fabrikod_quran/widgets/surah_size_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MushafSettingsCard extends StatefulWidget {
  const MushafSettingsCard({super.key});

  @override
  State<MushafSettingsCard> createState() => _MushafSettingsCardState();
}

class _MushafSettingsCardState extends State<MushafSettingsCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kSizeM),
          side: const BorderSide(color: AppColors.white, width: 1)),
      elevation: 0,
      shadowColor: Colors.transparent,
      color: AppColors.grey8,
      margin: EdgeInsets.only(
        right: Utils.isSmallPhone(context) ? 15 : 20,
        top: Utils.isSmallPhone(context)
            ? 40
            : Utils.isMediumPhone(context)
                ? 100
                : Utils.isBigPhone(context)
                    ? 130
                    : 440,
        left: Utils.isSmallPhone(context)
            ? 50
            : Utils.isMediumPhone(context)
                ? 70
                : Utils.isBigPhone(context)
                    ? 40
                    : 400,
        bottom: 80,
      ),
      child: Padding(
        padding: const EdgeInsets.all(kSizeXL),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ReadOptionsToggleButton(
              isPopUp: true,
              listType: context.watch<QuranProvider>().localSetting.readOptions,
              onValueChanged: context.read<QuranProvider>().changeReadingType,
            ),
            SurahSizeSlider(
              isPopUp: true,
              size: context.watch<QuranProvider>().localSetting.textScaleFactor,
              onChanged: context.read<QuranProvider>().changeFontSize,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const QuranFontButton(),
                LayoutOptionsToggleButton(
                  isPopUp: true,
                  layoutOptions:
                      context.watch<QuranProvider>().localSetting.layoutOptions,
                  onChanged: context.read<QuranProvider>().changeLayoutOptions,
                ),
              ],
            ),
            const SoundDropDown(),
            TranslationBox(onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const TranslationSettingScreen();
                },
              ));
            }),
            BackgroundColorSelect(
              colors: const [
                AppColors.white2,
                AppColors.oasis,
                AppColors.white3,
                AppColors.grey7,
                AppColors.pink
              ],
              defaultIndex: context
                  .watch<QuranProvider>()
                  .localSetting
                  .surahDetailsPageThemeIndex,
              onChangedColor:
                  context.read<QuranProvider>().changeSurahDetailsPageTheme,
            ),
          ],
        ),
      ),
    );
  }
}

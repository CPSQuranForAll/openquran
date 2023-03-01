import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/database/local_db.dart';
import 'package:fabrikod_quran/models/reading_settings_model.dart';
import 'package:fabrikod_quran/models/recent_model.dart';
import 'package:fabrikod_quran/providers/quran_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecentProvider extends ChangeNotifier {

  /// Class ConstructorK
  RecentProvider(this._context) {
    recents = LocalDb.getRecents;
  }
  /// Build context
  final BuildContext _context;

  late ERecentVisitedType eRecentVisitedType;

  /// Recent model list
  List<RecentModel> recents = [];

  /// Adding recent visited page
  void addRecentVisitedPage(RecentModel recent) async {
    recents = await LocalDb.addRecent(recent);
    notifyListeners();
  }

  /// Getting recent visited pages
  getRecents(ReadingSettingsModel readingSettings, int index) {
    late RecentModel recentModel;
    switch (_context.read<QuranProvider>().localSetting.quranType) {
      case EQuranType.translation:
        switch (eRecentVisitedType) {
          case ERecentVisitedType.surah:
            recentModel = RecentModel(
                index: index,
                eRecentVisitedType: ERecentVisitedType.surah);
            break;
          case ERecentVisitedType.juz:
            recentModel = RecentModel(
                index: index,
                eRecentVisitedType: ERecentVisitedType.juz);
            break;
          case ERecentVisitedType.page:
            recentModel = RecentModel(
                index: index,
                eRecentVisitedType: ERecentVisitedType.page);
            break;
        }
        break;
      case EQuranType.reading:
        recentModel = RecentModel(
            index: index,
            eRecentVisitedType: ERecentVisitedType.page);
        break;
    }
    return recentModel;
  }
}

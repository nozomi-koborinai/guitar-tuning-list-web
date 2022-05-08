import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:guitar_tuning_app/guitar_tuning_model.dart';
import 'package:guitar_tuning_app/tuning_type.dart';

class TuningUtil {
  ///DesignPattern:Singleton
  //privateConstructor
  TuningUtil._();

  //Property
  static TuningUtil _instance;

  static TuningUtil get instance => _chkExistsInstance();

  static TuningUtil _chkExistsInstance() {
    if (_instance == null) {
      _instance = new TuningUtil._();
    }
    return _instance;
  }

  //constPath
  static const String  _pathAssets = 'assets/assets/';

  //TuningTypeに対応するTuningName
  Map<TuningType, String> _tuningNameMap = {
    TuningType.STANDARD: 'regular',
    TuningType.SEMITONE_LOWER: 'half step down',
    TuningType.WHOLE_LOWER: 'whole step down',
    TuningType.DROP_D: 'dropD',
    TuningType.DROP_C_SHARP: 'dropC#',
    TuningType.DROP_C: 'dropC',
    TuningType.DROP_B: 'dropB',
    TuningType.OPEN_G: 'openG',
    TuningType.OPEN_A: 'openA',
    TuningType.OPEN_E: 'openE',
    TuningType.OPEN_D: 'openD',
    TuningType.OPEN_GSUS4: 'openGsus4',
    TuningType.OPEN_C6: 'openC6',
    TuningType.DADGAD: 'DADGAD',
    TuningType.DADEAD: 'DADEAD',
  };

  //PublicProperty
  Map<TuningType, String> get tuningNameMap => _tuningNameMap;

  //TuningTypeに対応するTuningTone(6弦～1弦)
  Map<TuningType, String> _tuningToneMap = {
    TuningType.STANDARD: 'E A D G B E',
    TuningType.SEMITONE_LOWER: 'D# G# C# F# A# D#',
    TuningType.WHOLE_LOWER: 'D G C F A D',
    TuningType.DROP_D: 'D A D G B E',
    TuningType.DROP_C_SHARP: 'C# G# C# F# A# D#',
    TuningType.DROP_C: 'C G C F A D',
    TuningType.DROP_B: 'B F# B E G# C#',
    TuningType.OPEN_G: 'D G D G B D',
    TuningType.OPEN_A: 'E A E A C# E',
    TuningType.OPEN_E: 'E B E G# B E',
    TuningType.OPEN_D: 'D A D F# A D',
    TuningType.OPEN_GSUS4: 'D G C G C D',
    TuningType.OPEN_C6: 'C A C G C E',
    TuningType.DADGAD: 'D A D G A D',
    TuningType.DADEAD: 'D A D E A D',
  };

  //TuningTypeに対応する音源のパス名
  Map<TuningType, String> _tuningAudioPathMap = {
    TuningType.STANDARD: _pathAssets + 'standard.wav',
    TuningType.SEMITONE_LOWER: _pathAssets + 'semitone_lower.wav',
    TuningType.WHOLE_LOWER: _pathAssets + 'whole_lower.wav',
    TuningType.DROP_D: _pathAssets + 'drop_d.wav',
    TuningType.DROP_C_SHARP: _pathAssets + 'drop_c_sharp.wav',
    TuningType.DROP_C: _pathAssets + 'drop_c.wav',
    TuningType.DROP_B: _pathAssets + 'drop_b.wav',
    TuningType.OPEN_G: _pathAssets + 'open_g.wav',
    TuningType.OPEN_A: _pathAssets + 'open_a.wav',
    TuningType.OPEN_E: _pathAssets + 'open_e.wav',
    TuningType.OPEN_D: _pathAssets + 'open_d.wav',
    TuningType.OPEN_GSUS4: _pathAssets + 'open_gsus4.wav',
    TuningType.OPEN_C6: _pathAssets + 'open_c6.wav',
    TuningType.DADGAD: _pathAssets + 'dadgad.wav',
    TuningType.DADEAD: _pathAssets + 'dadead.wav',
  };

  //PublicProperty
  Map<TuningType, String> get tuningToneMap => _tuningToneMap;

  //TuningMapからGuitarTuningModelをList生成
  List<GuitarTuningModel> getTuningList() {
    List<GuitarTuningModel> _rtnTuningList = new List();
    for (var _type in TuningType.values) {
      _rtnTuningList.add(new GuitarTuningModel(
          tuningNameMap[_type], tuningToneMap[_type], _type.index, _tuningAudioPathMap[_type]));
    }
    return _rtnTuningList;
  }

  //指定したTuningTypeからTuningModelを生成
  GuitarTuningModel getTuningModelByType(TuningType _type){
    return new GuitarTuningModel(tuningNameMap[_type], tuningToneMap[_type], _type.index);
  }

  //ダークモードかどうか
 bool isDarkMode(BuildContext context) {
    final Brightness brightness = MediaQuery.platformBrightnessOf(context);
    return brightness == Brightness.dark;
 }
}

import 'package:guitar_tuning_app/audio_js_interface.dart';
import 'package:js/js.dart';

class GuitarTuningModel {
  GuitarTuningModel(this.tuningName, this.tuningTone, this.dspNo, [this.audioPathName = '']);
  String tuningName;
  String tuningTone;
  String audioPathName;
  int dspNo;
}

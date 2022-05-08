@JS()
library audio;
import 'package:js/js.dart';

//interface function
@JS('playAudio')
external void playAudio(String audioPath);
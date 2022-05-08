import 'dart:convert';

import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:guitar_tuning_app/HexColor.dart';
import 'package:guitar_tuning_app/guitar_tuning_model.dart';
import 'package:guitar_tuning_app/tuning_type.dart';
import 'package:guitar_tuning_app/tuning_util.dart';
import 'package:flutter/services.dart';
import 'audio_js_interface.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  List<GuitarTuningModel> _tuningModels = TuningUtil.instance.getTuningList();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      title: 'GuitarTuningList',
      home: Scaffold(
        appBar: AppBar(
          title: Text('GuitarTuningList'),
          backgroundColor: HexColor('#3c1c84'),
        ),
        body: Container(
          width: double.infinity,
          child: ListView.builder(
            itemCount: _tuningModels?.length,
            itemBuilder: (context, int _idx) {
              return ListTile(
                leading: CircleAvatar(
                  foregroundImage: AssetImage('images/p_logo.jpg'),
                  radius: 23,
                ),
                title: Text(_tuningModels[_idx]?.tuningName),
                subtitle: Text(_tuningModels[_idx]?.tuningTone),
                tileColor: _idx % 2 == 1 ? TuningUtil.instance.isDarkMode(context) ? HexColor('#4d4d4d') : HexColor('#eeeeee')  : null,
                trailing: SizedBox(
                  child: FloatingActionButton(
                    ///**interface経由でJSFunctionを呼び出し**
                    onPressed: () => playAudio(_tuningModels[_idx]?.audioPathName),
                    backgroundColor: TuningUtil.instance.isDarkMode(context) ? HexColor('#4d4d4d') : Colors.white,
                    child: Icon(TuningUtil.instance.isDarkMode(context) ? Icons.volume_up : Icons.volume_up, color: TuningUtil.instance.isDarkMode(context) ? Colors.white : Colors.grey),
                  ),
                  width: 45,
                  height: 45,
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  ///音声ファイル再生
  ///**Flutterのライブラリは使用できないプラットフォームあり(iPhoneのwebブラウザは再生できない)**
  // void _playAudioJS(String _pathName){
  //   //JSメソッド呼び出し
  //   _controller.evaluateJavascript("playAudio(" + _pathName + ")");
  // }

  ///音声ファイル再生
  ///**Webには対応してないっぽいのでなるべく使用しない**
  // void _playAudio() async{
  //   //assetsから指定しているのはWebの階層がassets/assets/何かしらの音源ファイルのため
  //   int soundId = await rootBundle.load("assets/nostalgia_remix.mp3").then((ByteData soundData) {
  //     return _pool.load(soundData);
  //   });
  //   int streamId = await _pool.play(soundId);
  // }
  
  // Future _loadHtmlFromAssets() async {
  //   String _fileText = await rootBundle.loadString('assets/method.html');
  //   _controller.loadUrl(Uri.dataFromString(
  //     _fileText,
  //     mimeType: 'text/html',
  //     encoding: Encoding.getByName('utf-8')
  //   ).toString());
  // }
}

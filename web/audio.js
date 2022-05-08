function playAudio(audioPath) {
    var audioElement = document.getElementById("audio");    //index.htmlからAudioタグを取得
//    audioElement.pause()                                    //音声停止
    audioElement.src = audioPath;                           //取得したAudioタグに対してパスを設定
    audioElement.play();                                    //再生

    //↓イベント発火時に何度もAudioをインスタンス化してしまうため没
    // tuningAudio = new Audio(audioPath);
    // tuningAudio.play();
}

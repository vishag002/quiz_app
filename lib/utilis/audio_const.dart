/* import 'package:audioplayers/audioplayers.dart';

AudioPlayer _audioPlayer = AudioPlayer();

void playWrongSound() {
  _audioPlayer.play(AssetSource("lib/assets/audio/correct.mp3"));
} */
import 'package:audioplayers/audioplayers.dart';

final AudioPlayer _audioPlayer = AudioPlayer();
Future<void> playCorrectSound() async {
  await _audioPlayer.play(AssetSource('audio/correct.mp3'));
}

Future<void> playInCorrectSound() async {
  await _audioPlayer.play(AssetSource('audio/wrong-answer.mp3'));
}

Future<void> playTimeOutSound() async {
  await _audioPlayer.play(AssetSource('audio/timeup.mp3'));
}

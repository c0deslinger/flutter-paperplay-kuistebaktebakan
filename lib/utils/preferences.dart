import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

getLastScore(String mapel, int level) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  debugPrint("get score $mapel $level");
  return prefs.getInt("score_${mapel}_$level") ?? 0;
}

setLastScore(String mapel, int level, int score) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  debugPrint("set score $mapel $level");
  prefs.setInt("score_${mapel}_$level", score);
}

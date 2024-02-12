import 'package:flutter/material.dart';
import 'package:junglee_poker_pro/learn/model/poker_learn_info_model.dart';
import 'package:junglee_poker_pro/util/util.dart';

class LearnPokerProvider extends ChangeNotifier {
  late PokerLearnInfo pokerLearnInfo;
  bool isNLHESelected = true;
  String selectedVideo = StringConst.video1;
}

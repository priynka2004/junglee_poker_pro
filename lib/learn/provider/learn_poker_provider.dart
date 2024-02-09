import 'package:flutter/material.dart';
import 'package:junglee_poker_pro/learn/model/poker_learn_info_model.dart';
import 'package:junglee_poker_pro/learn/service/learn_poker_service.dart';

class LearnPokerProvider extends ChangeNotifier {
  late PokerLearnInfo pokerLearnInfo;
  List<PokerLearnInfo> pokerLearnInfoList = [];
  LearnPokerService learnPokerService;

  LearnPokerProvider(this.learnPokerService);

  void loadPokerLearnData() {
    pokerLearnInfoList = learnPokerService.fetchLearnPokerData();
    notifyListeners();
  }
}

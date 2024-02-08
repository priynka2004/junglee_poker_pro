import 'package:flutter/material.dart';
import 'package:junglee_poker_pro/learn/model/poker_info_type.dart';
import 'package:junglee_poker_pro/learn/model/poker_learn_info_model.dart';

class LearnPokerProvider extends ChangeNotifier {
  List<PokerLearnInfo> pokerLearnInfoList = [
    PokerLearnInfo(
        title: '',
        description: '',
        pokerInfoType: PokerInfoType.image,
        imageUrl: ''),
    PokerLearnInfo(
        title: '',
        description: '',
        pokerInfoType: PokerInfoType.video,
        videoUrl: ''),
    PokerLearnInfo(
        title: '',
        description: '',
        pokerInfoType: PokerInfoType.image,
        imageUrl: ''),
  ];
}

import 'package:junglee_poker_pro/learn/model/poker_info_type.dart';
import 'package:junglee_poker_pro/learn/model/poker_learn_info_model.dart';
import 'package:junglee_poker_pro/util/util.dart';

class LearnPokerService{
  List<PokerLearnInfo> fetchLearnPokerData(){
    List<PokerLearnInfo> pokerLearnInfoList = [
      PokerLearnInfo(
          title: StringConst.objectiveHeaderText,
          description: StringConst.objectiveText,
          pokerInfoType: PokerInfoType.image,
          imageUrl: ''),
      PokerLearnInfo(
          title:StringConst.pokerHandsHeaderText,
          description: StringConst.objectiveText,
          pokerInfoType: PokerInfoType.video,
          videoUrl: ''),
      PokerLearnInfo(
          title: StringConst.introductionHeaderText,
          description: StringConst.objectiveText,
          pokerInfoType: PokerInfoType.image,
          imageUrl: ''),
      PokerLearnInfo(
          title: StringConst.actionHeaderText,
          description: StringConst.objectiveText,
          pokerInfoType: PokerInfoType.image,
          imageUrl: ''),
      PokerLearnInfo(
          title: StringConst.secretStrategiesHeaderText,
          description: StringConst.objectiveText,
          pokerInfoType: PokerInfoType.image,
          imageUrl: ''),
    ];
    return pokerLearnInfoList;
  }

}
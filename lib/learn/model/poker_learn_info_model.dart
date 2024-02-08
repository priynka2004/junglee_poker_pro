import 'package:junglee_poker_pro/learn/model/poker_info_type.dart';

class PokerLearnInfo {
  String title;
  String description;
  String? imageUrl;
  String? videoUrl;
  PokerInfoType pokerInfoType;

  PokerLearnInfo(
      {required this.title,
      required this.description,
      required this.pokerInfoType,
      this.imageUrl,
      this.videoUrl});
}

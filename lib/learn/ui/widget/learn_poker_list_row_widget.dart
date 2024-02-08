import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:junglee_poker_pro/learn/model/poker_info_type.dart';
import 'package:junglee_poker_pro/learn/model/poker_learn_info_model.dart';

class LearnPokerListRowWidget extends StatelessWidget {
  const LearnPokerListRowWidget({required this.pokerLearnInfo, super.key});

  final PokerLearnInfo pokerLearnInfo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          pokerLearnInfo.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
            color: Colors.black,
          ),
        ),
        const Divider(thickness: 1, color: Colors.black),
        Text(
          pokerLearnInfo.description,
        ),
        const SizedBox(
          height: 20,
        ),
        pokerLearnInfo.pokerInfoType == PokerInfoType.image
            ? getImageWidget(pokerLearnInfo.imageUrl ?? '')
            : getVideoWidget(pokerLearnInfo.videoUrl ?? ''),
      ],
    );
  }

  Widget getImageWidget(String imgUrl) {
    return Container(
      width: 300,
      decoration: BoxDecoration(border: Border.all()),
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 80.0,
        child: CachedNetworkImage(
          imageUrl: imgUrl,
          placeholder: (context, url) {
            return const CircularProgressIndicator();
          },
          errorWidget: (context, url, error) {
            return const Icon(
              Icons.error,
              color: Colors.red,
            );
          },
        ),
      ),
    );
  }

  Widget getVideoWidget(String videoUrl) {
    return SizedBox();
  }
}

import 'package:flutter/material.dart';
import 'package:junglee_poker_pro/util/util.dart';

class VipClubScreen extends StatefulWidget {
  const VipClubScreen({Key? key});

  @override
  State<VipClubScreen> createState() => _VipClubScreenState();
}

class _VipClubScreenState extends State<VipClubScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringConst.vipText,
            style: TextStyle(color: ColorConst.white)),
        backgroundColor: ColorConst.blue,
      ),
      body: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          color: ColorConst.white,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  StringConst.vipText,
                  style: TextStyle(color: ColorConst.blue, fontSize: 20),
                ),
                const Divider(
                  color: ColorConst.blue,
                  thickness: 2,
                ),
                Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    'assets/images/img.png',
                    fit: BoxFit.cover,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 60, top: 6),
                  child: Text(
                    StringConst.vipClubTexts,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 8, left: 16),
                  child: Text(
                    StringConst.vipClubText,
                    textAlign: TextAlign.center,
                  ),
                ),
                Row(
                  children: [
                    buildGameDetails(),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 60),
                  child: Text(
                    StringConst.actionText,
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 120),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(ColorConst.blue),
                      textStyle: MaterialStateProperty.all<TextStyle>(
                        const TextStyle(color: ColorConst.white),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      StringConst.optText,
                      style: TextStyle(color: ColorConst.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildGameDetails() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildDetailRow(
            Icons.emoji_events_rounded,
            StringConst.bigWinsText,
            StringConst.rewardText,
          ),
          const SizedBox(
            height: 16,
          ),
          buildDetailRow(
            Icons.star,
            StringConst.thrillText,
            StringConst.playText,
          ),
          const SizedBox(
            height: 16,
          ),
          buildDetailRow(
            Icons.featured_play_list_sharp,
            StringConst.yourCall,
            StringConst.variantsText,
          ),
          const SizedBox(
            height: 16,
          ),
          buildDetailRow(
            Icons.king_bed,
            StringConst.kingText,
            StringConst.rankText,
          ),
        ],
      ),
    );
  }

  Widget buildDetailRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(
          icon,
          size: 35.0,
          color: ColorConst.blue,
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: ColorConst.blue,
                )),
            Text(value),
          ],
        ),
      ],
    );
  }
}


// ListView.builder(
//   shrinkWrap: true,
//   physics: const NeverScrollableScrollPhysics(),
//   itemCount: provider.pokerLearnInfoList.length,
//   itemBuilder: (context, index) {
//     PokerLearnInfo pokerLearnInfo = provider.pokerLearnInfoList[index];
//     print(pokerLearnInfo.title);
//     print(" ${pokerLearnInfo.description}");
//     print(" ${pokerLearnInfo.imageUrl}");
//
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           pokerLearnInfo.title,
//           style: const TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 16.0,
//             color: ColorConst.black,
//           ),
//         ),
//         const Divider(),
//         Text(
//           pokerLearnInfo.description,
//           style: const TextStyle(
//             color: ColorConst.black,
//           ),
//         ),
//         const SizedBox(height: 10),
//         if (pokerLearnInfo.imageUrl != null)
//           Container(
//             height: 200,
//             color: Colors.grey,
//             child: Image.asset(
//               pokerLearnInfo.imageUrl!,
//               fit: BoxFit.cover,
//             ),
//           ),
//         const SizedBox(height: 16),
//       ],
//     );
//   },
// ),

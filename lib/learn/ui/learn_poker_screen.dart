import 'package:flutter/material.dart';
import 'package:junglee_poker_pro/learn/model/poker_learn_info_model.dart';
import 'package:junglee_poker_pro/learn/provider/learn_poker_provider.dart';
import 'package:junglee_poker_pro/learn/ui/widget/learn_poker_detail_widget.dart';
import 'package:junglee_poker_pro/util/util.dart';
import 'package:provider/provider.dart';

class LearnPokerScreen extends StatefulWidget {
  const LearnPokerScreen({Key? key}) : super(key: key);

  @override
  State<LearnPokerScreen> createState() => _LearnPokerScreenState();
}

class _LearnPokerScreenState extends State<LearnPokerScreen> {
  bool isNLHESelected = true;
  late PokerLearnInfo pokerLearnInfo;
  String selectedVideo = StringConst.video1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringConst.appBarText),
        backgroundColor: ColorConst.indigoAccent,
      ),
      body: SingleChildScrollView(
        child: Consumer<LearnPokerProvider>(
          builder: (context, provider, child) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 200,
                    color: Colors.grey,
                    child: Image.asset(
                      'assets/images/img.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Divider(),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildGameTypeButtons(),
                      const SizedBox(width: 20),
                    ],
                  ),
                  const Divider(),
                  buildGameDetails(),
                  const SizedBox(height: 20),
                  const Text(
                    StringConst.watchAndLearnHeaderText,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      color: ColorConst.black,
                    ),
                  ),
                  const Divider(thickness: 1, color: ColorConst.black),
                  Container(
                      height: 200,
                      color: Colors.grey,
                      child: Image.asset(
                        'assets/images/img.png',
                        fit: BoxFit.cover,
                      )),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        StringConst.watchMoreText,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      DropdownButton<String>(
                        value: selectedVideo,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedVideo = newValue!;
                          });
                        },
                        items: <String>[
                          StringConst.video1,
                          StringConst.video2,
                          StringConst.video3,
                          StringConst.video4,
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),


                  const LearnPokerDetailWidget(
                    title: StringConst.objectiveHeaderText,
                    description: StringConst.objectiveText,
                    imageUrl: 'assets/images/img.png',
                  ),
                  const LearnPokerDetailWidget(
                    title: StringConst.pokerHandsHeaderText,
                    description: StringConst.objectiveText,
                    imageUrl: 'assets/images/img.png',
                  ),
                  const LearnPokerDetailWidget(
                    title: StringConst.introductionHeaderText,
                    description: StringConst.objectiveText,
                    imageUrl: 'assets/images/img.png',
                  ),
                  const LearnPokerDetailWidget(
                    title: StringConst.actionHeaderText,
                    description: StringConst.objectiveText,
                    imageUrl: 'assets/images/img.png',
                  ),
                  const LearnPokerDetailWidget(
                    title: StringConst.secretStrategiesHeaderText,
                    description: StringConst.objectiveText,
                    imageUrl: 'assets/images/img.png',
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }



  Widget buildGameTypeButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildGameTypeButton(StringConst.nlheButtonText, isNLHESelected),
        const SizedBox(width: 20),
        buildGameTypeButton(StringConst.ploButtonText, !isNLHESelected),
      ],
    );
  }

  Widget buildGameTypeButton(String text, bool isSelected) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          isNLHESelected = !isNLHESelected;
        });
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2),
        ),
        backgroundColor: isSelected ? Colors.white : ColorConst.primaryColor,
      ),
      child: Text(
        text,
        style: const TextStyle(color: ColorConst.textColor),
      ),
    );
  }

  Widget buildGameDetails() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildDetailRow(Icons.play_lesson_sharp, StringConst.holeCardText,
              StringConst.noText),
          const SizedBox(
            height: 16,
          ),
          buildDetailRow(Icons.calendar_view_week_rounded,
              StringConst.communityCardText, StringConst.noCardText),
          const SizedBox(
            height: 16,
          ),
          buildDetailRow(Icons.radar_outlined, StringConst.wagerLimitText,
              StringConst.nOLimitText),
          const SizedBox(
            height: 16,
          ),
          buildDetailRow(Icons.back_hand, StringConst.handFormationText,
              StringConst.holeCardsText),
        ],
      ),
    );
  }

  Widget buildDetailRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Container(
          
          decoration: BoxDecoration(
           border: Border.all(color: Colors.blue),
            shape: BoxShape.circle
          ),
          child: Icon(
            icon,
            size: 25.0,
            color: Colors.blue,
          ),
        ),
        const SizedBox(width: 10),
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(value),
      ],
    );
  }
}

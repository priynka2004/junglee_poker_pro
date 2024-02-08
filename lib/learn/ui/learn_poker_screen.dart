import 'package:flutter/material.dart';
import 'package:junglee_poker_pro/learn/provider/learn_poker_provider.dart';
import 'package:junglee_poker_pro/learn/ui/widget/learn_poker_list_row_widget.dart';
import 'package:junglee_poker_pro/util/color_const.dart';
import 'package:junglee_poker_pro/util/string_const.dart';
import 'package:provider/provider.dart';

class LearnPokerScreen extends StatefulWidget {
  const LearnPokerScreen({Key? key}) : super(key: key);

  @override
  State<LearnPokerScreen> createState() => _LearnPokerScreenState();
}

class _LearnPokerScreenState extends State<LearnPokerScreen> {
  bool isNLHESelected = true;
  String selectedVideo = StringConst.video1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LEARN POKER'),
        backgroundColor: Colors.indigoAccent,
      ),
      body: SingleChildScrollView(
        child: Consumer<LearnPokerProvider>(
          builder: (context, provider, child) {
            return Column(
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 80.0,
                  child: Icon(
                    Icons.image_not_supported_outlined,
                    size: 120.0,
                    color: Colors.indigoAccent,
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
                  'WATCH AND LEARN HOW TO PLAY POKER',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                ),
                const Divider(thickness: 1, color: Colors.black),
                const CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 80.0,
                  child: Icon(
                    Icons.video_collection_sharp,
                    size: 120.0,
                    color: Colors.indigoAccent,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Watch more video tutorials: ',
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
                        'Video 1',
                        'Video 2',
                        'Video 3',
                        'Video 4'
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
                ListView.builder(
                    itemCount: provider.pokerLearnInfoList.length,
                    itemBuilder: (context, index) {
                      return LearnPokerListRowWidget(
                        pokerLearnInfo: provider.pokerLearnInfoList[index],
                      );
                    })
              ],
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
          buildDetailRow(Icons.credit_card, 'Hole Cards:', ' 2'),
          buildDetailRow(Icons.confirmation_num, 'Community Cards:', ' 5'),
          buildDetailRow(Icons.card_membership, 'Wager Limit:', ' NO Limit'),
          buildDetailRow(Icons.credit_card, 'Hand Formation:',
              ' 1 or 2 Hole Cards + 4 or 3\n Community Cards'),
        ],
      ),
    );
  }

  Widget buildDetailRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 40.0, color: ColorConst.primaryColor),
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(value),
      ],
    );
  }
}

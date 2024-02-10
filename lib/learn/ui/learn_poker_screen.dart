import 'package:flutter/material.dart';
import 'package:junglee_poker_pro/learn/provider/learn_poker_provider.dart';
import 'package:junglee_poker_pro/learn/ui/widget/learn_poker_detail_widget.dart';
import 'package:junglee_poker_pro/util/util.dart';
import 'package:provider/provider.dart';

class LearnPokerScreen extends StatefulWidget {
  const LearnPokerScreen({Key? key}) : super(key: key);

  @override
  State<LearnPokerScreen> createState() => _LearnPokerScreenState();
}

class _LearnPokerScreenState extends State<LearnPokerScreen>
    with SingleTickerProviderStateMixin {
  late LearnPokerProvider learnPokerProvider;
  late TabController _tabController;

  void updateSelectedTabText() {
    setState(() {
      if (_tabController.index == 0) {
        learnPokerProvider.isNLHESelected = true;
      } else {
        learnPokerProvider.isNLHESelected = false;
      }
    });
  }

  @override
  void initState() {
    learnPokerProvider =
        Provider.of<LearnPokerProvider>(context, listen: false);
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          StringConst.appBarText,
          style: TextStyle(color: ColorConst.white),
        ),
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
                  Container(
                    padding: const EdgeInsets.only(top: 4),
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        color: Colors
                            .blue), // You can adjust this value according to your needs
                    child: TabBar(
                      controller: _tabController,
                      // // Enable scrolling for tabs
                      labelPadding: EdgeInsets.zero,
                      // Remove default padding
                      tabs: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width /
                              2.2, // Set width to half of screen
                          child: const Tab(
                            text: StringConst.nlheButtonText,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width /
                              2.2, // Set width to half of screen
                          child: const Tab(
                            text: StringConst.ploButtonText,
                          ),
                        ),
                      ],
                      labelColor: ColorConst.indigoAccent,
                      unselectedLabelColor: ColorConst.white,
                      indicator: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(12.0),
                        ),
                      ),
                      labelStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      unselectedLabelStyle: const TextStyle(fontSize: 16),
                      onTap: (index) {
                        _tabController.animateTo(index);
                        updateSelectedTabText();
                      },
                    ),
                  ),
                  buildGameDetails(),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        StringConst.watchMoreText,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      DropdownButton<String>(
                        value: learnPokerProvider.selectedVideo,
                        onChanged: (String? newValue) {
                          setState(() {
                            learnPokerProvider.selectedVideo = newValue!;
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

  Widget buildGameDetails() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildDetailRow(
              Icons.play_lesson_sharp,
              StringConst.holeCardText,
              learnPokerProvider.isNLHESelected
                  ? StringConst.noText
                  : StringConst.holeCardsText1),
          const SizedBox(
            height: 16,
          ),
          buildDetailRow(
              Icons.calendar_view_week_rounded,
              StringConst.communityCardText,
              learnPokerProvider.isNLHESelected
                  ? StringConst.noCardText
                  : StringConst.noCardText),
          const SizedBox(
            height: 16,
          ),
          buildDetailRow(
              Icons.radar_outlined,
              StringConst.wagerLimitText,
              learnPokerProvider.isNLHESelected
                  ? StringConst.nOLimitText
                  : StringConst.nOLimitText1),
          const SizedBox(
            height: 16,
          ),
          buildDetailRow(
              Icons.back_hand,
              StringConst.handFormationText,
              learnPokerProvider.isNLHESelected
                  ? StringConst.holeCardsText
                  : StringConst.handFormationText2),
        ],
      ),
    );
  }

  Widget buildDetailRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.blue), shape: BoxShape.circle),
          child: Icon(
            icon,
            size: 25.0,
            color: Colors.blue,
          ),
        ),
        const SizedBox(width: 10),
        RichText(
          text: TextSpan(
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
            children: [
              TextSpan(
                text: label,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const TextSpan(text: ": "),
              TextSpan(text: value),
            ],
          ),
        )
      ],
    );
  }
}

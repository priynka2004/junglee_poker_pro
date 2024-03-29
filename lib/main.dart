import 'package:flutter/material.dart';
import 'package:junglee_poker_pro/learn/provider/learn_poker_provider.dart';
import 'package:junglee_poker_pro/learn/ui/vip_club_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context){
          return LearnPokerProvider();
        })
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const VipClubScreen(),
      ),
    );
  }
}


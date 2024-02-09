import 'package:flutter/material.dart';

class LearnPokerDetailWidget extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;

  const LearnPokerDetailWidget({
    Key? key,
    required this.title,
    required this.description,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
            color: Colors.black,
          ),
        ),
        const Divider(),
        Text(
          description,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          height: 200,
          color: Colors.grey,
          child: Image.asset(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 16),
        const Divider(),
      ],
    );
  }

}


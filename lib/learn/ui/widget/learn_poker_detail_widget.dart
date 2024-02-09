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
    return GestureDetector(
      onTap: () {
        _showDialog(context);
      },
      child: Column(
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
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            title,
            style: const TextStyle(fontSize: 20),
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 250,
                child: Image.asset(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10),
              Text(description),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                "close",
                textAlign: TextAlign.center,
              ),
            ),
          ],
        );
      },
    );
  }
}

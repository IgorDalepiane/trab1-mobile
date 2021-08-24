import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    required this.logoPath,
    required this.title,
    required this.subTitle,
    required this.description,
    required this.recipePage,
  }) : super(key: key);

  final String logoPath;
  final String title;
  final String subTitle;
  final String description;
  final String recipePage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            ListTile(
              leading: Image.asset(logoPath),
              title: Text(title),
              subtitle: Text(
                subTitle,
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                description,
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () {
                    // Perform some action
                  },
                  child: const Text('VER RECEITA'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomCardNoDesc extends StatelessWidget {
  const CustomCardNoDesc({
    Key? key,
    required this.logoPath,
    required this.title,
    required this.subTitle,
    required this.recipePage,
  }) : super(key: key);

  final String logoPath;
  final String title;
  final String subTitle;
  final String recipePage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            ListTile(
              trailing: TextButton(
                onPressed: () {
                  // Perform some action
                },
                child: const Text('VER RECEITA'),
              ),
              title: Text(title),
              subtitle: Text(
                subTitle,
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

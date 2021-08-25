import 'package:flutter/material.dart';
import 'package:trab1_mobile/screens/cacetinho_screen.dart';

class CustomCardNoDesc extends StatelessWidget {
  const CustomCardNoDesc({
    Key? key,
    required this.logoPath,
    required this.title,
    required this.subTitle,
    required this.recipePage,
    required this.id,
    required this.username,
  }) : super(key: key);

  final String logoPath;
  final String title;
  final String subTitle;
  final String recipePage;
  final int id;
  final String username;

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
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CacetinhoScreen(id: id, username: username),
                      ),
                    );
                  },
                  child: Text('VER RECEITA'),
                ),
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

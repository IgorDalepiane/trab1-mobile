import 'package:flutter/material.dart';

import 'package:trab1_mobile/widgets/bottom_nav_bar.dart';
import 'package:trab1_mobile/widgets/custom_appbar.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({
    Key? key,
    required this.username,
  }) : super(key: key);
  final String username;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(username: username),
      bottomNavigationBar: BottomNavBar(selectedIndex: 2, username: username),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  "assets/images/livro.jpg",
                  fit: BoxFit.cover,
                  width: 1000,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Sobre",
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Este aplicativo é voltado para aqueles que estão buscando uma aventura na cozinha, mas não sabem por onde começar, disponibilizamos diversas receitas desde classicas até as mais extraordinárias. Então agora é com você, mão na massa!",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                "Igor Dalepiane, Lucas Fell",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

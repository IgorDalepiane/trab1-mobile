import 'package:flutter/material.dart';

import 'package:trab1_mobile/widgets/bottom_nav_bar.dart';
import 'package:trab1_mobile/widgets/custom_appbar.dart';
import 'package:trab1_mobile/widgets/custom_card_nodesc.dart';

class RecipeScreen extends StatelessWidget {
  const RecipeScreen({
    Key? key,
    required this.username,
  }) : super(key: key);
  final String username;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(username: username),
      bottomNavigationBar: BottomNavBar(selectedIndex: 1, username: username),
      body: SingleChildScrollView(
        child: Column(
          children: new List.generate(
            10,
            (index) => new CustomCardNoDesc(
                logoPath: 'assets/images/cacetinho.png',
                title: 'Cacetinho no Balaio',
                subTitle: 'Delícia tradicional',
                recipePage: 'cacetinho',
                id: 1,
                username: username),
          ),
        ),
      ),
    );
  }
}

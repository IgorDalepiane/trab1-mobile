import 'package:flutter/material.dart';
import 'package:trab1_mobile/screens/about_screen.dart';
import 'package:trab1_mobile/screens/home_screen.dart';
import 'package:trab1_mobile/screens/recipe_screen.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({required this.selectedIndex});
  final int selectedIndex;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 5.0,
            color: Colors.black,
          ),
        ],
      ),
      child: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'HOME',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lunch_dining_outlined),
            label: 'RECEITAS',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article_outlined),
            label: 'SOBRE',
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Color(0xffb8b861),
        onTap: (index) {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => index == 0
                    ? HomeScreen()
                    : index == 1
                        ? RecipeScreen()
                        : AboutScreen()),
          );
        },
      ),
    );
  }
}

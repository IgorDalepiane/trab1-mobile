import 'package:flutter/material.dart';
import 'package:trab1_mobile/widgets/bottom_nav_bar.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffffffca),
        toolbarHeight: 160,
        bottom: PreferredSize(
          child: Container(
            color: Colors.black,
            height: 2.0,
          ),
          preferredSize: Size.fromHeight(4.0),
        ),
        title: Text(
          'Receitas Delit',
          style: TextStyle(
            color: Colors.black,
            fontFamily: "Righteous",
            fontSize: 40,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(selectedIndex: 2),
    );
  }
}

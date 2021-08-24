import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
    );
  }

  @override
  Size get preferredSize => Size(100, 100);
}

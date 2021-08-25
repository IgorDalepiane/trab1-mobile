import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    required this.username,
  }) : super(key: key);
  final String username;

  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(100);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xffffffca),
      toolbarHeight: widget.preferredSize.height,
      centerTitle: true,
      bottom: PreferredSize(
        child: Container(
          color: Colors.black,
          height: 2.0,
        ),
        preferredSize: Size.fromHeight(4.0),
      ),
      title: Text(
        "Bem vindo, ${widget.username}\nReceitas Delit",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontFamily: "Righteous",
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

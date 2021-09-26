import 'package:flutter/material.dart';
import 'package:trab1_mobile/screens/comments_screen.dart';

import 'package:trab1_mobile/widgets/bottom_nav_bar.dart';
import 'package:trab1_mobile/widgets/custom_appbar.dart';

class CacetinhoScreen extends StatelessWidget {
  const CacetinhoScreen({
    Key? key,
    required this.id,
    required this.username,
  }) : super(key: key);
  final int id;
  final String username;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(username: username),
      bottomNavigationBar: BottomNavBar(selectedIndex: 1, username: username),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                'Cacetinho no Balaio',
                style: TextStyle(fontSize: 24),
              ),
            ),
            Image.asset('assets/images/cacetinho.png'),
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Text('Ingredientes'),
            ),
            ListTile(
              leading: Text('*'),
              title: Text(
                '15 colheres de azeite',
                style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
              ),
            ),
            ListTile(
              leading: Text('*'),
              title: Text(
                '3 sachês de fermento biológico',
                style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
              ),
            ),
            ListTile(
              leading: Text('*'),
              title: Text(
                '3 copos de água',
                style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
              ),
            ),
            ListTile(
              leading: Text('*'),
              title: Text(
                '1 colher de sopa de sal',
                style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
              ),
            ),
            ListTile(
              leading: Text('*'),
              title: Text(
                '2 colheres de sopa de açúcar',
                style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
              ),
            ),
            ListTile(
              leading: Text('*'),
              title: Text(
                'Farinha de trigo',
                style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Text('Modo de Preparo'),
            ),
            ListTile(
              leading: Text('1.'),
              title: Text(
                'Misture todos os ingredientes, mexa bem e vá acrescentando a farinha de trigo até a massa soltar das mãos.',
                style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
              ),
            ),
            ListTile(
              leading: Text('2.'),
              title: Text(
                'Misture todos os ingredientes, mexa bem e vá acrescentando a farinha de trigo até a massa soltar das mãos.',
                style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
              ),
            ),
            ListTile(
              leading: Text('3.'),
              title: Text(
                'Após modele a massa do seu jeito e asse em forno de 200ºC em 45 minutos.',
                style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            MaterialButton(
              child: Text('VER COMENTÁRIOS'),
              color: Color(0xffffffca),
              focusColor: Color(0xffffffca),
              splashColor: Color(0xffededbb),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        CommentsScreen(username: username, postId: 1),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

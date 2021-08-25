import 'package:flutter/material.dart';
import 'package:trab1_mobile/widgets/bottom_nav_bar.dart';

import 'package:trab1_mobile/widgets/custom_appbar.dart';

class CacetinhoScreen extends StatelessWidget {
  const CacetinhoScreen({
    Key? key,
    required this.id,
  }) : super(key: key);
  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(username: 'Lucas'),
      bottomNavigationBar: BottomNavBar(selectedIndex: 1),
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
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade700)),
            ),
            ListTile(
              leading: Text('3.'),
              title: Text(
                  'Após modele a massa do seu jeito e asse em forno de 200ºC em 45 minutos.',
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade700)),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}

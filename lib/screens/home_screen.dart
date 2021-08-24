import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:trab1_mobile/widgets/bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  final List<String> imgList = [
    'assets/images/receita1.jpg',
    'assets/images/receita3.jpg',
    'assets/images/receita4.jpg',
    'assets/images/receita5.jpg',
  ];

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
      bottomNavigationBar: BottomNavBar(selectedIndex: 0),
      backgroundColor: Color(0xfff7f7e3),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(
                top: 10.0,
                bottom: 30.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: CarouselSlider(
                      options: CarouselOptions(
                        autoPlay: true,
                        aspectRatio: 2.0,
                        enlargeCenterPage: true,
                      ),
                      items: imgList
                          .map(
                            (item) => Container(
                              child: Center(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset(
                                    item,
                                    fit: BoxFit.cover,
                                    width: 1000,
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                        child: Card(
                          clipBehavior: Clip.antiAlias,
                          child: Column(
                            children: [
                              ListTile(
                                leading: Image.asset('assets/images/cacetinho.png'),
                                title: const Text('Cacetinho no Balaio'),
                                subtitle: Text(
                                  'Delícia tradicional',
                                  style: TextStyle(color: Colors.black.withOpacity(0.6)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  'No Rio de Janeiro, conta-se que o primeiro gaúcho a pedir um Cacetinho foi enrabado por 5 padeiros ao mesmo tempo. Desde então, todo gaúcho, ao viajar para o Rio, ganha um folheto explicativo sobre como chamar pão francês fora de sua terra colorida.',
                                  style: TextStyle(color: Colors.black.withOpacity(0.6)),
                                ),
                              ),
                              ButtonBar(
                                alignment: MainAxisAlignment.start,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      // Perform some action
                                    },
                                    child: const Text('VER RECEITA'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                        child: Card(
                          clipBehavior: Clip.antiAlias,
                          child: Column(
                            children: [
                              ListTile(
                                leading: Image.asset('assets/images/ovofrito.png'),
                                title: const Text('Pão com Ovo'),
                                subtitle: Text(
                                  'Delícia tradicional',
                                  style: TextStyle(color: Colors.black.withOpacity(0.6)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  'Tão importante quanto o sanduíche de presunto e o sanduíche-íche, o sanduba de ovo foi criado pela Dona Florinda em 1954 e até hoje é o mais vendido sanduíche do mundo. Tendo inclusive o Godinez desenhado a versão mais famosa do sanduíche-íche para o Professor Girafales.',
                                  style: TextStyle(color: Colors.black.withOpacity(0.6)),
                                ),
                              ),
                              ButtonBar(
                                alignment: MainAxisAlignment.start,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      // Perform some action
                                    },
                                    child: const Text('VER RECEITA'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

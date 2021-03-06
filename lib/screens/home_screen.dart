import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:trab1_mobile/screens/cacetinho_screen.dart';
import 'package:trab1_mobile/widgets/bottom_nav_bar.dart';
import 'package:trab1_mobile/widgets/custom_appbar.dart';
import 'package:trab1_mobile/widgets/custom_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.username}) : super(key: key);
  final String username;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> imgList = [
    'assets/images/receita1.jpg',
    'assets/images/receita3.jpg',
    'assets/images/receita4.jpg',
    'assets/images/receita5.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(username: widget.username),
      bottomNavigationBar: BottomNavBar(selectedIndex: 0, username: widget.username),
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
                            (item) => GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CacetinhoScreen(id: 1, username: widget.username),
                                  ),
                                );
                              },
                              child: Container(
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
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24),
                    child: Column(
                      children: [
                        CustomCard(
                          description:
                              'No Rio de Janeiro, conta-se que o primeiro ga??cho a pedir um Cacetinho foi enrabado por 5 padeiros ao mesmo tempo. Desde ent??o, todo ga??cho, ao viajar para o Rio, ganha um folheto explicativo sobre como chamar p??o franc??s fora de sua terra colorida.',
                          logoPath: 'assets/images/cacetinho.png',
                          title: 'Cacetinho no Balaio',
                          subTitle: 'Del??cia tradicional',
                          recipePage: 'adwad',
                          id: 1,
                          username: widget.username,
                        ),
                        CustomCard(
                          description:
                              'T??o importante quanto o sandu??che de presunto e o sandu??che-??che, o sanduba de ovo foi criado pela Dona Florinda em 1954 e at?? hoje ?? o mais vendido sandu??che do mundo. Tendo inclusive o Godinez desenhado a vers??o mais famosa do sandu??che-??che para o Professor Girafales.',
                          logoPath: 'assets/images/ovofrito.png',
                          title: 'P??o com Ovo',
                          subTitle: 'Del??cia tradicional',
                          recipePage: 'adwad',
                          id: 1,
                          username: widget.username,
                        ),
                      ],
                    ),
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

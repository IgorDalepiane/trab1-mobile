import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:trab1_mobile/widgets/custom_appbar.dart';

class DonatorsPhotosScreen extends StatefulWidget {
  final String username;
  final int userId;

  const DonatorsPhotosScreen({
    Key? key,
    required this.username,
    required this.userId,
  }) : super(key: key);

  @override
  State<DonatorsPhotosScreen> createState() => _DonatorsPhotosScreenState();
}

class _DonatorsPhotosScreenState extends State<DonatorsPhotosScreen> {
  late Future<dynamic> donatorsPhotos;

  @override
  void initState() {
    donatorsPhotos = loadDonatorsPhotos();
    super.initState();
  }

  Future<dynamic> loadDonatorsPhotos() async {
    final url = Uri.parse(
      'https://jsonplaceholder.typicode.com/albums/${widget.userId}/photos',
    );
    final response = await http.get(url);
    print(response);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(username: widget.username),
      backgroundColor: Color(0xfff7f7e3),
      body: Center(
        child: SingleChildScrollView(
          child: FutureBuilder<dynamic>(
            future:
                donatorsPhotos, // a previously-obtained Future<String> or null
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              List<Widget> children;
              if (snapshot.hasData) {
                List<dynamic> donatorsPhotos = snapshot.data;
                children = <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: const Text(
                      'Fotos do doador',
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                  ...donatorsPhotos
                      .map(
                        (donatorPhoto) => Card(
                          clipBehavior: Clip.antiAlias,
                          child: Column(
                            children: [
                              ListTile(
                                title: Text(donatorPhoto['title']),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Image.network(
                                  donatorPhoto['url'],
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                  loadingBuilder: (BuildContext context,
                                      Widget child,
                                      ImageChunkEvent? loadingProgress) {
                                    if (loadingProgress == null) {
                                      return child;
                                    }
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList()
                ];
              } else if (snapshot.hasError) {
                children = <Widget>[
                  const Icon(
                    Icons.error_outline,
                    color: Colors.red,
                    size: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text('Erro: ${snapshot.error}'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text('Stack trace: ${snapshot.stackTrace}'),
                  ),
                ];
              } else {
                children = const <Widget>[
                  SizedBox(
                    child: CircularProgressIndicator(),
                    width: 60,
                    height: 60,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Text('Recuperando dados...'),
                  )
                ];
              }
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: children,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

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
  late Future<dynamic> donatorsPhotosFuture;
  late Stream<dynamic> donatorsPhotosStream;
  bool _isFutureLoading = true;

  Future<dynamic> loadDonatorsPhotosFuture() async {
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
    Stream<dynamic> loadDonatorsPhotosStream = (() async* {
      final url = Uri.parse(
        'https://jsonplaceholder.typicode.com/albums/${widget.userId}/photos',
      );
      final response = await http.get(url);
      print(response);
      if (response.statusCode == 200) {
        yield json.decode(response.body);
      } else {
        yield null;
      }
    })();

    donatorsPhotosFuture = loadDonatorsPhotosFuture();
    donatorsPhotosStream = loadDonatorsPhotosStream.asBroadcastStream();

    var builder = (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
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
                          loadingBuilder: (BuildContext context, Widget child,
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
        children = <Widget>[
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
    };

    return Scaffold(
      appBar: CustomAppBar(username: widget.username),
      backgroundColor: Color(0xfff7f7e3),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MaterialButton(
                        child: Text(
                          'USAR FUTURES',
                          style: TextStyle(
                              color: _isFutureLoading
                                  ? Colors.white
                                  : Colors.black),
                        ),
                        color: _isFutureLoading
                            ? Colors.blue.shade800
                            : Color(0xffffffca),
                        focusColor: Color(0xffffffca),
                        splashColor: Color(0xffededbb),
                        onPressed: () {
                          setState(() {
                            _isFutureLoading = true;
                          });
                        },
                      ),
                      MaterialButton(
                        child: Text(
                          'USAR STREAMS',
                          style: TextStyle(
                              color: _isFutureLoading
                                  ? Colors.black
                                  : Colors.white),
                        ),
                        color: _isFutureLoading
                            ? Color(0xffffffca)
                            : Colors.blue.shade800,
                        focusColor: Color(0xffffffca),
                        splashColor: Color(0xffededbb),
                        onPressed: () {
                          setState(() {
                            _isFutureLoading = false;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: _isFutureLoading
                  ? FutureBuilder<dynamic>(
                      future:
                          donatorsPhotosFuture, // a previously-obtained Future<String> or null
                      builder: builder,
                    )
                  : StreamBuilder<dynamic>(
                      stream:
                          donatorsPhotosStream, // a previously-obtained Future<String> or null
                      builder: builder,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

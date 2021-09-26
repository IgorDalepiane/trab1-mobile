import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:trab1_mobile/widgets/custom_appbar.dart';

class CommentsScreen extends StatefulWidget {
  final String username;
  final int postId;

  const CommentsScreen({
    Key? key,
    required this.username,
    required this.postId,
  }) : super(key: key);

  @override
  _CommentsScreenState createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  final Stream<dynamic> _comments = (() async* {
    final url = Uri.parse(
      'https://jsonplaceholder.typicode.com/posts/1/comments',
    );
    final response = await http.get(url);
    print(response);
    if (response.statusCode == 200) {
      yield json.decode(response.body);
    } else {
      yield null;
    }
  })();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(username: widget.username),
      backgroundColor: Color(0xfff7f7e3),
      body: Center(
        child: SingleChildScrollView(
          child: StreamBuilder<dynamic>(
            stream: _comments,
            builder: (BuildContext context, AsyncSnapshot<dynamic> snap) {
              List<Widget> children;
              if (snap.hasError) {
                children = <Widget>[
                  const Icon(
                    Icons.error_outline,
                    color: Colors.red,
                    size: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text('Erro: ${snap.error}'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text('Stack trace: ${snap.stackTrace}'),
                  ),
                ];
              } else {
                switch (snap.connectionState) {
                  case ConnectionState.none:
                    children = const <Widget>[
                      Icon(
                        Icons.info,
                        color: Colors.blue,
                        size: 60,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 16),
                        child: Text('Selecione o post'),
                      )
                    ];
                    break;
                  case ConnectionState.active:
                  case ConnectionState.waiting:
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
                    break;
                  case ConnectionState.done:
                    List<dynamic> posts = snap.data;
                    children = <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: const Text(
                          'Comentários de usuários',
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                      ...posts
                          .map(
                            (post) => Card(
                              clipBehavior: Clip.antiAlias,
                              child: Column(
                                children: [
                                  ListTile(
                                    leading: Icon(
                                      Icons.person,
                                      size: 48,
                                    ),
                                    title: Text(post['name']),
                                    subtitle: Text(
                                      post['email'],
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.6)),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(
                                      post['body'],
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.6)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                          .toList()
                    ];
                    break;
                }
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: children,
              );
            },
          ),
        ),
      ),
    );
  }
}

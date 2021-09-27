import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:trab1_mobile/widgets/custom_appbar.dart';

class DonatorsScreen extends StatefulWidget {
  final String username;

  const DonatorsScreen({
    Key? key,
    required this.username,
  }) : super(key: key);

  @override
  State<DonatorsScreen> createState() => _DonatorsScreenState();
}

class _DonatorsScreenState extends State<DonatorsScreen> {
  late Future<dynamic> donators;

  @override
  void initState() {
    donators = loadDonators();
    super.initState();
  }

  Future<dynamic> loadDonators() async {
    final url = Uri.parse(
      'https://jsonplaceholder.typicode.com/users',
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
            future: donators, // a previously-obtained Future<String> or null
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              List<Widget> children;
              if (snapshot.hasData) {
                List<dynamic> donators = snapshot.data;
                children = <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: const Text(
                      'Doadores',
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                  ...donators
                      .map(
                        (donator) => Card(
                          clipBehavior: Clip.antiAlias,
                          child: Column(
                            children: [
                              ListTile(
                                leading: Icon(
                                  Icons.person,
                                  size: 48,
                                ),
                                title: Text(donator['name']),
                                subtitle: Text(
                                  donator['email'],
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.6)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  donator['phone'],
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

import 'package:flutter/material.dart';
import 'package:trab1_mobile/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String typedName = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Bem-vindo $typedName",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Informe seu nome",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Digite seu nome',
                ),
                onChanged: (value) {
                  setState(() {
                    typedName = value;
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(
                        username: typedName != "" ? typedName : "Usuário",
                      ),
                    ),
                  );
                },
                child: Text('Entrar'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

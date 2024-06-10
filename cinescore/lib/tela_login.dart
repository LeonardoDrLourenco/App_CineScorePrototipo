import 'package:cinescore/cadastrar.dart';
import 'package:flutter/material.dart';
import 'package:cinescore/background_image.dart';
import 'package:cinescore/logo_widget.dart';
import 'package:cinescore/tela_inicial.dart';

class TelaLogin extends StatefulWidget {
  @override
  _TelaLoginState createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late final String userName;
  late final String userPassword;

  bool _isValid = true;

  void _login() {

    String enteredUsername = 'leo';
    String enteredPassword = 'senhaleo';

    if (enteredUsername == _usernameController.text && enteredPassword == _passwordController.text) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TelaInicial(username: enteredUsername),
        ),
      );
    } else {
      setState(() {
        _isValid = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroundImage(
            child: Container(),
          ),
          Column(
            children: <Widget>[
              Spacer(flex: 2),
              Padding(
                padding: EdgeInsets.only(bottom: 20.0),
                child: LogoWidget(),
              ),
              Text(
                'CineScore',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 230, 17, 17),
                ),
              ),
              Spacer(flex: 1),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 250,
                      child: TextField(
                        controller: _usernameController,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Usuário',
                          hintStyle: TextStyle(
                            color: Colors.white.withOpacity(0.3),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: 250,
                      child: TextField(
                        controller: _passwordController,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Senha',
                          hintStyle: TextStyle(
                            color: Colors.white.withOpacity(0.3),
                          ),
                        ),
                        obscureText: true,
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _login,
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromARGB(255, 238, 227, 128)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.red, width: 2.0),
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 14),
                        child: Text(
                          'Login',
                          style: TextStyle(fontSize: 16, color: Colors.red),
                        ),
                      ),
                    ),
                    if (!_isValid)
                      Text(
                        'Usuário ou senha inválidos',
                        style: TextStyle(color: Colors.red),
                      ),
                    SizedBox(height: 10),
                    ElevatedButton(
                        onPressed: () {Navigator.push(
                          context, 
                          MaterialPageRoute(builder: (context) => TelaCadastrar()
                          )
                        );
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromARGB(255, 238, 227, 128)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.red, width: 2.0),
                            ),
                          ),
                        ),
                          child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 14),
                          child: Text(
                            'Cadastrar',
                            style: TextStyle(fontSize: 16, color: Colors.red),
                          ),
                        ),
                      )
                  ],
                ),
              ),
              Spacer(flex: 3),
            ],
          ),
        ],
      ),
    );
  }
}

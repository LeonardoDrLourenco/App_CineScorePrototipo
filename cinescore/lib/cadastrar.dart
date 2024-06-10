import 'package:cinescore/logo_widget.dart';
import 'package:cinescore/tela_login.dart';
import 'package:flutter/material.dart';

class TelaCadastrar extends StatelessWidget {
  final String username = '';

  TelaCadastrar();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: Stack(
          children: [
            Container(
             decoration: BoxDecoration(
               image: DecorationImage(
                image: AssetImage('assets/background_image.jpg'),
                fit: BoxFit.cover,
              ),
             ),
            ),
            Center(
              child: Column(

                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,

                children: <Widget>[
                  SizedBox(height: 60),
                  LogoWidget(),
                  Text(
                    'CineScore',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 230, 17, 17),
                    ),
                  ),
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
                      onPressed:  () {Navigator.push(
                          context, 
                          MaterialPageRoute(
                            builder: (context) => TelaLogin()
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
                    ),
                ]
                ),
            )
        ]
        )
      );
  }
}
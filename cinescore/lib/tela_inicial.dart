import 'package:flutter/material.dart';
import 'package:cinescore/tela_login.dart';
import 'package:cinescore/logo_widget.dart';
import 'package:cinescore/avaliar_filme.dart';
import 'package:cinescore/favoritos.dart';

class TelaInicial extends StatelessWidget {
  final String username;

  TelaInicial({required this.username});

  late String textoBusca;

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
                SizedBox(height: 20),
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Bem-vindo $username, já preparou a pipoca?',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 233, 213, 36),
                            fontFamily: 'Lato',
                          ),
                        ),
                        SizedBox(height: 25),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                width: 200,
                                child: TextField(
                                    style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      hintText: 'Buscar filmes...',
                                      hintStyle: TextStyle(
                                          color: Colors.white.withOpacity(0.4)),
                                      prefixIcon: Icon(Icons.search,
                                          color: Colors.white.withOpacity(0.4)),
                                    ),
                                    onChanged: (String value) {
                                      textoBusca = value;
                                    }),
                              ),
                              SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: () {
                                  if (textoBusca.isNotEmpty) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            AvaliarFilme(data: textoBusca),
                                      ),
                                    );
                                  }
                                },
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<
                                          Color>(
                                      const Color.fromARGB(255, 238, 227, 128)),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(
                                          color: Colors.red, width: 2.0),
                                    ),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 14),
                                  child: Text(
                                    'Avaliar Filme',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.red),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Favoritos(),
                                    ),
                                  );
                                },
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<
                                          Color>(
                                      const Color.fromARGB(255, 238, 227, 128)),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(
                                          color: Colors.red, width: 2.0),
                                    ),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 14),
                                  child: Text(
                                    'Filmes Favoritos',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.red),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            bottom: 20,
            child: Container(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {
                          // botão voltar, ainda preciso adicionar a funcionalidade
                        },
                        icon: Column(
                          children: [
                            Icon(
                              Icons.arrow_back,
                              color: Color.fromARGB(255, 238, 227, 128),
                            ),
                            Text(
                              'Voltar',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 238, 227, 128)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {
                          // botão de início, ainda preciso adicionar a funcionalidade
                        },
                        icon: Column(
                          children: [
                            Icon(
                              Icons.home,
                              color: Color.fromARGB(255, 238, 227, 128),
                            ),
                            Text(
                              'Início',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 238, 227, 128)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {
                          // botão de sair, ainda preciso adicionar a funcionalidade
                        },
                        icon: Column(
                          children: [
                            Icon(
                              Icons.power_settings_new,
                              color: Color.fromARGB(255, 238, 227, 128),
                            ),
                            Text(
                              'Sair',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 238, 227, 128)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
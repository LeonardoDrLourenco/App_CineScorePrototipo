import 'package:flutter/material.dart';
import 'package:cinescore/background_image.dart';
import 'package:cinescore/logo_widget.dart';

class Favoritos extends StatelessWidget {
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
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 230, 17, 17),
                ),
              ),
              Spacer(flex: 1),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Filmes Favoritos Teste',
                      style: TextStyle(
                        fontSize: 45,
                        color: Color.fromARGB(255, 238, 227, 128),
                      ),
                    ),
                    // ainda falta a logica para exibir os filmes favoritos
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

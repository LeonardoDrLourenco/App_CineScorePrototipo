import 'package:cinescore/avaliar_filme.dart';
import 'package:flutter/material.dart';
import 'package:cinescore/background_image.dart';
import 'package:cinescore/logo_widget.dart';

class Favoritos extends StatefulWidget {
  @override
  _FavoritosState createState() => _FavoritosState();
}

class _FavoritosState extends State<Favoritos> {
  String inserirFilme = '';
  List<String> filmesFavoritos = [];

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
                          hintText: 'Inserir Filme',
                          hintStyle:
                              TextStyle(color: Colors.white.withOpacity(0.4)),
                        ),
                        onChanged: (value) {
                          setState(() {
                            inserirFilme = value;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (inserirFilme.isNotEmpty) {
                            filmesFavoritos.add(inserirFilme);
                            inserirFilme = '';
                          }
                        });
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
                      child: Text(
                        'Adicionar Filme',
                        style: TextStyle(fontSize: 16, color: Colors.red),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(flex: 1),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Meus Filmes Favoritos:',
                      style: TextStyle(
                        fontSize: 35,
                        color: Color.fromARGB(255, 238, 227, 128),
                      ),
                    ),
                    Column(
                      children: filmesFavoritos.map((filme) {
                        return Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                          margin: EdgeInsets.symmetric(vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            filme,
                            style: TextStyle(
                              color: Color.fromARGB(255, 238, 227, 128),
                              fontSize: 20,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              Spacer(flex: 3),
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
                              Navigator.pop(context);
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
                                      color:
                                          Color.fromARGB(255, 238, 227, 128)),
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
                              Navigator.popUntil(
                                  context, (route) => route.isFirst);
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
                                      color:
                                          Color.fromARGB(255, 238, 227, 128)),
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        AvaliarFilme()),
                              );
                            },
                            icon: Column(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Color.fromARGB(255, 238, 227, 128),
                                ),
                                Text(
                                  'Filmes Avaliados',
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 238, 227, 128)),
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
        ],
      ),
    );
  }
}

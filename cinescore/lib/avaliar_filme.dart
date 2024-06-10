import 'dart:js_interop';

import 'package:cinescore/favoritos.dart';
import 'package:cinescore/tela_login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cinescore/background_image.dart';
import 'package:cinescore/logo_widget.dart';
import 'package:cinescore/tela_inicial.dart';
import 'package:flutter/widgets.dart';

class AvaliarFilme extends StatefulWidget {
  AvaliarFilme();

  Filme novoFilme = Filme(
        nomeFilme: '',
        criticaFilme: '',
        quantidadeEstrelas: 0,
      );

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<AvaliarFilme> {
  int _rating = 0;

  bool _isValid = true;

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _criticaController = TextEditingController();
  
  get username => this.username;

  final List<Filme> filmes = [];

  late String nomeFilme;

  void _setRating(int rating) {
    setState(() {
      _rating = rating;
    });
  }

  void _avaliar() {
    String critica = _criticaController.text;
    String nomeFilme = _nomeController.text;

    if(critica.isNotEmpty && _rating > 0){
      Filme novoFilme = Filme(
          nomeFilme: nomeFilme,
          criticaFilme: critica,
          quantidadeEstrelas: _rating,
        );
        setState(() {
          filmes.add(novoFilme);
        });

      _criticaController.clear();
      _nomeController.clear();

      setState(() {
        _rating = 0;
      });

      _isValid = true;

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
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 230, 17, 17),
                ),
              ),
              Spacer(
                flex: 1,
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 250,
                      child: TextField(
                        controller: _nomeController,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Inserir filme...',
                          hintStyle: TextStyle(
                            color: Colors.white.withOpacity(0.3),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Sua Crítica:',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 230, 17, 17),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 300,
                            height: 150,
                            child: TextField(
                              controller: _criticaController,
                              maxLines: null,
                              expands: true,
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                hintText: 'Ex.: Filme muito bom',
                                hintStyle: TextStyle(
                                  color: Colors.white.withOpacity(0.3),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white.withOpacity(0.7),
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                filled: true,
                                fillColor: Colors.white.withOpacity(0.1),
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 60.0),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(5, (index) {
                              return IconButton(
                                icon: Icon(
                                  index < _rating
                                      ? Icons.star
                                      : Icons.star_border,
                                  color: index < _rating
                                      ? Colors.yellow
                                      : Colors.white.withOpacity(0.5),
                                ),
                                onPressed: () {
                                  _setRating(index + 1);
                                },
                              );
                            }),
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: _avaliar,
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromARGB(255, 238, 227, 128),
                              ),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(
                                    color: Colors.red,
                                    width: 2.0,
                                  ),
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 14,
                              ),
                              child: Text(
                                'Avaliar',
                                style:
                                    TextStyle(fontSize: 16, color: Colors.red),
                              ),
                            ),
                          ),
                          if(!_isValid)
                             Text(
                              'Por favor, preencha todos os campos.',
                              style: TextStyle(color: Colors.red),
                             ),
                          
                          SizedBox(height: 20),
                          _buildFilmeList()
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
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
                              Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            TelaLogin(),
                                      ),
                                    );
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
                                  builder: (context) => Favoritos(),
                                ),
                                );
                            },
                            icon: Column(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Color.fromARGB(255, 238, 227, 128),
                                ),
                                Text(
                                  'Favoritos',
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

 /* Widget _buildFilmeList() {
    if (filmes.isEmpty) {
      return Center(
        child: Text('Nenhum filme avaliado ainda.'),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: filmes.map((filme) {
        return Card(
          color: Color.fromARGB(255, 238, 227, 128),
          
          margin: EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            title: Text(filme.nomeFilme),
            textColor: Colors.red,
            subtitle: Text(
              'Crítica: ${filme.criticaFilme}\nAvaliação: ${filme.quantidadeEstrelas} estrelas',
              style: TextStyle(color: Colors.red),
            ),
          ),
        );
      }).toList(),
    );
  }
}*/

  Widget _buildFilmeList() {
    if (filmes.isEmpty) {
      return Center(
        child: Text('Nenhum filme avaliado ainda.'),
      );
    }
    return SizedBox(
      height: 200, // Altura desejada para a lista rolável
      child: ListView.builder(
        itemCount: filmes.length,
        itemBuilder: (context, index) {
          final filme = filmes[index];
          return Card(
            color: Color.fromARGB(255, 238, 227, 128),
            margin: EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              title: Text(
                filme.nomeFilme,
                style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Crítica: ${filme.criticaFilme}\nAvaliação: ${filme.quantidadeEstrelas} estrelas',
                style: TextStyle(color: Colors.red),
              ),
            ),
          );
        },
      ),
    );
  }
}

class Filme {
  final String nomeFilme;
  final String criticaFilme;
  final int quantidadeEstrelas;

  Filme({
    required this.nomeFilme,
    required this.criticaFilme,
    required this.quantidadeEstrelas
  });
}

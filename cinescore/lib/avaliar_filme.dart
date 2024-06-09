import 'package:flutter/material.dart';
import 'package:cinescore/background_image.dart';
import 'package:cinescore/logo_widget.dart';
import 'package:cinescore/tela_inicial.dart';

class AvaliarFilme extends StatefulWidget {
  final String data;
  AvaliarFilme({required this.data});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<AvaliarFilme> {
  int _rating = 0;
  final TextEditingController _criticaController = TextEditingController();

  void _setRating(int rating) {
    setState(() {
      _rating = rating;
    });
  }

  void _avaliar() {
    String critica = _criticaController.text;
    // falta a lógica para enviar a crítica e a avaliação
    print('Crítica: $critica');
    print('Avaliação: $_rating estrelas');
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
                    Text(
                      widget.data,
                      style: TextStyle(
                        fontSize: 45,
                        color: Color.fromARGB(255, 238, 227, 128),
                      ),
                    ),
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
                              // botão de avaliações, ainda preciso adicionar a funcionalidade
                            },
                            icon: Column(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Color.fromARGB(255, 238, 227, 128),
                                ),
                                Text(
                                  'Avaliações',
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

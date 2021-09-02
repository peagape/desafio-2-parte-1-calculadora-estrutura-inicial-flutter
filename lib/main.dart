import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//TODO - 1: Adicione uma tela em branco (Scaffold) e defina a cor de fundo para 'balck12, ou seja criativo e escolha sua própria cor'

//TODO - 2: Crie uma appBar para o aplicativo, como título: 'Calculadora', cor de fundo: 'black, ou seja criativo e escolha sua própria cor'

//TODO - 3: Crie um corpo para o app Utilizando o Widget Column. Dentro dessa coluna inclua um container que temporariamente servirá como nosso display.
//Altere a propriedade color desse container para: 'white', dê um espaçamento nas margens de: '15'. O width deve ser: '400' e o height: '120'.
//Exiba o texto 'visor' no centro do container, o tamanho da fonte deve ser: '50'.

//TODO - 4: Crie um novo Container, que receberá um column, que por sua vez receberá vários rows, que por sua vez receberão vários raisedbuttons para criar os botões da nossa calculadora.
//A calculadora deve ficar com o visual similar ao da imagem apresentada em: https://drive.google.com/file/d/1fuKl3cdlr1J-PsLLmKtStvgeHiaeahO6/view?usp=sharing.
//Dicas: pesquisem no flutter.dev pelas classes/widgets: 'Expanded' e 'RaisedButton'; As cores podem ser diferentes para os botões,
//fica a seu critério, porém, a estrutura dos botões deve ser a mesma apresentada na imagem.

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculadora',
      theme: ThemeData(
          //primarySwatch: Colors.black,
          ),
      home: MinhaCalculadora(),
    );
  }
}

class MinhaCalculadora extends StatefulWidget {
  const MinhaCalculadora({Key key}) : super(key: key);

  @override
  _MinhaCalculadoraState createState() => _MinhaCalculadoraState();
}

class _MinhaCalculadoraState extends State<MinhaCalculadora> {
  final ButtonStyle style =
      ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 30));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text('Calculadora'),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Container(
            width: 400.0,
            height: 120.0,
            margin: EdgeInsets.all(15.0),
            color: Colors.white,
            child: Center(
                child: Text(
              'VISOR',
              style: TextStyle(fontSize: 50),
            )),
          ),

          //Conteudo e btns da Calculadora!
          Container(
            //color: Colors.black,

            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Txtbtn(txt: 'C', corTxt: Colors.blueAccent)
                        .exibirRow(),

                  Txtbtn(txt: 'DEL', corTxt: Colors.blueAccent)
                        .exibirRow(), 

                  Txtbtn(txt: '%', corTxt: Colors.blueAccent)
                        .exibirRow(),

                  Txtbtn(txt: '/', corTxt: Colors.blueAccent)
                        .exibirRow(),

                  
                  ],
                ),

                //Segunda linha
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Txtbtn(txt: '7', corTxt: Colors.white)
                        .exibirRow(),

                  Txtbtn(txt: '8', corTxt: Colors.white)
                        .exibirRow(), 

                  Txtbtn(txt: '9', corTxt: Colors.white)
                        .exibirRow(),

                  Txtbtn(txt: '*', corTxt: Colors.blueAccent)
                        .exibirRow(),

                  
                  ],
                ),

                 //Terceira linha
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Txtbtn(txt: '4', corTxt: Colors.white)
                        .exibirRow(),

                  Txtbtn(txt: '5', corTxt: Colors.white)
                        .exibirRow(), 

                  Txtbtn(txt: '6', corTxt: Colors.white)
                        .exibirRow(),

                  Txtbtn(txt: '+', corTxt: Colors.blueAccent)
                        .exibirRow(),

                  
                  ],
                ),

                 //quinta linha
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Txtbtn(txt: '1', corTxt: Colors.white)
                        .exibirRow(),

                  Txtbtn(txt: '2', corTxt: Colors.white)
                        .exibirRow(), 

                  Txtbtn(txt: '3', corTxt: Colors.white)
                        .exibirRow(),

                  Txtbtn(txt: '-', corTxt: Colors.blueAccent)
                        .exibirRow(),

                  
                  ],
                ),

                 //sexta linha
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Txtbtn(txt: '0', corTxt: Colors.white)
                        .exibirRow(),

                  Txtbtn(txt: '.', corTxt: Colors.white)
                        .exibirRow(),

                  Txtbtn(txt: '=', corTxt: Colors.blueAccent)
                        .exibirRow(),

                  
                  ],
                ),




              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Txtbtn {

  /*
  Class para facilitar a exibição dos digitos
  by Flávio Rocha - github.com/peagape
  */

  String txt;
  Color corTxt;

  Txtbtn({this.txt, this.corTxt});

  exibirRow() {
    
      return TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.all(30.0),
          primary: this.corTxt,
          backgroundColor: Colors.black,
          alignment: Alignment.center,
          visualDensity: VisualDensity.comfortable,
          textStyle: const TextStyle(fontSize: 40),
        ),
        onPressed: () {},
        child: Text(this.txt),
      );
    
  }
}

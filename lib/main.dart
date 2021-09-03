import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

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
  String mensagemVisor = '0';

  //Método para receber os valores e os operadores e criar a expressão que será repassada para a lib
  setarValor(String valor) {
    setState(() {
      if (mensagemVisor == '0') {
        mensagemVisor = valor;
      } else {
        mensagemVisor += valor;
      }
    });
  }

  //Limpa o visor da calculadora
  void resetar() {
    setState(() {
      mensagemVisor = '0';
    });
  }

  //Realizar cálculo com equação repassada
  void realizarCalculo() {
    //Se houver divisão trocar o caractere ÷ pelo da barra que é reconhecido pela instrução
    mensagemVisor = mensagemVisor.replaceAll('÷', '/');

    Parser p = Parser();
    //Nesta linha a expressão matemática será criada de acordo com o que for passado na string
    Expression expressao = p.parse(mensagemVisor);
    ContextModel cm = new ContextModel(); //Obtem o contexto da expressão
    //Nesta linha será realisado de fato o cálculo
    double resolucaoDaExpressao = expressao.evaluate(EvaluationType.REAL, cm);
    
    setState(() {
      mensagemVisor = resolucaoDaExpressao.toString();
    });
  }

  final ButtonStyle style =
      ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 30));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Calculadora'),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Container(
            width: 400.0,
            height: 120.0,
            margin: EdgeInsets.all(10.0),
            color: Colors.white,
            child: Center(
                child: Text(
              mensagemVisor,
              style: TextStyle(fontSize: 50, color: Colors.black26),
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
                    Txtbtn(txt: 'C', corTxt: Colors.blueAccent).exibirRow(onPress: () => {resetar()}),
                    Txtbtn(txt: 'DEL', corTxt: Colors.blueAccent).exibirRow(onPress: () => {resetar()}),
                    Txtbtn(txt: '%', corTxt: Colors.blueAccent).exibirRow(onPress: () => {setarValor('%')}),
                    Txtbtn(txt: '/', corTxt: Colors.blueAccent).exibirRow(onPress: () => {setarValor('÷')}),
                  ],
                ),

                //Segunda linha
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Txtbtn(txt: '7', corTxt: Colors.white).exibirRow(onPress: () => {setarValor('7')}),
                    Txtbtn(txt: '8', corTxt: Colors.white).exibirRow(onPress: () => {setarValor('8')}),
                    Txtbtn(txt: '9', corTxt: Colors.white).exibirRow(onPress: () => {setarValor('9')}),
                    Txtbtn(txt: '*', corTxt: Colors.blueAccent).exibirRow(onPress: () => {setarValor('*')}),
                  ],
                ),

                //Terceira linha
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Txtbtn(txt: '4', corTxt: Colors.white).exibirRow(onPress: () => {setarValor('4')}),
                    Txtbtn(txt: '5', corTxt: Colors.white).exibirRow(onPress: () => {setarValor('5')}),
                    Txtbtn(txt: '6', corTxt: Colors.white).exibirRow(onPress: () => {setarValor('6')}),
                    Txtbtn(txt: '+', corTxt: Colors.blueAccent).exibirRow(onPress: () => {setarValor('+')}),
                  ],
                ),

                //quinta linha
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Txtbtn(txt: '1', corTxt: Colors.white).exibirRow(onPress: () => {setarValor('1')}),
                    Txtbtn(txt: '2', corTxt: Colors.white).exibirRow(onPress: () => {setarValor('2')}),
                    Txtbtn(txt: '3', corTxt: Colors.white).exibirRow(onPress: () => {setarValor('3')}),
                    Txtbtn(txt: '-', corTxt: Colors.blueAccent).exibirRow(onPress: () => {setarValor('-')}),
                  ],
                ),

                //sexta linha
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Txtbtn(txt: '0', corTxt: Colors.white).exibirRow(onPress: () => {setarValor('0')}),
                    Txtbtn(txt: '.', corTxt: Colors.white).exibirRow(onPress: () => {setarValor('.')}),
                    Txtbtn(txt: '=', corTxt: Colors.blueAccent)
                        .exibirRow(onPress: () => {realizarCalculo()}),
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

  //var tecla;

  Txtbtn({this.txt, this.corTxt});

  exibirRow({Function onPress}){

    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.all(30.0),
        primary: this.corTxt,
        backgroundColor: Colors.black,
        alignment: Alignment.center,
        visualDensity: VisualDensity.comfortable,
        textStyle: const TextStyle(fontSize: 40),
      ),
      onPressed: onPress,
      child: Text(this.txt),
    );
  }
}

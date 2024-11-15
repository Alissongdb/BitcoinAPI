import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class HomePrecoBitcoin extends StatefulWidget {
  const HomePrecoBitcoin({super.key});

  @override
  State<HomePrecoBitcoin> createState() => _HomePrecoBitcoinState();
}

class _HomePrecoBitcoinState extends State<HomePrecoBitcoin> {
  String _preco = "0";

  void _recuperarPreco() async {
    String url = "https://blockchain.info/ticker";
    http.Response response = await http.get(Uri.parse(url));

    Map<String, dynamic> retorno = json.decode(response.body);
    setState(() {
      _preco = retorno["BRL"]["BUY"].toString();
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(150),
            ),
            Image.asset('images/bitcoin.png'),
            const SizedBox(
              height: 30,
            ),
            Text(
              "R\$" + _preco,
              style: const TextStyle(
                fontSize: 30,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: _recuperarPreco,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
              ),
              child: const Text(
                'Atualizar',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:html';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:neumorphic_container/neumorphic_container.dart';
import 'package:web3dart/web3dart.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Client httpClient;
  late Web3Client ethClient;
  final myAddress = "0xEdBb3D1339115fFBeF919111589C651e196adcb1";
  bool data = false;
  int _value = 0;

  @override
  void initState() {
    httpClient = Client();
    ethClient = Web3Client(
        "https://rinkeby.infura.io/v3/aca9fdfd7ee246588cb175d5358156a7",
        httpClient);
    getBalance(myAddress);
    super.initState();
  }

  Future<void> getBalance(String targetAddress)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FlutterZed's Coin"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.grey[900],
      ),
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 20,
          ),
          NeumorphicContainer(
            spread: 2,
            depth: 100,
            height: 150,
            width: MediaQuery.of(context).size.width - 20,
            borderRadius: 10,
            primaryColor: Colors.grey[900],
            curvature: Curvature.flat,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Balance",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                data
                    ? const Padding(
                        padding: EdgeInsets.all(25.0),
                        child: Text("1"),
                      )
                    : const Padding(
                        padding: EdgeInsets.all(25.0),
                        child: CircularProgressIndicator(),
                      )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          NeumorphicContainer(
            spread: 2,
            depth: 100,
            width: MediaQuery.of(context).size.width - 20,
            borderRadius: 10,
            primaryColor: Colors.grey[900],
            curvature: Curvature.flat,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    NeumorphicContainer(
                      spread: 2,
                      depth: 100,
                      borderRadius: 10,
                      primaryColor: Colors.grey[900],
                      curvature: Curvature.flat,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(_value.toString()),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Slider(
                          min: 0.0,
                          max: 100.0,
                          value: _value.toDouble(),
                          onChanged: (value) {
                            setState(() {
                              _value = value.toInt();
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text("Refresh"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text("Deposit"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text("Withdraw"),
                      ),
                    )
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

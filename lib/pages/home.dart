import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text("Meu app"),
        ),
        drawer: const Drawer(
          child: Padding(
            padding:
                EdgeInsetsDirectional.symmetric(horizontal: 10, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40,
                ),
                Text("Cadastrar novo cliente"),
                Divider(
                  color: Colors.black,
                ),
                SizedBox(height: 20),
                Text("Clientes cadastrados"),
                Divider(
                  color: Colors.black,
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Histórico de pedidos"),
                Divider(
                  color: Colors.black,
                ),
                SizedBox(height: 20),
                Text("Comissões"),
                Divider(
                  color: Colors.black,
                ),
                SizedBox(height: 20),
                Text("OP´s Programadas"),
                Divider(
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ),
        body: const Center(
          child: Column(),
        ),
      ),
    );
  }
}

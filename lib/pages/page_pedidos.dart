import 'package:flutter/material.dart';

class PageHistorico extends StatelessWidget {
  const PageHistorico({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: const Center(
        child: Text("Histórico de Pedidos"),
      ),
    );
  }
}

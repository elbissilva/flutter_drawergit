import 'package:flutter/material.dart';

class CmsPage extends StatelessWidget {
  const CmsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: const Center(
        child: Text("Extrato de comissões "),
      ),
    );
  }
}

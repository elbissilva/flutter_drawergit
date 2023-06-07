import 'package:flutter/material.dart';
import 'package:flutter_drawergit/pages/home1.dart';
import 'package:flutter_drawergit/pages/home2.dart';
import 'package:flutter_drawergit/pages/home3.dart';
import 'package:flutter_drawergit/pages/page_cadastro.dart';
import 'package:flutter_drawergit/pages/page_pedidos.dart';
import 'package:flutter_drawergit/pages/pagecms.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int posicaoPage = 0;
  PageController controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text("Meu app"),
        ),
        drawer: Drawer(
          child: Padding(
            padding: const EdgeInsetsDirectional.symmetric(
                horizontal: 10, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    width: double.infinity,
                    child: const Text("Cadastrar novo cliente"),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PageCadastro()));
                  },
                ),
                const Divider(
                  color: Colors.black,
                ),
                InkWell(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    width: double.infinity,
                    child: const Text("Histórico de pedidos"),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PageHistorico()));
                  },
                ),
                const Divider(
                  color: Colors.black,
                ),
                InkWell(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    width: double.infinity,
                    child: const Text("Extrato de comissões"),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CmsPage()));
                  },
                ),
                const Divider(
                  color: Colors.black,
                )
              ],
            ),
          ),
        ),
        body: Column(children: [
          Expanded(
            child: PageView(
                controller: controller,
                onPageChanged: (value) {
                  setState(() {
                    posicaoPage = value;
                  });
                },
                // scrollDirection: Axis.vertical,
                children: const [Home1(), Home2(), Home3()]),
          ),
          BottomNavigationBar(
              onTap: (value) {
                controller.jumpToPage(value);
              },
              currentIndex: posicaoPage,
              items: const [
                BottomNavigationBarItem(label: "HOME1", icon: Icon(Icons.home)),
                BottomNavigationBarItem(
                    label: "HOME2", icon: Icon(Icons.person)),
                BottomNavigationBarItem(label: "HOME3", icon: Icon(Icons.add)),
              ]),
        ]),
      ),
    );
  }
}

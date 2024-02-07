import 'package:flutter/material.dart';
import 'package:flutter_drawergit/app_images.dart';

class AgendaPac extends StatefulWidget {
  const AgendaPac({super.key});

  @override
  State<AgendaPac> createState() => _AgendaPacState();
}

class _AgendaPacState extends State<AgendaPac> {
  TextEditingController userSearchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Agendados"),
          backgroundColor: Colors.green,
        ),
        body: ListView(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                height: 50,
                width: double.infinity,
                child: TextFormField(
                  controller: userSearchController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.search_sharp,
                      color: Colors.red,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 20),
                    ),
                    labelText: 'Buscar'
                  ),
                )),
            const SizedBox(height: 15),
            ListTile(
              leading: Image.asset(ImageAPP.paciente),
              title: const Text(
                "Nome:",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800),
              ),
              subtitle: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Tipo de exame:",
                    style: TextStyle(fontWeight: FontWeight.w900),
                  ),
                  Text(
                    "Data agendada:",
                    style: TextStyle(fontWeight: FontWeight.w900),
                  )
                ],
              ),
              trailing: PopupMenuButton<String>(
                onSelected: (menu) {},
                itemBuilder: (BuildContext bc) {
                  return <PopupMenuEntry<String>>[
                    const PopupMenuItem<String>(
                      value: "Exame realizado",
                      child: Text("Exame realizado"),
                    ),
                    const PopupMenuItem<String>(
                      value: "Não compareceu",
                      child: Text("Não compareceu"),
                    ),
                  ];
                },
              ),
            ),
            const Divider(
              color: Colors.black,
            ),
            ListTile(
              leading: Image.asset(ImageAPP.paciente),
              title: const Text(
                "Nome:",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800),
              ),
              subtitle: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Tipo de exame:",
                    style: TextStyle(fontWeight: FontWeight.w900),
                  ),
                  Text(
                    "Data agendada:",
                    style: TextStyle(fontWeight: FontWeight.w900),
                  )
                ],
              ),
              trailing: PopupMenuButton<String>(
                onSelected: (menu) {
                  if (menu == "exame_realizado") {}
                  if (menu == "nao_compareceu") {}
                },
                itemBuilder: (BuildContext bc) {
                  return <PopupMenuEntry<String>>[
                    const PopupMenuItem<String>(
                      value: "exame_realizado",
                      child: Text("Exame realizado"),
                    ),
                    const PopupMenuItem<String>(
                      value: "nao_compareceu",
                      child: Text("Não compareceu"),
                    ),
                  ];
                },
              ),
            ),
          ],
        ));
  }
}

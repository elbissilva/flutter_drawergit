import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Importe o pacote cloud_firestore
import 'package:flutter_drawergit/app_images.dart';

class AgendaPac extends StatefulWidget {
  const AgendaPac({Key? key}) : super(key: key);

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
      body: FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance
            .collection('pacientes')
            .get(), // Recupere os dados do Firestore
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text('Erro ao carregar os dados'));
          }
          final pacientes = snapshot.data!.docs; // Obtenha os documentos
          return ListView.builder(
            itemCount: pacientes.length,
            itemBuilder: (context, index) {
              final paciente = pacientes[index];
              final pacienteData = paciente.data()
                  as Map<String, dynamic>; // Atributos do paciente
              return ListTile(
                leading: Image.asset(ImageAPP.paciente),
                title: Text(
                  pacienteData['nome'] ??
                      'Nome não encontrado', // Retorne o nome do paciente
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.w800),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      pacienteData['tipo_exame'] ??
                          'Tipo de exame não encontrado', // Retorne o tipo de exame
                      style: const TextStyle(fontWeight: FontWeight.w900),
                    ),
                    Text(
                      pacienteData['data_agendada'] ??
                          'Data agendada não encontrada', // Retorne a data agendada
                      style: const TextStyle(fontWeight: FontWeight.w900),
                    ),
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
              );
            },
          );
        },
      ),
    );
  }
}

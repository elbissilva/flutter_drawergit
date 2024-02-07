import 'package:flutter/material.dart';
import 'package:flutter_drawergit/pages/page_finished.dart';
import 'package:flutter_drawergit/repositorios/repository_ex.dart';
import 'package:flutter_drawergit/repositorios/repository_op.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class PageCadastro extends StatefulWidget {
  const PageCadastro({super.key});

  @override
  State<PageCadastro> createState() => _PageCadastroState();
}

class _PageCadastroState extends State<PageCadastro> {
  var nomeController = TextEditingController(text: "");
  var dataNascController = TextEditingController(text: "");
  var idController = TextEditingController(text: "");
  DateTime? dataFormatada;
  var examesRespository = Exames();
  var opcacaorRepository = Opcao();
  var opcoesSelecionadas = "";
  var opcoes = [];
  var exames = [];
  var exameSelecionado = "";
  // final CHAVE_NOME = "CHAVE_NOME";
  // final CHAVE_DATA = "CHAVE_DATA";
  // final CHAVE_ID = "CHAVE_ID";
  // final CHAVE_EXAME = "CHAVE_EXAME";
  // final CHAVE_OPCAO = "CHAVE_OPCAO";

  bool salvando = false;
  late SharedPreferences storage;
  @override
  void initState() {
    exames = examesRespository.retornaExames();
    opcoes = opcacaorRepository.retornaOpcoes();
    super.initState();
    // carregarDados();
  }

  void main() {
    DateTime dataNasc = DateTime.now();
    String formatoDesejado = 'dd/MM/yyyy';
    String dataFormatada = DateFormat(formatoDesejado).format(dataNasc);
  }

  // carregarDados() async {
  //   storage = await SharedPreferences.getInstance();

  //   setState(() {
  //     nomeController.text = storage.getString(CHAVE_NOME) ?? "";
  //     dataNascController.text = storage.getString(CHAVE_DATA) ?? "";
  //     idController.text = storage.getString(CHAVE_ID) ?? "";
  //     exameSelecionado = storage.getString(CHAVE_EXAME) ?? "";
  //     opcoesSelecionadas = storage.getString(CHAVE_OPCAO) ?? "";
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.green),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: salvando
            ? const Center(child: CircularProgressIndicator())
            : ListView(
                children: [
                  const Text(
                    "NOME:",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                  ),
                  TextField(
                    controller: nomeController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "DATA DE NASCIMENTO:",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                  ),
                  TextField(
                    controller: dataNascController,
                    readOnly: true,
                    onTap: () async {
                      var data = await showDatePicker(
                          context: context,
                          initialDate: DateTime(1993, 1, 1),
                          firstDate: DateTime(1920, 1, 1),
                          lastDate: DateTime(2023, 6, 1));
                      if (data != null) {
                        dataNascController.text = data.toString();
                        dataFormatada = data;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "ID:",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                  ),
                  TextField(
                    controller: idController,
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "EXAME:",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                  ),
                  Column(
                    children: exames
                        .map((exame) => RadioListTile(
                            selected: exameSelecionado == exame,
                            title: Text(exame.toString()),
                            value: exame.toString(),
                            groupValue: exameSelecionado,
                            onChanged: (value) {
                              setState(() {
                                exameSelecionado = value.toString();
                              });
                            }))
                        .toList(),
                  ),
                  const Text(
                    "OPÇÕES:",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                  ),
                  Column(
                    children: opcoes
                        .map((opcao) => RadioListTile(
                            selected: opcoesSelecionadas == opcao,
                            title: Text(opcao.toString()),
                            value: opcao.toString(),
                            groupValue: opcoesSelecionadas,
                            onChanged: (value) {
                              setState(() {
                                opcoesSelecionadas = value.toString();
                              });
                            }))
                        .toList(),
                  ),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          salvando = false;
                        });

                        if (nomeController.text.trim().length < 3) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      "O nome do paciente não foi preenchido")));
                          return;
                        }
                        if (dataFormatada == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text("Preencha a data de nascimento")));
                          return;
                        }
                        if (exameSelecionado == "") {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Selecione um exame")));
                          return;
                        }
                        if (opcoesSelecionadas == "") {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text("Selecione pelo menos uma opção")));
                          return;
                        }
                        // await storage.setString(
                        //     CHAVE_NOME, nomeController.text);
                        // await storage.setString(
                        //     CHAVE_DATA, dataNascController.text);
                        // await storage.setString(CHAVE_ID, idController.text);
                        // await storage.setString(CHAVE_EXAME, exameSelecionado);
                        // await storage.setString(
                        //     CHAVE_OPCAO, opcoesSelecionadas);

                        setState(() {
                          salvando = true;
                        });
                        Future.delayed(const Duration(seconds: 2), () {
                          setState(() {
                            salvando = false;
                          });
                          Navigator.pop;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const FinishedPage()));
                        });
                      },
                      child: const Text("Salvar"))
                ],
              ),
      ),
    );
  }
}

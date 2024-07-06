import 'package:flutter/material.dart';
import 'exercises_page_list.dart';
import 'model/exercises.dart';

class ExercisesPage extends StatefulWidget {
  @override
  _ExercisesPageState createState() => _ExercisesPageState();
}

class _ExercisesPageState extends State<ExercisesPage> {
  bool chestChecked = false;
  bool backChecked = false;
  bool legChecked = false;
  bool shoulderChecked = false;
  bool armsChecked = false;
  List<Exercises> selectedExercises =
      []; // Lista para armazenar os exercícios selecionados

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DataTable(
                  columns: [
                    DataColumn(label: Text('Selecionar')),
                    DataColumn(label: Text('Exercício')),
                    DataColumn(label: Text('Grupo Muscular')),
                  ],
                  rows: [
                    DataRow(cells: [
                      DataCell(
                        Checkbox(
                          value: chestChecked,
                          onChanged: (value) {
                            setState(() {
                              chestChecked = value!;
                            });
                          },
                        ),
                      ),
                      DataCell(Text('Supino')),
                      DataCell(Text('Peito')),
                    ]),
                    DataRow(cells: [
                      DataCell(
                        Checkbox(
                          value: backChecked,
                          onChanged: (value) {
                            setState(() {
                              backChecked = value!;
                            });
                          },
                        ),
                      ),
                      DataCell(Text('Remada Baixa')),
                      DataCell(Text('Costas')),
                    ]),
                    DataRow(cells: [
                      DataCell(
                        Checkbox(
                          value: legChecked,
                          onChanged: (value) {
                            setState(() {
                              legChecked = value!;
                            });
                          },
                        ),
                      ),
                      DataCell(Text('Leg Press')),
                      DataCell(Text('Pernas')),
                    ]),
                    DataRow(cells: [
                      DataCell(
                        Checkbox(
                          value: shoulderChecked,
                          onChanged: (value) {
                            setState(() {
                              shoulderChecked = value!;
                            });
                          },
                        ),
                      ),
                      DataCell(Text('Desenvolvimento')),
                      DataCell(Text('Ombros')),
                    ]),
                    DataRow(cells: [
                      DataCell(
                        Checkbox(
                          value: armsChecked,
                          onChanged: (value) {
                            setState(() {
                              armsChecked = value!;
                            });
                          },
                        ),
                      ),
                      DataCell(Text('Rosca Direta')),
                      DataCell(Text('Braços')),
                    ]),
                  ],
                ),
                SizedBox(height: 20),
                // Botão de Salvar
                ElevatedButton(
                  onPressed: () {
                    selectedExercises.clear();

                    if (chestChecked) {
                      selectedExercises.add(
                        Exercises(name: 'Supino', muscle: 'Peito'),
                      );
                    }
                    if (backChecked) {
                      selectedExercises.add(
                        Exercises(name: 'Remada Baixa', muscle: 'Costas'),
                      );
                    }
                    if (legChecked) {
                      selectedExercises.add(
                        Exercises(name: 'Leg Press', muscle: 'Pernas'),
                      );
                    }
                    if (shoulderChecked) {
                      selectedExercises.add(
                        Exercises(name: 'Desenvolvimento', muscle: 'Ombros'),
                      );
                    }
                    if (armsChecked) {
                      selectedExercises.add(
                        Exercises(name: 'Rosca Direta', muscle: 'Braços'),
                      );
                    }
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Exercícios salvos com sucesso!'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                  child: Text("Salvar"),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ExercisesPageList(
                          selectedExercises: selectedExercises,
                        ),
                      ),
                    );
                  },
                  child: Text("Listar Treino"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

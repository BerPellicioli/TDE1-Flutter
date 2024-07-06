import 'package:flutter/material.dart';
import 'model/exercises.dart';

class ExercisesPageList extends StatefulWidget {
  final List<Exercises> selectedExercises;

  const ExercisesPageList({Key? key, required this.selectedExercises})
      : super(key: key);

  @override
  _ExercisesPageListState createState() => _ExercisesPageListState();
}

class _ExercisesPageListState extends State<ExercisesPageList> {
  String filterText = '';

  @override
  Widget build(BuildContext context) {
    List<Exercises> filteredExercises = widget.selectedExercises
        .where((exercise) =>
            exercise.name!.toLowerCase().contains(filterText.toLowerCase()))
        .toList();

    return Scaffold(
      backgroundColor: Colors.grey[500],
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    filterText = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Filtre por Exercício ou Grupo Muscular',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  child: DataTable(
                    columns: [
                      DataColumn(label: Text('ID')),
                      DataColumn(label: Text('Exercício')),
                      DataColumn(label: Text('Grupo Muscular')),
                    ],
                    rows: filteredExercises.asMap().entries.map((entry) {
                      int index = entry.key;
                      Exercises exercise = entry.value;

                      return DataRow(
                        cells: [
                          DataCell(Text((index + 1).toString())),
                          DataCell(Text(exercise.name ?? '')),
                          DataCell(Text(exercise.muscle ?? '')),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

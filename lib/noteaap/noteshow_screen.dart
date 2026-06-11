import 'package:bloc_state_managemnet/noteaap/noteapp_bloc.dart';
import 'package:bloc_state_managemnet/noteaap/noteapp_event.dart';
import 'package:bloc_state_managemnet/noteaap/noteapp_state.dart';
import 'package:bloc_state_managemnet/noteaap/noteapp_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Notehome extends StatelessWidget {
  const Notehome({super.key});

  @override
  Widget build(BuildContext context) {
    final notebloc = context.read<NoteappBloc>();
    return Scaffold(
      floatingActionButton: SizedBox(
        height: 100,
        width: 70,

        child: FloatingActionButton(
          shape: CircleBorder(),
          backgroundColor: Colors.blueAccent,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NotepadScreen()),
            );
          },
          child: const Icon(Icons.add, color: Colors.white, size: 40),
        ),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "My Notes",
          style: TextStyle(
            color: Colors.black,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),

        centerTitle: true,
      ),
      body: BlocBuilder<NoteappBloc, NoteappState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.note.length,
            itemBuilder: (context, index) {
              final notees = state.note[index];
              return Card(
                margin: const EdgeInsets.all(8),
                child: ListTile(
                  tileColor: Colors.white,
                  title: Text(
                    notees.title,

                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  subtitle: Text(
                    notees.description,

                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                    ),
                  ),

                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.black,
                          size: 24,
                        ),
                        onPressed: () {
                          notebloc.add(Deletnote(notees.id));
                        },
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.black,
                          size: 24,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  NotepadScreen(notee: notees),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

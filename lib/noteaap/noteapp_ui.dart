import 'package:bloc_state_managemnet/noteaap/noteapp_bloc.dart';
import 'package:bloc_state_managemnet/noteaap/noteapp_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotepadScreen extends StatefulWidget {
  final dynamic notee;

  const NotepadScreen({super.key, this.notee});

  @override
  State<NotepadScreen> createState() => _NotepadScreenState();
}

class _NotepadScreenState extends State<NotepadScreen> {
  final TextEditingController titlecontroller = TextEditingController();
  final TextEditingController descriptioncontroller = TextEditingController();
  @override
  void initState() {
    super.initState();

    if (widget.notee != null) {
      titlecontroller.text = widget.notee!.title;
      descriptioncontroller.text = widget.notee!.description;
    }
  }

  @override
  Widget build(BuildContext context) {
    final notebloc = context.read<NoteappBloc>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Add Note",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              if (widget.notee == null) {
                notebloc.add(
                  Addnote(
                    description: descriptioncontroller.text,
                    title: titlecontroller.text,
                  ),
                );
              } else {
                notebloc.add(
                  Updatenote(
                    id: widget.notee!.id,
                    title: titlecontroller.text,
                    description: descriptioncontroller.text,
                  ),
                );
              }

              Navigator.pop(context);
            },
            icon: const Icon(Icons.save, color: Colors.black, size: 30),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              controller: titlecontroller,
              decoration: const InputDecoration(
                fillColor: Colors.white,
                hintText: "Title",
                hintStyle: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                border: OutlineInputBorder(borderSide: BorderSide.none),

                filled: true,
              ),
            ),

            TextFormField(
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
              controller: descriptioncontroller,
              maxLines: 5,
              decoration: InputDecoration(
                fillColor: Colors.white,
                hintText: "Description.......",
                hintStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  color: Colors.black45,
                ),
                border: OutlineInputBorder(borderSide: BorderSide.none),
                filled: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

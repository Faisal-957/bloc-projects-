abstract class NoteappEvent {}

class Addnote extends NoteappEvent {
  final String title;
  final String description;
  Addnote({required this.description, required this.title});
}

class Deletnote extends NoteappEvent {
  final String id;
  Deletnote(this.id);
}

class Updatenote extends NoteappEvent {
  final String id;
  final String title;
  final String description;
  Updatenote({
    required this.id,
    required this.title,
    required this.description,
  });
}

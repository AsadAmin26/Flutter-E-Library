// ignore_for_file: prefer_final_fields

import 'package:e_library/models/note.dart';
import 'package:flutter/material.dart';

class AddNote extends StatefulWidget {
  const AddNote({super.key});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  NoteStorage _noteStorage = NoteStorage();
  List<Note> _notes = [];
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadNotes();
  }

  Future<void> _loadNotes() async {
    List<Note> savedNotes = await _noteStorage.getNotes();
    setState(() {
      _notes = savedNotes;
    });
  }

  Future<void> _saveNote() async {
    if (_controller.text.isNotEmpty) {
      String content = _controller.text;
      Note newNote = Note(
        content: content,
      );

      // Add the new note to the list
      setState(() {
        _notes.add(newNote);
      });

      // Save the list to SharedPreferences
      await _noteStorage.saveNotes(_notes);

      // Clear the TextField
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Notes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Enter your note',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _saveNote,
              child: const Text('Save Note'),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _notes.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    subtitle: Text('${index + 1} \t ${_notes[index].content}'),
                    trailing: InkWell(
                        onTap: () {
                          _notes.removeAt(index);
                          setState(() {});
                        },
                        child: const Icon(Icons.delete)),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

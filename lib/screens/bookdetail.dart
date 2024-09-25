import 'package:e_library/models/book.dart';
import 'package:e_library/screens/readerscreen.dart';
import 'package:flutter/material.dart';

class BookDetailScreen extends StatelessWidget {
  final Book book;
  const BookDetailScreen({required this.book, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
      ),
      body: Column(
        children: [
          Image.network(book.coverImage),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(book.content),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ReaderScreen(book: book)));
              },
              child: const Text('Read')),
        ],
      ),
    );
  }
}

import 'package:e_library/models/book.dart';
import 'package:e_library/screens/addnote.dart';
import 'package:e_library/screens/bookdetail.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final List<Book> books = [
    Book(
        title: 'Flutter for Beginners',
        author: 'YoungDevs',
        coverImage:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRWiWY0E_du9TYa4Nd-XDhDJNjUrU6r6h31JQ&s',
        content: 'https://www.tutorialspoint.com/flutter/flutter_tutorial.pdf'),
    Book(
        title: 'Flutter for Beginners 2',
        author: 'YoungDevs',
        coverImage:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRWiWY0E_du9TYa4Nd-XDhDJNjUrU6r6h31JQ&s',
        content: 'https://www.tutorialspoint.com/flutter/flutter_tutorial.pdf'),
    Book(
        title: 'Flutter for Beginners 3',
        author: 'YoungDevs',
        coverImage:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRWiWY0E_du9TYa4Nd-XDhDJNjUrU6r6h31JQ&s',
        content: 'https://www.tutorialspoint.com/flutter/flutter_tutorial.pdf'),
    Book(
        title: 'Flutter for Beginners 4',
        author: 'YoungDevs',
        coverImage:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRWiWY0E_du9TYa4Nd-XDhDJNjUrU6r6h31JQ&s',
        content: 'https://www.tutorialspoint.com/flutter/flutter_tutorial.pdf'),
    Book(
        title: 'Flutter for Beginners 5',
        author: 'YoungDevs',
        coverImage:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRWiWY0E_du9TYa4Nd-XDhDJNjUrU6r6h31JQ&s',
        content: 'https://www.tutorialspoint.com/flutter/flutter_tutorial.pdf')
  ];
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('E-Library'),
        actions: [
          PopupMenuButton(
              itemBuilder: (context) => [
                    PopupMenuItem(
                        child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const AddNote()));
                            },
                            child: const Text('Add note')))
                  ])
        ],
      ),
      body: ListView.builder(
          itemCount: books.length,
          itemBuilder: (context, index) {
            final book = books[index];
            return ListTile(
              leading: Image.network(
                book.coverImage,
                width: 20,
                height: 20,
              ),
              title: Text(book.title),
              subtitle: Text('Author : ${book.author}'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BookDetailScreen(book: book)));
              },
            );
          }),
    );
  }
}

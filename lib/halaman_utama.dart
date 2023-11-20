import 'package:flutter/material.dart';
import 'package:latihan_responsi/list_blog.dart';
import 'package:latihan_responsi/list_report.dart';

import 'list_news.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menu App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HalamanUtama(),
    );
  }
}

class HalamanUtama extends StatelessWidget {
  final List<Menu> menus = [
    Menu('News', 'assets/news.png', 'Get an overview of the latest Spaceflight news, from various sources! Easily link your users to the right websites', PageListNews()),
    Menu('Blog', 'assets/blogs.png', 'Blogs often provide a more detailed overview of launches and missions. A must-have for the serious spaceflight enthusiast', PageListBlogs()),
    Menu('Reports', 'assets/reports.png', 'Space station and other missions often publish their data. With SNAPI, you can include it in your app as well!', PageListReports()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Utama'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: menus.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => menus[index].page,
                  ),
                );
              },
              title: Text(menus[index].name),
              subtitle: Text(menus[index].description),
              leading: Image.asset(
                menus[index].imagePath,
                width: 120,
                height: 120,
              ),
            ),
          );
        },
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final Menu menu;

  DetailPage({required this.menu});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(menu.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: menu.name,
              child: Image.asset(
                menu.imagePath,
                width: 150,
                height: 150,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Detail Page for ${menu.name}',
              style: TextStyle(fontSize: 30),
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ),
    );
  }
}



    class Menu {
      final String name;
      final String imagePath;
      final String description;
      final Widget page;

      Menu(this.name, this.imagePath, this.description, this.page);
    }
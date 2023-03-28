import 'package:flutter/material.dart';
import 'paste_link.dart';
import 'browse.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  List<Widget> pages = [PasteLink(), BrowserPage()]

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        elevation: 0.0,
        title: const Text('YT Downloader'),
      ),
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.paste,), label: 'Paste'),
          BottomNavigationBarItem(icon: Icon(Icons.network_cell,), label: 'Browse')
        ],
        selectedItemColor: Colors.redAccent,
        currentIndex: _currentIndex,
        onTap: (value){
          setState(() {
            _currentIndex = value;
          });
        },
      ),
    );
  }
}

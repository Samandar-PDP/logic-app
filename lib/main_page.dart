import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedRadio = 1;
  final _textController = TextEditingController();

  String enToUz(String en) {
    String uz = 'Not found';
    switch (en.toLowerCase()) {
      case 'apple':
        uz = 'olma';
        break;
      case 'book':
        uz = 'kitob';
      case 'code':
        uz = 'kod';
      case 'boy':
        uz = 'bola';
      case 'girl':
        uz = 'qiz';
    }
    return uz;
  }

  String uzToEn(String uz) {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Logic App")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            ListTile(
              leading: Radio(
                value: 1,
                groupValue: _selectedRadio,
                onChanged: (newValue) {
                  setState(() {
                    _selectedRadio = newValue!;
                  });
                },
              ),
              title: Text("UZ"),
            ),
            ListTile(
              leading: Radio(
                value: 2,
                groupValue: _selectedRadio,
                onChanged: (newValue) {
                  setState(() {
                    _selectedRadio = newValue!;
                  });
                },
              ),
              title: Text("EN"),
            ),
            TextField(
              controller: _textController,
              onChanged: (value) {
                ScaffoldMessenger.of(context).clearMaterialBanners();
              },
              decoration: InputDecoration(
                  hintText: _selectedRadio == 1 ? "Kiriting..." : "Input"
              ),
            ),
            CupertinoButton(child: Text(
                _selectedRadio == 1 ? "Bosish" : "Submit"
            ), onPressed: () {
              
              String text = _selectedRadio == 2 ? enToUz(_textController.text) : "Not found";
              
              ScaffoldMessenger.of(context)
                  .showMaterialBanner(
                  MaterialBanner(
                  content: Text(text),
                  actions: [
                    TextButton(onPressed: () {
                      ScaffoldMessenger.of(context).clearMaterialBanners();
                    }, child: Text("OK"))
                  ]));
            })
          ],
        ),
      ),
    );
  }
}

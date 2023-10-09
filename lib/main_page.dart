import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedRadio = 1;

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
            CupertinoButton(child: Text("Submit"), onPressed: () {
             ScaffoldMessenger.of(context)
                 .showMaterialBanner(MaterialBanner(
               backgroundColor: Colors.green,
                 content: Text(_selectedRadio == 1 ? "Salom" : "Hello"), actions: [
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

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FlutterTts flutterTts = new FlutterTts();
  TextEditingController _text = TextEditingController();
  double _pitch = 1.0;
  double _speechRate = 1.0;

  @override
  void initState() {
    super.initState();
  }

  Future _readText() async {
    print(await flutterTts.getLanguages);
    await flutterTts.setLanguage('en-GB');
    await flutterTts.setPitch(_pitch);
    await flutterTts.setSpeechRate(_speechRate);
    await flutterTts.speak(_text.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: SafeArea(
        top: false,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 100),
              Text(
                'Heyy Fantish',
                style: TextStyle(
                  fontFamily: 'monospace',
                  fontSize: 30,
                ),
              ),
              SizedBox(height: 50),
              TextField(
                controller: _text,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  border: OutlineInputBorder(),
                  fillColor: Colors.red,
                  suffixIcon: Icon(Icons.search),
                  labelText: 'Word',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              RaisedButton(
                padding: EdgeInsets.symmetric(vertical: 10),
                onPressed: () => _readText(),
                child: Text('Read', style: TextStyle(fontSize: 18)),
              ),
              SizedBox(height: 5),
              Divider(),
              Center(child: Text('Settings', style: TextStyle(fontSize: 18))),
              Slider(
                min: 0.5,
                max: 1.5,
                value: _pitch,
                onChanged: (newRating) {
                  setState(() {
                    _pitch = newRating;
                  });
                },
                label: 'Pitch',
              ),
              Slider(
                min: 0.1,
                max: 5,
                value: _speechRate,
                onChanged: (newRating) {
                  setState(() {
                    _speechRate = newRating;
                  });
                },
                label: '$_speechRate',
              )
            ],
          ),
        ),
      ),
    );
  }
}

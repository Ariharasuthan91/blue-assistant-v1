import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SpeechToText stt = SpeechToText();
  FlutterTts tts = FlutterTts();
  List<String> tasks = [];

  @override
  void initState() {
    super.initState();
    _loadTasks();
    _ttsSpeak("Hey Blue, I am here");
  }

  void _loadTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      tasks = prefs.getStringList('tasks') ?? [];
    });
  }

  void _saveTask(String t) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tasks.add(t);
    await prefs.setStringList('tasks', tasks);
    setState(() {});
    _ttsSpeak("Task saved: \$t");
  }

  void _listen() async {
    bool avail = await stt.initialize();
    if (avail) {
      await stt.listen(onResult: (val) {
        if (val.hasConfidenceRating && val.confidence > 0) {
          _saveTask(val.recognizedWords.toLowerCase());
        }
      });
    }
  }

  void _ttsSpeak(String t) {
    tts.setLanguage("en-US");
    tts.speak(t);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF001F3F),
      appBar: AppBar(title: Text('Blue Assistant')),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: _listen,
            child: Text('🎙 Speak Task'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (_, i) => ListTile(
                title: Text(tasks[i], style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:any_link_preview/any_link_preview.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late String _url;
  dynamic previewData;

  @override
  void initState() {
    _url = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              TextField(
                onChanged: (String value) {
                  setState(() {
                    _url = value;
                  });
                },
              ),
              Text("URL: $_url"),
              _url.isEmpty
                  ? Container()
                  : AnyLinkPreview(
                      link: _url,
                      displayDirection: UIDirection.uiDirectionHorizontal,
                      backgroundColor: Colors.grey[300],
                      errorWidget: Container(
                        color: Colors.grey[300],
                        child: const Text('Oops!'),
                      ),
                    ),
            ])));
  }
}

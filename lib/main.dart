import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        //試したいプラットフォームをセットする
        platform: TargetPlatform.iOS,
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final _thisPlatform = (Theme.of(context).platform).toString();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$_thisPlatform',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          StatelessWidget targetPlatformDialog;
          if (Theme.of(context).platform == TargetPlatform.iOS) {
            //View iOS Widget
            targetPlatformDialog = _dialogForiOS();
          } else if (Theme.of(context).platform == TargetPlatform.android) {
            //View Android Widget
            targetPlatformDialog = _dialogForAndroid();
          }else {
            return;
          }
          showDialog(
              context: context,
              builder: (context) {
                return targetPlatformDialog;
              });
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _dialogForiOS() {
    //iOSっぽいUIセット　リファレンス:https://api.flutter.dev/flutter/cupertino/CupertinoAlertDialog-class.html
    return CupertinoAlertDialog(
        title: Text("Dialog"),
        content: Text("iOSっぽいUIのダイアログ"),
        actions: <Widget>[
          CupertinoDialogAction(
            child: const Text("yes"),
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          CupertinoDialogAction(
            child: const Text("no"),
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ]);
  }

  Widget _dialogForAndroid() {
    //Androidっぽいダイアログ　リファレンス:https://flutter.ctrnost.com/basic/dialogs/simpledialog/
    return AlertDialog(
        title: Text("Dialog"),
        content: Text("AndroidっぽいUIのダイアログ"),
        actions: <Widget>[
          FlatButton(
            child: const Text("yes"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          FlatButton(
            child: const Text("no"),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ]);
  }
}

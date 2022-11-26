import 'package:flutter/material.dart';

void main() {
  runApp(const MyHomePage());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Demo',
//       themeMode: ThemeMode.light,
//       theme: ThemeData(primarySwatch: Colors.teal, canvasColor: Colors.white),
//       darkTheme:
//           ThemeData(primarySwatch: Colors.teal, canvasColor: Colors.black),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool js = false;
  bool cSharp = false;
  bool py = false;
  bool sw = false;
  // Color w = Colors.white;
  Color b = Colors.black;
  String get txt {
    String str = 'You Selected \n';
    if (js == true) {
      str += 'Javascript \n';
    }
    if (cSharp == true) {
      str += 'C# \n';
    }
    if (py == true) {
      str += 'Python \n';
    }
    return str;
  }

  var tm = ThemeMode.light;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Demo',
      themeMode: tm,
      theme: ThemeData(primarySwatch: Colors.teal, canvasColor: Colors.white),
      darkTheme:
          ThemeData(primarySwatch: Colors.teal, canvasColor: Colors.black),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Demo App'),
        ),
        // body: buildCheckboxListTile(context),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(40.0),
                child: Text(
                  'Light',
                  style: TextStyle(
                      color: b,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
              ),
              Switch(
                activeColor: Colors.black,
                inactiveThumbColor: Colors.white,
                value: sw,
                onChanged: (value) {
                  setState(() {
                    sw = value;

                    if (sw == false) {
                      tm = ThemeMode.light;
                      b = Colors.black;
                    } else {
                      tm = ThemeMode.dark;
                      b = Colors.white;
                    }
                  });
                },
              ),
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Text(
                  'Dark',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: b,
                      fontStyle: FontStyle.italic),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding buildCheckboxListTile(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Select All The Programming Languages You Knows : ',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: Theme.of(context).primaryColor),
          ),
          CheckboxListTile(
              title: const Text('Javascript'),
              subtitle: const Text('Language No.1'),
              value: js,
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (val) {
                setState(() {
                  js = val as bool;
                });
              }),
          CheckboxListTile(
              title: const Text('C#'),
              subtitle: const Text('Language No.2'),
              value: cSharp,
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (val) {
                setState(() {
                  cSharp = val as bool;
                });
              }),
          CheckboxListTile(
              title: const Text('Python'),
              subtitle: const Text('Language No.3'),
              value: py,
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (val) {
                setState(() {
                  py = val as bool;
                });
              }),
          const Padding(padding: EdgeInsets.only(top: 5.0)),
          ElevatedButton(
              onPressed: (() {
                showDialog(
                  context: context,
                  builder: (c) => AlertDialog(
                    // showDialog(
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Thank you for choose it',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const Padding(padding: EdgeInsets.only(top: 10)),
                        Text(
                          txt,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor),
                        ),
                      ],
                    ),
                  ),
                );
              }),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [Text('Submit'), Icon(Icons.ads_click)],
              ))
        ],
      ),
    );
  }
}

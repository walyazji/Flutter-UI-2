import 'dart:io';

import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyHomePage());
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _messangerKey = GlobalKey<ScaffoldMessengerState>();
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

  Text title = const Text('Demo App');
  var tm = ThemeMode.light;
  String? _selectedLetter;
  List _letterItems = ['A', 'B', 'C', 'D'];
  final _key = GlobalKey<ScaffoldMessengerState>();
  final ImagePicker _picker = ImagePicker();
  File? pickedImage;
  fetchImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image == null) {
      return;
    }
    setState(() {
      pickedImage = File(image.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: _key,
      debugShowCheckedModeBanner: false,
      title: 'Demo',
      themeMode: tm,
      theme: ThemeData(primarySwatch: Colors.teal, canvasColor: Colors.white),
      darkTheme:
          ThemeData(primarySwatch: Colors.teal, canvasColor: Colors.black),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: title,
          leading: const Icon(Icons.home),
          actions: [
            sw == false
                ? const Icon(Icons.light_mode)
                : const Icon(Icons.dark_mode),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
              ],
            ),
          ],
        ),
        // body: buildCheckboxListTile(context),
        // body: buildSwitch(),
        // body: buildDropdownButton(),
        // body: buildExpansionTile(context),
        // body: buildMarquee(),
        // body: buildImagePicker(),
        body: Center(
            child: ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext ctx) {
                        return AlertDialog(
                          title: const Text('Select a color'),
                          content: Column(
                            children: <Widget>[
                              // const SingleChildScrollView(
                              //   child: null,
                              // ),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(ctx);
                                  },
                                  child: const Text('Close'))
                            ],
                          ),
                        );
                      });
                },
                child: const Text('Change My Color'))),

        // floatingActionButton: FloatingActionButton(
        //   onPressed: fetchImage,
        //   tooltip: 'Increment',
        // child: const Icon(Icons.add),
        // ),
      ),
    );
  }

  Center buildImagePicker() {
    return Center(
      child: pickedImage == null ? null : Image.file(pickedImage!),
    );
  }

  ListView buildMarquee() {
    return ListView(
      children: [
        const SizedBox(height: 15),
        SizedBox(
          height: 70,
          child: Card(
            color: Colors.teal,
            child: Marquee(
              text: 'Hello for You in My Store',
              blankSpace: 200,
              // startPadding: 1,
              style: const TextStyle(
                fontSize: 25,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
              accelerationDuration: const Duration(milliseconds: 1500),
            ),
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 70,
          child: Card(
            color: Colors.teal,
            child: Marquee(
              text: 'Go out !',
              blankSpace: 200,
              textDirection: TextDirection.rtl,
              scrollAxis: Axis.horizontal,
              // startPadding: 1,
              style: const TextStyle(
                fontSize: 25,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
              accelerationDuration: const Duration(milliseconds: 1500),
            ),
          ),
        ),
      ],
    );
  }

  ListView buildExpansionTile(BuildContext context) {
    return ListView(children: [
      Padding(
        padding: const EdgeInsets.only(top: 5),
        child: ExpansionTile(
          leading: const Icon(
            Icons.perm_identity,
            color: Colors.teal,
          ),
          title: const Text(
            'Account',
            style: TextStyle(fontSize: 25, color: Colors.teal),
          ),
          children: [
            Divider(color: Theme.of(context).primaryColor),
            const ListTile(
              leading: Icon(Icons.add),
              trailing: Icon(Icons.arrow_forward_ios),
              title: Text('Sign Up!'),
              subtitle: Text('Where you can Register An Account'),
              // onTap: buildSnackbar(),
            ),
            const ListTile(
              leading: Icon(Icons.account_circle),
              trailing: Icon(Icons.arrow_forward_ios),
              title: Text('Sign In!'),
              subtitle: Text('Where you can Login with Your Account'),
              // onTap: buildSnackbar(),
            ),
          ],
        ),
      ),
      const SizedBox(height: 10),
      ExpansionTile(
        leading: const Icon(
          Icons.message,
          color: Colors.teal,
        ),
        title: const Text('More Information',
            style: TextStyle(fontSize: 25, color: Colors.teal)),
        children: [
          Divider(color: Theme.of(context).primaryColor),
          const ListTile(
            leading: Icon(Icons.phone),
            trailing: Icon(Icons.arrow_forward_ios),
            title: Text('Contact'),
            subtitle: Text('Where you can Call Us'),
            // onTap: buildSnackbar,
          ),
        ],
      ),
    ]);
  }

  Center buildDropdownButton() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('select any number'),
          const SizedBox(
            width: 5,
          ),
          DropdownButton(
            // hint: const Text('select letter'),
            value: _selectedLetter,
            items: _letterItems.map((item) {
              return DropdownMenuItem(
                value: item,
                child: Text(item),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _selectedLetter = value as String;
              });
            },
          ),
        ],
      ),
    );
  }

  Center buildSwitch() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(40.0),
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

  buildSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text(
        'Now we direct you to Sign Up page',
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.teal,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 1),
    ));
  }
}

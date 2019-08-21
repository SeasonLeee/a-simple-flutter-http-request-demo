import 'package:flutter/material.dart';

import 'package:http/http.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Suck it!'),
        ),
        body: BasicForm()
      ),
    );
  }
}

class BasicForm extends StatefulWidget {

  @override
  _BasicFormState createState() => _BasicFormState();
}

class _BasicFormState extends State {
  final myController = TextEditingController();

  _simpleRequest() async {
    String url = 'http://192.168.43.133:2121/user';

    Response response = await post(url);

    int statusCode = response.statusCode;

    if (statusCode == 200) {

    }

    String body = response.body;

    print(body);
  }

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: <Widget>[
        Flexible(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                TextField(
                  controller: myController,
                  decoration: InputDecoration(
                      labelText: 'Say something'
                  ),
                ),
                SizedBox(height: 8.0,),
                RaisedButton(
                  child: Text('Post it'),
                  color: Colors.lightBlue,
                  onPressed: () {
                    _simpleRequest();
                  },
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

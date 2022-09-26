import 'package:flutter/material.dart';

int calc(input) {
var words=0;
input=input.toString().split(" ");

for (int i=0;i<input.length;i++) {
if (input[i].contains('a') || input[i].contains('A')  ) words++;
}
return words;
}

class MyForm extends StatefulWidget {
   const MyForm({super.key});


  @override
  State<StatefulWidget> createState() => MyApp();
}

class MyApp extends State {
  final _formKey = GlobalKey<FormState>();

  final myController = TextEditingController();
  final textController = TextEditingController();
  int wordsSum = 0;

  @override
  Widget build(BuildContext context) {
    return Form(

      key: _formKey, child: Column(
          children: <Widget>[
             const Text(
              'lab2',
              style: TextStyle(fontSize: 20.0),
            ),
            TextFormField(
              decoration:
              const InputDecoration(labelText: 'Introduceti textul'),
              controller: myController,
            ),
              TextButton(
              onPressed: () {
                //pass form input to calc function
                wordsSum = calc(myController.text);
                textController.text = "In textul introdus sunt: $wordsSum cuvinte ce contin A sau a";

              },
              child: const Text('Calculeaza')
            ),
            TextField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              style: const TextStyle(fontSize: 20.0),
                controller:textController,
            ),
          ],
        ));
  }}

void main() {
  runApp(MaterialApp(
    title: 'lab2',
    home: Scaffold(
      appBar: AppBar(
        title: const Text('lab2'),
      ),
      body: const MyForm(),
    ),
  ));
}


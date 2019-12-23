import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
String _selectedId;
  @override
  Widget build(BuildContext context) {    
    return new Scaffold(
        appBar: new AppBar(
          title: const Text("Test"),
        ),
        body: Container(
            color: Colors.white,
            child: ListTile(
              title: Text(
                _selectedId ?? 'One',
                style: TextStyle(color: Colors.blue),
              ),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: (){
                showDialog(
                context: context,
                child: new MyDialog(
                  onValueChange: _onValueChange,
                  initialValue: _selectedId,
                ));
              },
            ),
          ),
        );
  }
    
  
  void _onValueChange(String value) {
    setState(() {
      _selectedId = value;
    });
  }
  
}



class MyDialog extends StatefulWidget {
  const MyDialog({this.onValueChange, this.initialValue});

  final String initialValue;
  final void Function(String) onValueChange;

  @override
  State createState() => new MyDialogState();
}

class MyDialogState extends State<MyDialog> {
      
  // Default Radio Button Selected Item.
  String radioItemHolder = 'One';
 
  // Group Value for Radio Button.
  int id = 1;
  
  
  @override
  void initState() {
    super.initState();
  }
 
  List<NumberList> nList = [
    NumberList(
      index: 1,
      number: "One",
    ),
    NumberList(
      index: 2,
      number: "Two",
    ),
    NumberList(
      index: 3,
      number: "Three",
    ),
    NumberList(
      index: 4,
      number: "Four",
    ),
    NumberList(
      index: 5,
      number: "Five",
    ),
  ];

  Widget build(BuildContext context) {
    return new AlertDialog(
      content: Column(
        children: <Widget>[
        new Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
        children: <Widget>[
          
           Padding(
            padding : EdgeInsets.all(14.0),
            child: Text('Selected Item = '+'$radioItemHolder', style: TextStyle(fontSize: 23))
              ),
 
          Column(
              children: 
                nList.map((data) => RadioListTile(
                  title: Text("${data.number}"),
                  groupValue: id,
                  value: data.index,
                  onChanged: (val) {
                    setState(() {
                      radioItemHolder = data.number ;
                      id = data.index;
                    });
                  },
                )).toList(),
            ),                   
        ],
    ),),
      ],
    ),
     actions: <Widget>[
          FlatButton(
            child: const Text('CANCEL'),
            onPressed: () {
              
            },
          ),
          FlatButton(
            child: const Text('OK'),
            onPressed: () {
              widget.onValueChange(radioItemHolder);
              Navigator.pop(context);
            },
          )
        ],);
  }
}

class NumberList {
  String number;
  int index;
  NumberList({this.number, this.index});
  
}


import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final db=FirebaseDatabase.instance.reference();
  var a=1;
  @override
  void initState() {
    super.initState();
    setState(() {
      readData();

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Home")),
      ),
      body: Column(
        children: [
          Card(
            child: Container(
              color: Colors.blue[200],
              padding: EdgeInsets.only(top: 45,bottom: 45,left: 20,right: 20),
              height: 250,
              width: 200,
              child: Stack(
                fit: StackFit.expand,
                children:[
                  CircularProgressIndicator(
                    backgroundColor: Colors.white,
                    value: a/100,
                    strokeWidth: 20,
                    color: Colors.green,
                  ),
                  Center(child: Text(a.toString()+"%",style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),))
                ],),
            ),
          ),
          Container(
            child: ElevatedButton (
              onPressed: (){

              },
              child: Text("Submit"),
            ),
          )
        ],
      ),
    );
  }
  void readData(){
    db.child('temp')
        .onValue.listen((event) {
      var snapshot = event.snapshot;
      setState(() {
        a = snapshot.value;
        print('Value is $a');
      });
    });
  }
}


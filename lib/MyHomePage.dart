import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sampleone/model/counter.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Counter counter = Counter();
  bool three = false;
  void _incrementCounter() {
    if(counter.count>0){
      setState(() {
        counter.decrementCounter();
      });
    }else{
      print("its Zero");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My App'),
      ),
      body: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.red.shade100,
          ),
          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
          margin: EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height * 0.8,
          width: MediaQuery.of(context).size.width * 0.8,
          child: Visibility(
            visible: true,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(counter.count.toString()),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Icon(Icons.opacity),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: _incrementCounter,
                    child: Text("elevated button"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextButton(
                    onPressed: () {
                      print("Text Button");
                    },
                    child: Text("Text button"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  IconButton(
                      onPressed: () {
                        print("icon button");
                      },
                      icon: Icon(Icons.add)),
                  SizedBox(
                    height: 20,
                  ),
                  my_button("one"),
                  SizedBox(
                    height: 20,
                  ),
                  my_button("two"),
                  SizedBox(
                    height: 20,
                  ),
                  three ? my_button("three"):Container(),
                  Image.asset('assets/images/flutter.jpg',height: 140, width: 200,)
                ],
              ),
            ),
          )),
    );
  }

  my_button(String btn_name){
    return GestureDetector(
      onTap: (){
        setState(() {
          three = true;
        });
        if(btn_name == "one"){
          setState(() {
            three = false;
          });
        }
        print("GestureDetector $btn_name");
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.green,
        ),
        child: Text(btn_name),
      ),
    );
  }
}

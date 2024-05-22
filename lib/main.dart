import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const BasicsPage(),
    );
  }
}

class BasicsPage extends StatelessWidget {
  const BasicsPage({super.key});


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var platform = Theme.of(context).platform;
    print("size: $size");
    print("platform: $platform");
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.height,
        color: Colors.yellow,
        // margin: const EdgeInsets.all(25),
        // padding: EdgeInsets.all(50),
        child: Center(
          child: cardWithImage(size)
        )
      ),
    );
  }

  Card cardWithContainer(){
    return Card(
      elevation: 7.5,
      color: Colors.red,
      margin: const EdgeInsets.all(10),
      child: Container(
        height: 150,
        width: 300,
        color: Colors.grey,
        child: simpleText("Je suis dans une card"),
      ),
    );
  }

  Card cardWithImage(Size size) {
    return Card(
        elevation: 7.5,
        color: Colors.red,
        margin: const EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: imageCenterAsset(size),
        )
    );
  }

  Text simpleText(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 30,
        fontWeight: FontWeight.w800,
        fontStyle: FontStyle.italic,
      ),
      textAlign: TextAlign.center,
    );
  }

  Center simpleCenter() {
    return Center(
      child: Container(
        width: 80,
        height: 80,
        color: Colors.pinkAccent,
        child: Center(
          child: Container(
            width: 40,
            height: 40,
            color: Colors.teal,
          ),
        ),
      ),
    );
  }

  Center iconCenter() {
    return const Center(
      child: Icon(
        Icons.house,
        size: 80,
        color: Colors.blueAccent,
        semanticLabel: "Ceci est une maison",
      ),
    );
  }

  Center imageCenterNetwork() {
    return Center(
      child: Image.network(
          "https://images.pexels.com/photos/1756086/pexels-photo-1756086.jpeg?auto=compress&cs=tinysrgb&w=600",
        height: 300,
        width: 200,
        fit: BoxFit.fill,

      ),
    );
  }

  Center imageCenterAsset(Size size) {
    return Center(
      child: Image.asset(
        "images/beach.jpg",
        fit: BoxFit.cover,
        height: size.height,
        width: size.width,
      ),
    );
  }

  Text spanDemo() {
    return const Text.rich(
        TextSpan(
            text: "Hola",
            style: TextStyle(
                color: Colors.red,
                fontSize: 30
            ),
            children: [
              TextSpan(
                  text: "Second style",
                  style: TextStyle(fontSize: 30, color: Colors.grey)
              ),
              TextSpan(
                  text: "A l'infini",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.blue
                  )
              ),
            ]
        )
    );
  }
}



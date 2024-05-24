import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
    // print("size: $size");
    // print("platform: $platform");
    return Scaffold(
      appBar: myFirstAppBar(),
      body: Container(
        height: size.height,
        width: size.height,
        color: Colors.white,
        // margin: const EdgeInsets.all(25),
        // padding: EdgeInsets.all(50),
        child: Center(
          child: cardWithImage(size)
        )
      ),
    );
  }

  AppBar myFirstAppBar(){
    return AppBar(
      title: const Text("Mon app basique", style: TextStyle(color: Colors.white),),
      backgroundColor: Colors.teal,
      leading: const Icon(Icons.adb, color: Colors.white,),
      actions: const [
        Icon(Icons.handyman, color: Colors.white,),
        Icon(Icons.border_color, color: Colors.white,)
      ],
      centerTitle: true,
      elevation: 7.5,
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
        color: Colors.tealAccent,
        margin: const EdgeInsets.all(10),
        child: SizedBox(
          height: 800,
          width: 400,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: myFirstColumn(size),
            ),
          ),
        ),
    );
  }

  Column myFirstColumn(Size size) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          "Test de la colonne",
          style: TextStyle(
              color: Colors.deepPurpleAccent,
              fontSize: 15,
              fontWeight: FontWeight.w900
          ),
        ),
        myFirstStack(size),
        const Divider(
          color: Colors.teal,
          thickness: 2,
        ),
        Container(
          margin: const EdgeInsets.all(20),
          height: 200,
          width: size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/beach2.jpg"),
              fit: BoxFit.cover
            ),
            boxShadow: [
              BoxShadow(
                  color: Colors.teal,
                offset: Offset(2, 2),
                blurRadius: 2,
                spreadRadius: 5
              )
            ],
            borderRadius: BorderRadius.all(Radius.circular(15))
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          color: Colors.teal,
          child: rowCircleAvatar(),
        ),

        imageCenterNetwork(),
        spanDemo(),
        imageCenterNetwork()
      ],
    );
  }
  
  Stack myFirstStack(Size size) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        imageCenterAsset(height: 200, width: size.width),
        Padding(
          padding: const EdgeInsets.only(top: 140),
          child: profilePicture(radius: 60),
        ),
        const Row(
          children: [
            Icon(Icons.favorite),
            Icon(Icons.height),
            Spacer(),
            Text(
              "BLABLABLA !!!",
              style: TextStyle(
                  color: Colors.teal,
                  fontSize: 20,
                  fontWeight: FontWeight.w900
              ),
            ),

          ],
        )

      ],
    );
  }

  CircleAvatar profilePicture({required double radius}){
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.tealAccent,
      foregroundImage: const AssetImage("images/cestmoi.png"),
    );
  }

  Row rowCircleAvatar(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.max,
      children: [
        // imageCenterAsset(height: 180, width: 100),
        profilePicture(radius: 30),
        Expanded(
            child: simpleText("Hey ! C'est moi dans une row")
        ),
        const CircleAvatar(
          radius: 30,
          foregroundImage: NetworkImage("https://ih1.redbubble.net/image.175911116.4459/mwo,x1000,ipad_2_snap-pad,750x1000,f8f8f8.u1.jpg"),
        )
      ],
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
        // height: 620,
        // width: 330,
        // fit: BoxFit.fill,
        height: 200,

      ),
    );
  }

  Center imageCenterAsset({required double height, required double width }) {
    return Center(
      child: Image.asset(
        "images/beach.jpg",
        fit: BoxFit.cover,
        height: height,
        width: width,
      ),
    );
  }

  Text spanDemo() {
    return const Text.rich(
        TextSpan(
            text: "Hola",
            style: TextStyle(
                color: Colors.red,
                fontSize: 20
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



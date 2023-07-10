import 'package:flutter/material.dart';
import 'package:shop_now/Models/Productlist.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: ProdustListing.phoneList.length,
          itemBuilder: (BuildContext context, index) {
            final data = ProdustListing.phoneList[index];
            return Column(
              children: [
                Text(ProdustListing.phoneList[index].title.toString()),
                Container(
                    height: 100,
                    width: 100,
                    child: Image(
                        fit: BoxFit.cover, image: AssetImage(data.imageUrl2!))),
              ],
            );
          },
        ),
      ),
    );
  }
}

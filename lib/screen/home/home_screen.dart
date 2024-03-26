import 'package:festival/model/festival_wishes.dart';
import 'package:flutter/material.dart';

import '../../utilitis/global_details.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    g1.create();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Festival Post",
          style: TextStyle(
            color: Colors.redAccent,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, 'personal');
            },
            icon: const Icon(
              Icons.person,
              size: 30,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              right: 10,
            ),
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: g1.festivaldetail.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              MaptoModel data = g1.festivaldetail[index];
              Navigator.pushNamed(context, 'edit', arguments: data);
            },
            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.90,
              color: Colors.red,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              child: Text("${g1.festivaldetail[index].wishes}"),
            ),
          );
        },
      ),
    );
  }
}

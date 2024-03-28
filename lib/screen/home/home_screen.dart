import 'dart:io';
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
        backgroundColor: const Color(0xff6639B8),
        title: const Text(
          "Home",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, 'personal').then((value) {
                setState(() {});
              });
            },
            icon: g1.image == null
                ? const Icon(
                    Icons.person,
                    size: 30,
                    color: Colors.white,
                  )
                : CircleAvatar(
                    backgroundImage: FileImage(
                      File("${g1.image}"),
                    ),
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
          mainAxisExtent: 220,
        ),
        itemCount: g1.festivaldetail.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              if (index == 0) {
                Map m1 = g1.festivalname[index];
                Navigator.pushNamed(context, 'post',
                    arguments: [m1, g1.holi, g1.holimage]);
              } else if (index == 1) {
                Map m1 = g1.festivalname[index];
                Navigator.pushNamed(context, 'post',
                    arguments: [m1, g1.dussehra, g1.dussehraimage]);
              } else if (index == 2) {
                Map m1 = g1.festivalname[index];
                Navigator.pushNamed(context, 'post',
                    arguments: [m1, g1.raksha, g1.rakhsaimage]);
              } else if (index == 3) {
                Map m1 = g1.festivalname[index];
                Navigator.pushNamed(context, 'post',
                    arguments: [m1, g1.uttarayan, g1.utrryanimage]);
              } else if (index == 4) {
                Map m1 = g1.festivalname[index];
                Navigator.pushNamed(context, 'post',
                    arguments: [m1, g1.diwali, g1.diwaliimage]);
              }
            },
            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.90,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xff6639B8),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Image.asset(
                    "${g1.festivaldetail[index].image}",
                    height: 150,
                    fit: BoxFit.fill,
                  ),
                  const Spacer(),
                  Text(
                    "${g1.festivaldetail[index].festival}",
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

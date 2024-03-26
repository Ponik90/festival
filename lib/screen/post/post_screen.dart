import 'package:festival/model/festival_wishes.dart';
import 'package:flutter/material.dart';

import '../../utilitis/global_details.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    Map m1 = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff6639B8),
        title: Text(
          "${m1['festival']} ",
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
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
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.red.shade200,
                  border: Border.all(
                    color: Colors.redAccent,
                    width: 2,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      spreadRadius: 2,
                      blurRadius: 1,
                      color: Colors.redAccent,
                    )
                  ]),
              child: Text(
                "${g1.festivaldetail[index].wishes}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
            ),
          );
        },
      ),
    );
  }
}

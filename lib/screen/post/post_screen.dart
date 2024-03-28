import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    List list = ModalRoute.of(context)!.settings.arguments as List;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff6639B8),
        title: Text(
          "${list[0]['festival']} ",
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
        itemCount: list[1].length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Map data = list[1][index];
              Navigator.pushNamed(context, 'edit', arguments: [data, list[2]]);
            },
            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.90,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: const Color(0xff7252a4),
                border: Border.all(
                  color: const Color(0xff6639B8),
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    spreadRadius: 2,
                    blurRadius: 1,
                    color: Color(0xff6639B8),
                  ),
                ],
              ),
              child: Text(
                "${list[1][index]['wishes']}",
                style: const TextStyle(
                  color: Colors.white,
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

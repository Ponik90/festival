import 'package:festival/model/festival_wishes.dart';
import 'package:flutter/material.dart';

class EditPostScreen extends StatefulWidget {
  const EditPostScreen({super.key});

  @override
  State<EditPostScreen> createState() => _EditPostScreenState();
}

class _EditPostScreenState extends State<EditPostScreen> {
  List<Color> changecolor = [Colors.black,Colors.white,...Colors.primaries];
  List<Color> changebg = [Colors.black,Colors.white,...Colors.accents];
  Color textcolor = Colors.black;
  Color bgcolor = Colors.amberAccent;
  bool istext=true;
  @override
  Widget build(BuildContext context) {
    MaptoModel data = ModalRoute.of(context)!.settings.arguments as MaptoModel;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Edit post",
          style: TextStyle(
            color: Colors.redAccent,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.sizeOf(context).width,
            width: MediaQuery.sizeOf(context).width,
            color: bgcolor,
            child: Text("${data.wishes}",style: TextStyle(color: textcolor,),),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton.extended(
                onPressed: () {
                  setState(() {
                    istext=true;
                  });
                },
                label: const Text("Text"),
                icon: const Icon(Icons.text_format_sharp),
                backgroundColor: Colors.blue,
                elevation: 2,
              ),
              FloatingActionButton.extended(
                onPressed: () {
                  setState(() {
                    istext=false;
                  });
                },
                label: const Text("Background"),
                icon: const Icon(Icons.image_sharp),
                backgroundColor: Colors.blue,
                elevation: 2,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Visibility(
            visible: istext,
            child: SizedBox(
              height: 50,
              child: ListView.builder(
                itemCount: changecolor.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        textcolor=changecolor[index];
                      },);
                    },
                    child: Container(
                      width: 50,
                      margin: const EdgeInsets.only(right: 5,),

                      decoration: BoxDecoration(
                          color: changecolor[index],
                        border: Border.all(width: 2,),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Visibility(
            visible: !istext,
            child: SizedBox(
              height: 50,
              child: ListView.builder(
                itemCount: changebg.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        bgcolor=changebg[index];
                      },);
                    },
                    child: Container(
                      width: 50,
                      margin: const EdgeInsets.only(right: 5,),

                      decoration: BoxDecoration(
                        color: changebg[index],
                        border: Border.all(width: 2,),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

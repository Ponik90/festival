import 'package:festival/model/festival_wishes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;

import 'package:image_gallery_saver/image_gallery_saver.dart';

class EditPostScreen extends StatefulWidget {
  const EditPostScreen({super.key});

  @override
  State<EditPostScreen> createState() => _EditPostScreenState();
}

class _EditPostScreenState extends State<EditPostScreen> {
  List<Color> changecolor = [Colors.black, Colors.white, ...Colors.primaries];
  List<Color> changebg = [Colors.black, Colors.white, ...Colors.accents];
  Color textcolor = Colors.black;
  Color bgcolor = Colors.amberAccent;
  Color bordercolor = Colors.black;
  bool istext = true;
  GlobalKey repaintkey= GlobalKey();

  @override
  Widget build(BuildContext context) {
    MaptoModel data = ModalRoute.of(context)!.settings.arguments as MaptoModel;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff6639B8),
        title: const Text(
          "Edit post",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
              RenderRepaintBoundary boundry = repaintkey.currentContext!.findRenderObject() as RenderRepaintBoundary;
              ui.Image image= await boundry.toImage();
              ByteData? bytedata = await image.toByteData(format: ui.ImageByteFormat.png);
              Uint8List data =bytedata!.buffer.asUint8List();

              await ImageGallerySaver.saveImage(data);
            },
            icon: const Icon(
              Icons.download,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.share,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () async {
              await Clipboard.setData(
                ClipboardData(text: "${data.wishes}"),
              );
            },
            icon: const Icon(
              Icons.copy,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          RepaintBoundary(
            key: repaintkey,
            child: Container(
              height: MediaQuery.sizeOf(context).width,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                color: bgcolor,
                border: Border.all(
                  width: 2,
                  color: bordercolor,
                ),
              ),
              alignment: Alignment.center,
              child: SelectableText(
                "${data.wishes}",
                style: TextStyle(
                  color: textcolor,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton.extended(
                heroTag: "a1",
                onPressed: () {
                  setState(() {
                    istext = true;
                  });
                },
                label: const Text("Text"),
                icon: const Icon(Icons.text_format_sharp),
                backgroundColor: Colors.blue,
                elevation: 2,
              ),
              FloatingActionButton.extended(
                heroTag: "a2",
                onPressed: () {
                  setState(() {
                    istext = false;
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
          //text
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
                      setState(
                        () {
                          textcolor = changecolor[index];
                        },
                      );
                    },
                    child: Container(
                      width: 50,
                      margin: const EdgeInsets.only(
                        right: 5,
                      ),
                      decoration: BoxDecoration(
                        color: changecolor[index],
                        border: Border.all(
                          width: 2,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          //background
          Visibility(
            visible: !istext,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                      itemCount: changebg.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            setState(
                              () {
                                bgcolor = changebg[index];
                              },
                            );
                          },
                          child: Container(
                            width: 50,
                            margin: const EdgeInsets.only(
                              right: 5,
                            ),
                            decoration: BoxDecoration(
                              color: changebg[index],
                              border: Border.all(
                                width: 2,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                      itemCount: changebg.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            setState(
                              () {
                                bordercolor = changebg[index];
                              },
                            );
                          },
                          child: Container(
                            width: 50,
                            margin: const EdgeInsets.only(
                              right: 5,
                            ),
                            decoration: BoxDecoration(
                              color: changebg[index],
                              border: Border.all(
                                width: 2,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

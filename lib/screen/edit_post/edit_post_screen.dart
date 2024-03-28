import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../utilitis/global_details.dart';

class EditPostScreen extends StatefulWidget {
  const EditPostScreen({super.key});

  @override
  State<EditPostScreen> createState() => _EditPostScreenState();
}

class _EditPostScreenState extends State<EditPostScreen> {
  List<Color> changecolor = [Colors.black, Colors.white, ...Colors.primaries];
  List<Color> changebg = [Colors.black, Colors.white, ...Colors.accents];

  String image = "assets/bgimage/holi1.jpg";
  Color textcolor = Colors.black;
  Color bgcolor = Colors.amberAccent;
  Color bordercolor = Colors.black;
  bool istext = true;
  GlobalKey repaintkey = GlobalKey();
  bool isimage = false;

  @override
  Widget build(BuildContext context) {
    List data = ModalRoute.of(context)!.settings.arguments as List;
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
              RenderRepaintBoundary boundry = repaintkey.currentContext!
                  .findRenderObject() as RenderRepaintBoundary;
              ui.Image image = await boundry.toImage();
              ByteData? bytedata =
                  await image.toByteData(format: ui.ImageByteFormat.png);
              Uint8List data = bytedata!.buffer.asUint8List();

              await ImageGallerySaver.saveImage(data);
            },
            icon: const Icon(
              Icons.download,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () async {
              RenderRepaintBoundary boundry = repaintkey.currentContext!
                  .findRenderObject() as RenderRepaintBoundary;
              ui.Image image = await boundry.toImage();
              ByteData? bytedata =
                  await image.toByteData(format: ui.ImageByteFormat.png);
              Uint8List data = bytedata!.buffer.asUint8List();

              Directory dir = await getTemporaryDirectory();
              File f1 = await File("${dir.path}/image.jpg").writeAsBytes(data);
              await ImageGallerySaver.saveFile(f1.path);
              await Share.shareXFiles([XFile(f1.path)]);
            },
            icon: const Icon(
              Icons.share,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () async {
              await Clipboard.setData(
                ClipboardData(text: "${data[0]['wishes']}"),
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
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Visibility(
                    visible: isimage,
                    child: Image.asset(
                      image,
                      fit: BoxFit.fill,
                      height: MediaQuery.sizeOf(context).width,
                      width: MediaQuery.sizeOf(context).width,
                    ),
                  ),

                  SelectableText(
                    "${data[0]['wishes']}",
                    style: TextStyle(
                      color: textcolor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [

                      Text("${g1.name}")
                    ],
                  ),
                ],
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
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Change Text Color ",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
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
                ],
              ),
            ),
          ),
          //background
          Visibility(
            visible: !istext,
            child: Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Change Background Color ",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
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
                                    isimage = false;
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
                        height: 10,
                      ),
                      const Text(
                        "Change Border Color ",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
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
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Change Image Color ",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 80,
                        child: ListView.builder(
                          itemCount: data[1].length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                setState(
                                  () {
                                    isimage = true;
                                    image = data[1][index];
                                  },
                                );
                              },
                              child: Container(
                                width: 80,
                                margin: const EdgeInsets.only(
                                  right: 5,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 2,
                                  ),
                                ),
                                child: Image.asset(
                                  data[1][index],
                                  fit: BoxFit.fill,
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
            ),
          ),
        ],
      ),
    );
  }
}

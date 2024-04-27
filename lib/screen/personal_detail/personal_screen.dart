import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../utilitis/global_details.dart';

class PersonalScreen extends StatefulWidget {
  const PersonalScreen({super.key});

  @override
  State<PersonalScreen> createState() => _PersonalScreenState();
}

class _PersonalScreenState extends State<PersonalScreen> {
  TextEditingController txtname = TextEditingController();
  TextEditingController txtemail = TextEditingController();
  TextEditingController txtphone = TextEditingController();
  TextEditingController txtadd = TextEditingController();

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool iscontact = true;

  String path = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Enter your detail",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xff6639B8),
        centerTitle: true,
      ),
      body: Form(
        key: formkey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    path.isEmpty
                        ? const CircleAvatar(
                            maxRadius: 50,
                            child: Icon(
                              Icons.perm_identity,
                              size: 50,
                            ),
                          )
                        : CircleAvatar(
                            maxRadius: 50,
                            backgroundImage: FileImage(
                              File(path),
                            ),
                          ),
                    InkWell(
                      onTap: () async {
                        ImagePicker picker = ImagePicker();
                        XFile? image =
                            await picker.pickImage(source: ImageSource.gallery);
                        setState(() {
                          path = image!.path;
                          g1.image = image.path;
                        });
                      },
                      child: const CircleAvatar(
                        maxRadius: 15,
                        backgroundColor: Color(0xff6639B8),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                      icon: Icon(
                        Icons.person,
                        size: 40,
                        color: Colors.grey,
                      ),
                      hintText: "Name",
                      hintStyle: TextStyle(color: Colors.grey)),
                  validator: (value) {
                    if (value!.isEmpty || value == null) {
                      return "This field is require";
                    }
                    return null;
                  },
                  controller: txtname,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                      icon: Icon(
                        Icons.call,
                        size: 40,
                        color: Colors.grey,
                      ),
                      hintText: "phone",
                      hintStyle: TextStyle(color: Colors.grey)),
                  validator: (value) {
                    if (value!.isEmpty || value == null) {
                      return "This field is require";
                    } else if (value.length != 10) {
                      return "please enter the 10 digit";
                    }
                    return null;
                  },
                  controller: txtphone,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  maxLines: 3,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(
                      icon: Icon(
                        Icons.email,
                        size: 40,
                        color: Colors.grey,
                      ),
                      hintText: "email",
                      hintStyle: TextStyle(color: Colors.grey)),
                  validator: (value) {
                    if (value!.isEmpty || value == null) {
                      return "This field is require";
                    } else if (!RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value)) {
                      return "enter the valid email";
                    }
                    return null;
                  },
                  controller: txtemail,
                ),
                const SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () {
                    if (formkey.currentState!.validate()) {
                      g1.name = txtname.text;
                      g1.phone = txtphone.text;
                      g1.email = txtemail.text;
                      formkey.currentState!.save();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Save"),
                        ),
                      );
                      Navigator.pop(context);
                    }
                  },
                  child: Container(
                    height: 30,
                    width: 80,
                    color: const Color(0xff6639B8),
                    alignment: Alignment.center,
                    child: const Text(
                      "SAVE",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

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
            color: Colors.redAccent,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              width: MediaQuery.sizeOf(context).width * 0.90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Form(
                key: formkey,
                child: Column(
                  children: [
                    const Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          maxRadius: 50,
                        ),
                        InkWell(
                          child: CircleAvatar(
                            maxRadius: 15,
                            backgroundColor: Colors.blueAccent,
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
                      },
                      controller: txtemail,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 30,
                      width: 80,
                      color: Colors.blueAccent,
                      alignment: Alignment.center,
                      child: const Text(
                        "SAVE",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

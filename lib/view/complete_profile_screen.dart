import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instragram_clone/res/component/elevatedbutton.dart';
import 'package:instragram_clone/view/home_page_screen.dart';
import 'package:instragram_clone/view_model/widget/custom.dart';
import 'package:lottie/lottie.dart';

class CompleteProfile extends StatefulWidget {
  const CompleteProfile({
    super.key,
  });

  @override
  State<CompleteProfile> createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  File? pickedImage;

  TextEditingController fullNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text("Complete Profile"),
      ),
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            CupertinoButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20.0))),
                    builder: (BuildContext context) {
                      return Container(
                        height: 300,
                        //height: 300,
                        child: Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 7,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(50)),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.04,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 20.0),
                              child: Row(
                                children: [
                                  Text(
                                    "Profile photo",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20),
                                  ),
                                  SizedBox(
                                    width: 200,
                                  ),
                                  Icon(
                                    Icons.delete,
                                    size: 30,
                                    color: Colors.grey,
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 40.0),
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      CircleAvatar(
                                        radius: 40,
                                        backgroundColor: Colors.grey,
                                        child: CircleAvatar(
                                          backgroundColor: Colors.white,
                                          child: InkWell(
                                            onTap: () async {
                                              Navigator.pop(context);
                                              getImage(ImageSource.camera);
                                            },
                                            child: const Icon(
                                              Icons.camera_alt,
                                              size: 30,
                                              color: Color.fromARGB(
                                                  255, 3, 110, 76),
                                            ),
                                          ),
                                          radius: 39,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text(
                                        "Camera",
                                        style: TextStyle(fontSize: 20),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 50,
                                  ),
                                  Column(
                                    children: [
                                      CircleAvatar(
                                        radius: 40,
                                        backgroundColor: Colors.grey,
                                        child: CircleAvatar(
                                          backgroundColor: Colors.white,
                                          child: InkWell(
                                            onTap: () async {
                                              getImage(ImageSource.gallery);
                                              Navigator.pop(context);
                                            },
                                            child: const Icon(
                                              Icons.browse_gallery_rounded,
                                              size: 30,
                                              color: Color.fromARGB(
                                                  255, 3, 110, 76),
                                            ),
                                          ),
                                          radius: 39,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text(
                                        "Gallery",
                                        style: TextStyle(fontSize: 20),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 50,
                                  ),
                                  Column(
                                    children: [
                                      CircleAvatar(
                                        radius: 40,
                                        backgroundColor: Colors.grey,
                                        child: CircleAvatar(
                                          backgroundColor: Colors.white,
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: InkWell(
                                              onTap: () {
                                                clear();
                                              },
                                              child: const Icon(
                                                Icons.cancel,
                                                size: 33,
                                                color: Color.fromARGB(
                                                    255, 3, 110, 76),
                                              ),
                                            ),
                                          ),
                                          radius: 39,
                                        ),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.01,
                                      ),
                                      const Text(
                                        "Cancel",
                                        style: TextStyle(fontSize: 20),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    });
              },
              padding: const EdgeInsets.all(0),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 120,
                backgroundImage: pickedImage != null
                    ? FileImage(
                        pickedImage!) // Use FileImage to create an ImageProvider from the File
                    : null, // Set backgroundImage to null when _image is null
                child: pickedImage == null
                    ?
                    //const Icon(
                    //     Icons.person,
                    //     size: 60,
                    //   )
                    Lottie.asset("Assets/animations/animation_lnr9ymcb.json",
                        height: 150)
                    : null,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            CustomTextFormField(
                hintText: "Enter Your Name",
                controller: fullNameController,
                prefixIcon: Icons.account_box),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            CustomRoundButton(
              onPress: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => HomePage())));
                //checkValues();
              },
              title: 'Submit',
            )
          ],
        ),
      )),
    );
  }

  Future<void> getImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() {
        pickedImage = imageTemporary;
      });
    } on PlatformException {
      print("Failed to pick image");
    }
  }

  void clear() {
    setState(() {
      pickedImage = null;
    });
  }
}

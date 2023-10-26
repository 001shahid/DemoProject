import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instragram_clone/res/component/elevatedbutton.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instragram_clone/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({Key? key}) : super(key: key);

  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  File? pickedImage; // Variable to store the picked image file

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    final authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 112, 180, 235),
        elevation: 3,
        title: Text(
          "CREATE POST",
          style: GoogleFonts.pacifico(
            textStyle: const TextStyle(
              fontSize: 15, // Adjust font size as needed
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.95,
              child: TextFormField(
                decoration:
                    InputDecoration(hintText: "Write What's on Your Mind"),
                controller: searchController,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            InkWell(
              onTap: () async {
                final XFile? pickedFile =
                    await ImagePicker().pickImage(source: ImageSource.gallery);
                if (pickedFile != null) {
                  setState(() {
                    pickedImage = File(pickedFile.path);
                  });
                }
              },
              child: Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                height: MediaQuery.of(context).size.height * 0.35,
                width: MediaQuery.of(context).size.width * 0.9,
                child: pickedImage != null
                    ? Image.file(pickedImage!)
                    : Center(
                        child: Text('Tap to pick an image'),
                      ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            CustomRoundButton(
                title: "Post",
                onPress: () {
                  Map data = {
                    "url": "gfhjklgcvbnm,",
                    "mediaType": "image",
                    "caption": "fcghvjbknkm,"
                  };
                  // {
                  //   "url": "abcdserdtfghjk,",
                  //   "mediaType": "image",
                  //   "caption": "dtrfghjk"
                  // };
                  debugPrint("api hit");
                  authViewModel.createPost(data, context);
                })
          ],
        ),
      ),
    );
  }
}

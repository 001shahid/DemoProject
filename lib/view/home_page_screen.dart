import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instragram_clone/view/comment_page_screen.dart';
import 'package:instragram_clone/view/create_post.dart';
import 'package:instragram_clone/view/owner_profile_screen.dart';
import 'package:instragram_clone/view/search_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<bool> isFavoriteList = List.generate(8, (index) => false);
  bool isFavorite = false;
  int currentPage = 0;
  List<String> profileImages = [
    "Assets/images/profile.jpeg",
    "Assets/images/profile.jpeg",
    "Assets/images/profile.jpeg",
    "Assets/images/profile.jpeg",
    "Assets/images/profile.jpeg",
    "Assets/images/profile.jpeg",
    "Assets/images/profile.jpeg",
    "Assets/images/profile.jpeg",
  ];
  List<String> post = [
    "Assets/images/landscape-mountains-nature-67517.jpg",
    "Assets/images/landscape-mountains-nature-67517.jpg",
    "Assets/images/landscape-mountains-nature-67517.jpg",
    "Assets/images/landscape-mountains-nature-67517.jpg",
    "Assets/images/landscape-mountains-nature-67517.jpg",
    "Assets/images/landscape-mountains-nature-67517.jpg",
    "Assets/images/landscape-mountains-nature-67517.jpg",
    "Assets/images/landscape-mountains-nature-67517.jpg",
  ];
  Future<void> onRefresh() async {
    await Future.delayed(const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 112, 180, 235),
          elevation: 3,
          //  centerTitle: false,
          title: Text(
            "Instagram",
            style: GoogleFonts.pacifico(
              // Use the cursive font style
              textStyle: const TextStyle(
                fontSize: 24, // Adjust font size as needed
                color: Colors.black,
              ),
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications,
                  color: Colors.black,
                )),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          //Floating action button on Scaffold
          onPressed: () {
            //code to execute on button press
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      CreatePost()), // Replace with the screen you want to open
            );
          },
          child: const Icon(Icons.add), //icon inside button
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        //floating action button position to center

        bottomNavigationBar: BottomAppBar(
          height: 65,
          //bottom navigation bar on scaffold
          color: const Color.fromARGB(255, 112, 180, 235),

          shape: const CircularNotchedRectangle(), //shape of notch
          notchMargin:
              6, //notche margin between floating button and bottom appbar
          child: Row(
            //children inside bottom appbar
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.home,
                  color: Colors.black,
                  // color: Colors.white,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(
                  Icons.search,
                  color: Colors.black,
                  //  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SearchPage()));
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.camera,
                  color: Colors.black,
                ),
                onPressed: () {
                  openCamera();
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.account_box,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const OwnerProfile()));
                },
              ),
            ],
          ),
        ),
        body: RefreshIndicator(
          onRefresh: onRefresh,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                        8,
                        (index) => Container(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: 40,
                                    backgroundColor: Colors.black,
                                    child: CircleAvatar(
                                      backgroundImage:
                                          AssetImage(profileImages[index]),

                                      // backgroundColor: Colors.amber,
                                      radius: 36,
                                    ),

                                    // backgroundImage: NetworkImage(""),
                                  ),
                                  const Text("profile ")
                                ],
                              ),
                            )),
                  ),
                ),
                // Text("profile name")
                //")
                Column(
                  children: List.generate(
                      8,
                      (index) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    child: CircleAvatar(
                                      radius: 40,
                                      backgroundColor: Colors.blue,
                                      //backgroundImage: ,
                                      child: CircleAvatar(
                                        radius: 36,
                                        backgroundImage:
                                            AssetImage(profileImages[index]),
                                        //  backgroundColor: Colors.green,
                                        //backgroundImage: ,
                                      ),
                                    ),
                                  ),
                                  const Text("profile data"),
                                  const Spacer(),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.more_vert))
                                ],
                              ),
                              //Image.asset(""),
                              Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(post[index]))),
                                //color: Colors.blue,
                                height:
                                    MediaQuery.of(context).size.height * .30,
                                width: MediaQuery.of(context).size.width * 1,
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        isFavoriteList[index] =
                                            !isFavoriteList[index];
                                        // Toggle the favorite state
                                      });
                                    },
                                    icon: Icon(
                                      isFavoriteList[index]
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: isFavoriteList[index]
                                          ? Colors.red
                                          : Colors.black,
                                    ),
                                  ),
                                  // IconButton(
                                  //     onPressed: () {},
                                  //     icon: const Icon(Icons.favorite_border)),
                                  IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    TestMe()));
                                      },
                                      icon: const Icon(
                                          Icons.chat_bubble_outline)),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.label_outline)),
                                  const Spacer(),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.bookmark_border))
                                ],
                              ),
                              Container(
                                //color: Colors.black38,
                                padding: const EdgeInsets.all(15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  //mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    RichText(
                                        text: const TextSpan(
                                            style:
                                                TextStyle(color: Colors.black),
                                            children: [
                                          TextSpan(text: "Liked By"),
                                          TextSpan(
                                              text: " Profile name",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          TextSpan(text: " and"),
                                          TextSpan(
                                              text: " others",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ])),
                                    RichText(
                                        text: const TextSpan(
                                            style:
                                                TextStyle(color: Colors.black),
                                            children: [
                                          // TextSpan(text: "Profile name"),
                                          TextSpan(
                                              text: " Profile name",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),

                                          TextSpan(
                                              text:
                                                  "This is the most amazing picture ever put on instagram")
                                        ])),
                                    const Text(
                                      "View all others",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                              const Divider(
                                thickness: 3,
                              )
                            ],
                          )),
                )
              ],
            ),
          ),
        ));
  }

  Future<void> openCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      // Handle the picked image, e.g., display or process it.
    }
  }
}

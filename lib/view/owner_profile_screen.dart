import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instragram_clone/view/edit_profile.dart';
import 'package:instragram_clone/view/followers_Screen.dart';
import 'package:instragram_clone/view/following_Screen.dart';
import 'package:instragram_clone/view/tabs/feed_view.dart';
import 'package:instragram_clone/view/tabs/reels_view.dart';
import 'package:instragram_clone/view/tabs/tagged_view.dart';
import 'package:instragram_clone/view_model/widget/Custom_drawer.dart';

class OwnerProfile extends StatefulWidget {
  const OwnerProfile({super.key});

  @override
  State<OwnerProfile> createState() => _OwnerProfileState();
}

class _OwnerProfileState extends State<OwnerProfile> {
  final List<Widget> tabs = [
    const Tab(
      icon: Icon(
        Icons.image,
        color: Colors.black,
      ),
    ),
    const Tab(
      icon: Icon(
        Icons.video_collection,
        color: Colors.grey,
      ),
    ),
    const Tab(
      icon: Icon(
        Icons.bookmark,
        color: Colors.grey,
      ),
    )
  ];
  final List<Widget> tabBarViews = [
    const FeedView(),
    const ReelsView(),
    const TaggedView()
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            leading: const BackButton(),
            centerTitle: false,
            title: Text(
              "Profile",
              style: GoogleFonts.pacifico(
                // Use the cursive font style
                textStyle: const TextStyle(
                  fontSize: 24, // Adjust font size as needed
                  color: Colors.black,
                ),
              ),
            ),

            //leading: BackButton(),
            backgroundColor: const Color.fromARGB(255, 112, 180, 235),
          ),
          endDrawer: CustomDrawer(),
          body: ListView(
            children: [
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.grey[400]),
                      ),
                    ),
                    const Column(
                      // crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "20",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text("Post")
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => Following())));
                      },
                      child: const Column(
                        // crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "362",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text("Following")
                        ],
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    //   child: Container(
                    //     height: 100,
                    //     width: 100,
                    //     decoration: BoxDecoration(
                    //         shape: BoxShape.circle, color: Colors.grey[400]),
                    //   ),
                    // ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Followers()));
                      },
                      child: const Column(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "700",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text("Followers")
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,

                /// crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  RichText(
                    text: const TextSpan(
                      //style: DefaultTextStyle.of(context).style,
                      style: TextStyle(color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                          text: "Shahid\n",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black),
                        ),
                        TextSpan(
                          text: "Flutter Developer",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const EditProfile()));
                      },
                      style: TextButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 172, 167, 167),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      child: const Text(
                        "Edit Profile",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      )),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              TabBar(tabs: tabs),
              SizedBox(height: 1000, child: TabBarView(children: tabBarViews))
            ],
          ),
        ));
  }
}

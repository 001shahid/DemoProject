import 'package:flutter/material.dart';
import 'package:instragram_clone/utils/explore_grid.dart';
import 'package:instragram_clone/view_model/widget/custom.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController searchControlller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 112, 180, 235),
        elevation: 0,
        // title: ClipRRect(
        //   borderRadius: BorderRadius.circular(8),
        //   child: Container(
        //     decoration: BoxDecoration(
        //         borderRadius: BorderRadius.circular(20),
        //         color: Colors.grey[300]),
        //     padding: EdgeInsets.all(8),
        //     //color: Colors.grey[300],
        //     child: Row(
        //       children: [
        //         // Text("Search"),
        //         Icon(
        //           Icons.search,
        //           // color: Colors.grey,
        //         ),
        //         Text("Search"),
        //       ],
        //     ),
        //   ),
        // ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .9,
            child: CustomTextFormField(
                controller: searchControlller,
                hintText: "Search",
                prefixIcon: Icons.search),
          ),
          Expanded(child: ExploreGrid()),
        ],
      ),
    );
    //return
  }
}

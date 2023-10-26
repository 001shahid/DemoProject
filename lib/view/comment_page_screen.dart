// import 'package:comment_box/comment/comment.dart';
// import 'package:flutter/material.dart';

// class TestMe extends StatefulWidget {
//   @override
//   _TestMeState createState() => _TestMeState();
// }

// class _TestMeState extends State<TestMe> {
//   final formKey = GlobalKey<FormState>();
//   final TextEditingController commentController = TextEditingController();
//   List filedata = [
//     {
//       'name': 'Chuks Okwuenu',
//       'pic': 'Assets/animations/infoprofile_social_media_profile_adobe_express 1.png',
//       'message': 'I love to code',
//       'date': '2021-01-01 12:00:00'
//     },
//     {
//       'name': 'Biggi Man',
//       'pic': 'Assets/animations/infoprofile_social_media_profile_adobe_express 1.png',
//       'message': 'Very cool',
//       'date': '2021-01-01 12:00:00'
//     },
//     {
//       'name': 'Tunde Martins',
//       'pic': 'Assets/animations/infoprofile_social_media_profile_adobe_express 1.png',
//       'message': 'Very cool',
//       'date': '2021-01-01 12:00:00'
//     },
//     {
//       'name': 'Biggi Man',
//       'pic': 'Assets/animations/infoprofile_social_media_profile_adobe_express 1.png',
//       'message': 'Very cool',
//       'date': '2021-01-01 12:00:00'
//     },
//   ];

//   Widget commentChild(data) {
//     return ListView(
//       children: [
//         for (var i = 0; i < data.length; i++)
//           Padding(
//             padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
//             child: ListTile(
//               leading: GestureDetector(
//                 onTap: () async {
//                   // Display the image in large form.
//                   print("Comment Clicked");
//                 },
//                 child: Container(
//                   height: 50.0,
//                   width: 50.0,
//                   decoration: new BoxDecoration(
//                       color: Colors.blue,
//                       borderRadius: new BorderRadius.all(Radius.circular(50))),
//                   child: CircleAvatar(
//                       radius: 50,
//                       backgroundImage: CommentBox.commentImageParser(
//                           imageURLorPath: data[i]['pic'])),
//                 ),
//               ),
//               title: Text(
//                 data[i]['name'],
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//               subtitle: Text(data[i]['message']),
//               trailing: Text(data[i]['date'], style: TextStyle(fontSize: 10)),
//             ),
//           )
//       ],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Comment Page"),
//         backgroundColor: Colors.pink,
//       ),
//       body: Container(
//         child: CommentBox(
//           userImage: CommentBox.commentImageParser(
//               imageURLorPath:
//                   "Assets/animations/infoprofile_social_media_profile_adobe_express 1.png"),
//           child: commentChild(filedata),
//           labelText: 'Write a comment...',
//           errorText: 'Comment cannot be blank',
//           withBorder: false,
//           sendButtonMethod: () {
//             if (formKey.currentState!.validate()) {
//               print(commentController.text);
//               setState(() {
//                 var value = {
//                   'name': 'New User',
//                   // 'pic':
//                   //     'https://lh3.googleusercontent.com/a-/AOh14GjRHcaendrf6gU5fPIVd8GIl1OgblrMMvGUoCBj4g=s400',
//                   'message': commentController.text,
//                   'date': '2021-01-01 12:00:00'
//                 };
//                 filedata.insert(0, value);
//               });
//               commentController.clear();
//               FocusScope.of(context).unfocus();
//             } else {
//               print("Not validated");
//             }
//           },
//           formKey: formKey,
//           commentController: commentController,
//           backgroundColor: Colors.pink,
//           textColor: Colors.white,
//           sendWidget: Icon(Icons.send_sharp, size: 30, color: Colors.white),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:comment_box/comment/comment.dart';

class TestMe extends StatefulWidget {
  @override
  _TestMeState createState() => _TestMeState();
}

class _TestMeState extends State<TestMe> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();
  List filedata = [
    {
      'name': 'Chuks Okwuenu',
      'pic':
          'Assets/animations/infoprofile_social_media_profile_adobe_express 1.png',
      'message': 'I love to code',
      'date': '2021-01-01 12:00:00',
    },
    {
      'name': 'Biggi Man',
      'pic':
          'Assets/animations/infoprofile_social_media_profile_adobe_express 1.png',
      'message': 'Very cool',
      'date': '2021-01-01 12:00:00',
    },
    {
      'name': 'Tunde Martins',
      'pic':
          'Assets/animations/infoprofile_social_media_profile_adobe_express 1.png',
      'message': 'Very cool',
      'date': '2021-01-01 12:00:00',
    },
    {
      'name': 'Biggi Man',
      'pic':
          'Assets/animations/infoprofile_social_media_profile_adobe_express 1.png',
      'message': 'Very cool',
      'date': '2021-01-01 12:00:00',
    },
  ];

  Widget commentChild(data) {
    return ListView(
      children: [
        for (var i = 0; i < data.length; i++)
          Padding(
            padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
            child: ListTile(
              leading: GestureDetector(
                onTap: () async {
                  // Display the image in large form.
                  print("Comment Clicked");
                },
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: CommentBox.commentImageParser(
                      imageURLorPath:
                          data[i]['pic'] ?? 'default_image_path.jpg',
                    ),
                  ),
                ),
              ),
              title: Text(
                data[i]['name'],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(data[i]['message']),
              trailing: Text(data[i]['date'], style: TextStyle(fontSize: 10)),
            ),
          )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Comment Page"),
        backgroundColor: Colors.pink,
      ),
      body: Container(
        child: CommentBox(
          userImage: CommentBox.commentImageParser(
            imageURLorPath:
                "Assets/animations/infoprofile_social_media_profile_adobe_express 1.png",
          ),
          child: commentChild(filedata),
          labelText: 'Write a comment...',
          errorText: 'Comment cannot be blank',
          withBorder: false,
          sendButtonMethod: () {
            if (formKey.currentState!.validate()) {
              print(commentController.text);
              setState(() {
                var value = {
                  'name': 'New User',
                  'message': commentController.text,
                  'date': '2021-01-01 12:00:00',
                };
                filedata.insert(0, value);
              });
              commentController.clear();
              FocusScope.of(context).unfocus();
            } else {
              print("Not validated");
            }
          },
          formKey: formKey,
          commentController: commentController,
          backgroundColor: Colors.pink,
          textColor: Colors.white,
          sendWidget: Icon(Icons.send_sharp, size: 30, color: Colors.white),
        ),
      ),
    );
  }
}

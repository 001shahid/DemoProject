import 'package:flutter/material.dart';

class Followers extends StatefulWidget {
  const Followers({Key? key});

  @override
  State<Followers> createState() => _FollowersState();
}

class _FollowersState extends State<Followers> {
  List<String> followersList = [
    'Follower 1',
    'Follower 2',
    'Follower 3',
    'Follower 4',
    'Follower 5',
    'Follower 6',
    'Follower 7',
    'Follower 8',
    'Follower 9',
    'Follower 10',
    'Follower 11',
    'Follower 12',
    'Follower 13',
    'Follower 14',
    'Follower 15',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Followers'),
      ),
      body: ListView.builder(
        itemCount: followersList.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              radius: 25,
              // You can set the follower's image here
              child: Text((index + 1).toString()),
            ),
            title: Text(followersList[index]),
            trailing: ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Remove Follower"),
                      content: Text(
                          "Are you sure you want to remove this follower?"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Close the dialog
                          },
                          child: Text("Cancel"),
                        ),
                        TextButton(
                          onPressed: () {
                            // Logic to remove the follower from the list
                            setState(() {
                              followersList.removeAt(index);
                            });
                            Navigator.of(context).pop(); // Close the dialog
                          },
                          child: Text("Remove"),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Remove'),
            ),
          );
        },
      ),
    );
  }
}

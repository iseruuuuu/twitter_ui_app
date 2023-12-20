import 'package:disney_app/model/account.dart';
import 'package:disney_app/model/post.dart';
import 'package:disney_app/screen/post/post_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeLineScreen extends StatefulWidget {
  const TimeLineScreen({Key? key}) : super(key: key);

  @override
  State<TimeLineScreen> createState() => _TimeLineScreenState();
}

class _TimeLineScreenState extends State<TimeLineScreen> {
  Account myAccount = Account(
    id: '1',
    name: 'name',
    selfIntroduction: 'ディズニー大好き',
    userId: '@user_id',
    imagePath: 'https://m.media-amazon.com/images/I/61JyfJ-R82L._AC_SX466_.jpg',
    createdTime: DateTime.now(),
  );

  List<Post> postList = [
    Post(
      id: '1',
      content: 'コメント１',
      postAccountId: '1',
      createdTime: DateTime.now(),
    ),
    Post(
      id: '2',
      content: 'コメント２',
      postAccountId: '1',
      createdTime: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('アカウント'),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: postList.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              border: index == 0
                  ? const Border(
                      top: BorderSide(color: Colors.grey, width: 1),
                      bottom: BorderSide(color: Colors.grey, width: 1),
                    )
                  : const Border(
                      bottom: BorderSide(color: Colors.grey, width: 1),
                    ),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  foregroundImage: NetworkImage(myAccount.imagePath),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(myAccount.name),
                        Text(myAccount.userId),
                        Text(
                          DateFormat('yyyy/MM/dd')
                              .format(postList[index].createdTime!),
                        ),
                      ],
                    ),
                    Text(postList[index].content),
                  ],
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const PostScreen(),
            ),
          );
        },
        child: Icon(Icons.chat_bubble_outline),
      ),
    );
  }
}

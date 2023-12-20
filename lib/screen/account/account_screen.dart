import 'package:disney_app/model/account.dart';
import 'package:disney_app/model/post.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
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
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        radius: 32,
                        foregroundImage: NetworkImage(myAccount.imagePath),
                      ),
                      Column(
                        children: [
                          Text(myAccount.name),
                          Text(myAccount.userId),
                        ],
                      ),
                      OutlinedButton(
                          onPressed: () {}, child: const Text('編集')),
                    ],
                  ),
                  Text(myAccount.selfIntroduction),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.blue,
                    width: 3,
                  ),
                ),
              ),
              child: Text('投稿'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: postList.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      border: index == 0
                          ? const Border(
                              top: BorderSide(color: Colors.grey, width: 1),
                              bottom:
                                  BorderSide(color: Colors.grey, width: 1),
                            )
                          : const Border(
                              bottom:
                                  BorderSide(color: Colors.grey, width: 1),
                            ),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          foregroundImage:
                              NetworkImage(myAccount.imagePath),
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
            ),
          ],
        ),
      ),
    );
  }
}

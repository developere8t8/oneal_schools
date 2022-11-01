import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:oneal_school/Admin_screens/adminchatroom.dart';
import 'package:oneal_school/models/chatroom.dart';

import 'ChatRoom.dart';

class AdminChatHomeScreen extends StatefulWidget {
  AdminChatHomeScreen(
      {required this.name, required this.compId, required this.docid, required this.image});

  final String name;
  final String compId;
  final String docid;
  final String image;

  @override
  State<AdminChatHomeScreen> createState() => _AdminChatHomeScreenState();
}

class _AdminChatHomeScreenState extends State<AdminChatHomeScreen> with WidgetsBindingObserver {
  Map<String, dynamic>? userMap;
  bool isLoading = false;
  final TextEditingController _search = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  Future<dynamic> chatRoomId(String user1, String user2) async {
    var res = await FirebaseFirestore.instance
        .collection('Members')
        .where('chatroom', isEqualTo: '$user1$user2')
        .get();

    if (res.docs.isEmpty) {
      var response = await FirebaseFirestore.instance
          .collection('Members')
          .where('chatroom', isEqualTo: '$user2$user1')
          .get();
      if (response.docs.isEmpty) {
        return "$user1$user2";
      } else {
        return res.docs[0].id.toString();
      }
    } else {
      return res.docs[0].id.toString();
    }

//    print(user1 + user2);

    // if (user1[0].toLowerCase().codeUnits[0] >
    //   user2[0].toLowerCase().codeUnits[0]) {

    // } else {
    //  return "$user2$user1";
    // }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Color(0xFF83050C),
          statusBarIconBrightness: Brightness.light, // For Android (dark icons)
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF83050C),
        elevation: 0,
        title: Text(
          'chat With Members',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.home_filled,
            size: 25,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: isLoading
          ? Center(
              child: Text('User Not found,Tap to Search Again'),
            )
          : Column(
              children: [
                SizedBox(
                  height: size.height / 20,
                ),
                StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('Members')
                        .where('Employee_Off', isEqualTo: widget.compId)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final data = snapshot.data?.docs;
                        return Column(
                          children: [
                            for (int i = 0; i < snapshot.data!.docs.length; i++)
                              InkWell(
                                onTap: () async {
                                  QuerySnapshot snapchatroom = await FirebaseFirestore.instance
                                      .collection('chatroom')
                                      .where('members', arrayContains: data![i].id)
                                      .get();
                                  if (snapchatroom.docs.isNotEmpty) {
                                    ChatroomModel model = ChatroomModel.fromMap(
                                        snapchatroom.docs.first.data() as Map<String, dynamic>);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AdminChatRoom(
                                                chatRoomId: model.id!,
                                                docId: data[i]['Employee_Off'],
                                                userId: data[i].id,
                                                name: '${data[i]['fname']}',
                                              )),
                                    );
                                  } else {
                                    final newchatRoom =
                                        FirebaseFirestore.instance.collection('chatroom').doc();
                                    ChatroomModel model = ChatroomModel(id: newchatRoom.id, members: [
                                      data[i].id,
                                      data[i]['Employee_Off'],
                                    ]);
                                    newchatRoom.set(model.toMap());

                                    //next page
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ChatRoom(
                                                chatRoomId: newchatRoom.id,
                                                docId: data[i].id,
                                                userId: data[i]['Employee_Off'],
                                                name: '${data[i]['fname']}',
                                              )),
                                    );
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 12.0, right: 12, top: 5),
                                  child: Container(
                                    height: 90,
                                    width: 330,
                                    decoration: BoxDecoration(
                                        color: Color(0xff83050C),
                                        borderRadius: BorderRadius.circular(12)),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          height: 70,
                                          width: 70,
                                          decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: Colors.white,
                                              )),
                                          child: Container(
                                            height: 50,
                                            width: 50,
                                            child: data![i]['Image'] != ''
                                                ? CircleAvatar(
                                                    backgroundImage: NetworkImage(data[i]['Image']),
                                                  )
                                                : CircleAvatar(
                                                    backgroundImage:
                                                        AssetImage('assets/images/logo.png'),
                                                  ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          '${data[i]['fname']}',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 21,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 85,
                                        ),
                                        Icon(FontAwesomeIcons.message, color: Colors.white),
                                        SizedBox(
                                          width: 15,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        );
                      }
                      return Container();
                    }),
              ],
            ),
    );
  }
}

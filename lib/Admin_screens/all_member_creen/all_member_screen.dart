import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oneal_school/Admin_screens/Models/members.dart';
import 'package:oneal_school/Admin_screens/newmemberscreen/newmemberscreen.dart';
import 'package:oneal_school/Admin_screens/search/search_data.dart';
import 'package:oneal_school/Widgets/small_btn.dart';
import 'package:oneal_school/chat_authentication/Screens/Admin_chat_HomeScreen.dart';

import '../welcome_back_screen.dart';
import 'member_profile.dart';

final uid = FirebaseAuth.instance.currentUser!.uid;

class AllMembers extends StatefulWidget {
  AllMembers({required this.compId, this.userEmail, this.userPassword});
  String compId = '';
  String? userEmail;
  String? userPassword;

  @override
  State<AllMembers> createState() => _AllMembersState();
}

class _AllMembersState extends State<AllMembers> {
  //double tak = 0;
  double sum = 0;
  //bool descending = false;
  List<MemberData> data = [];
// sum of all earning
  calculateSum() {
    sum = 0;
    for (var item in data) {
      setState(() {
        sum += item.earmingBalance!;
      });
    }
  }

//getting memebers
  Future getMembers() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('Members').get();
    if (snapshot.docs.isNotEmpty) {
      setState(() {
        data = snapshot.docs
            .map((e) => MemberData.fromMap(e.data() as Map<String, dynamic>))
            .toList();
      });
      calculateSum();
    }
  }

  //final descending = false;
  Future orderByDescending() async {
    data.clear();
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('Members')
        .orderBy("earning_balance", descending: true)
        .get();
    if (snapshot.docs.isNotEmpty) {
      setState(() {
        data = snapshot.docs
            .map((e) => MemberData.fromMap(e.data() as Map<String, dynamic>))
            .toList();
      });
      // calculateSum();
    }
  }

  Future orderByAescending() async {
    data.clear();
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('Members')
        .orderBy("earning_balance", descending: false)
        .get();
    if (snapshot.docs.isNotEmpty) {
      setState(() {
        data = snapshot.docs
            .map((e) => MemberData.fromMap(e.data() as Map<String, dynamic>))
            .toList();
      });
      // calculateSum();
    }
  }

  @override
  void initState() {
    getMembers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screesize = MediaQuery.of(context)
        .size; // screen size of the Phone for responsiveness

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Color(0xff83050C),
            statusBarIconBrightness:
                Brightness.light, // For Android (dark icons)
          ),
          backgroundColor: const Color(0xff83050C),
          title: const Text(
            'ALL MEMBERS',
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: Color(0xffFFFFFF),
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => WelcomeBack()));
            },
            icon: const Icon(
              Icons.home,
              color: Color(0xffFFFFFF),
            ),
          ),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: screesize.height / 3.62,
                    width: double.infinity,
                    color: const Color(0xff83050C),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(
                                width: 7,
                              ),
                              const Text(
                                'Summary',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xffFFFFFF),
                                ),
                              ),
                              const SizedBox(
                                width: 140,
                              ),
                              Row(
                                children: [
                                  // const Text(
                                  //   'ALL',
                                  //   style: const TextStyle(
                                  //     fontSize: 14,
                                  //     fontWeight: FontWeight.w300,
                                  //     color: const Color(0xffFFFFFF),
                                  //   ),
                                  // ),
                                  // IconButton(
                                  //   onPressed: () {
                                  //     setState(() {
                                  //       descending = true;
                                  //     });
                                  //   },
                                  //   icon: const Icon(
                                  //     Icons.keyboard_arrow_down,
                                  //     color: const Color(0xffFFFFFF),
                                  //   ),
                                  // ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 18.0, right: 18, top: 4),
                          child: Container(
                            height: screesize.height / 14,
                            width: screesize.width / 1,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(254, 222, 254, 0.32),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  width: screesize.width / 7,
                                  child: CircleAvatar(
                                    child: Image.asset(
                                      'images/grop.png',
                                      height: 50,
                                      width: 50,
                                    ),
                                    backgroundColor: Colors.transparent,
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  width: screesize.width / 1.75,
                                  child: const Text(
                                    'MEMBERS',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                Text(
                                  data.isNotEmpty
                                      ? data.length.toString()
                                      : '0',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 18.0, right: 18, top: 8),
                          child: Container(
                            height: screesize.height / 14,
                            width: screesize.width / 1,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(254, 222, 254, 0.32),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 5,
                                ),
                                SizedBox(
                                  width: screesize.width / 7,
                                  child: CircleAvatar(
                                    radius: 20,
                                    child: Image.asset(
                                      'images/stars.png',
                                      height: 50,
                                      width: 50,
                                    ),
                                    backgroundColor: Colors.transparent,
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                SizedBox(
                                  width: screesize.width / 2.9,
                                  child: const Text(
                                    'OUTSTANDING',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                const SizedBox(
                                  width: 64,
                                ),
                                Expanded(
                                  child: Text(
                                    "\₦ ${sum}",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  //search area

                  Padding(
                    padding:
                        const EdgeInsets.only(left: 21.0, right: 21, top: 185),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CloudFirestoreSearch(
                                //compId: widget.compId
                                ),
                          ),
                        );
                      },
                      child: Container(
                        height: screesize.height / 14,
                        width: screesize.width / 1,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black12, width: 1),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 3,
                                spreadRadius: 1)
                          ],
                        ),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 5,
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.search,
                                color: const Color(0xff83050C),
                                size: 25,
                              ),
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CloudFirestoreSearch(
                                        //compId: widget.compId
                                        ),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            const Text(
                              'Search member...',
                              style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 0.2),
                                  fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MaterialButton(
                          onPressed: () {
                            orderByAescending();
                          },
                          color: Color(0xff83050C),
                          textColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              Text('Sorted By Amount'),
                              Icon(Icons.keyboard_arrow_down_outlined)
                            ],
                          ),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MaterialButton(
                          onPressed: () {
                            orderByDescending();
                          },
                          color: Color(0xff83050C),
                          textColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              Text('Sorted By Amount'),
                              Icon(Icons.keyboard_arrow_up_outlined)
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 40,
                color: const Color(0xffF6F7FC),
                child: Padding(
                  padding: const EdgeInsets.only(left: 25.0, right: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Members\'s Info',
                        style: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 0.27),
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        'Total Owed',
                        style: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 0.27),
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),

              // ontap profile

              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10, top: 10),
                child: Container(
                    height: screesize.height / 3.2,
                    child: ListView.builder(
                        itemCount: data.isNotEmpty ? data.length : 0,
                        shrinkWrap: true,
                        primary: false,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MembersDetailTWO(
                                    data: data[index],
                                  ),
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Container(
                                height: screesize.height / 13,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      spreadRadius: 5,
                                      blurRadius: 3,
                                      offset: const Offset(0.4, 3.5),
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  children: [
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Container(
                                      height: 50,
                                      width: 50,
                                      child: data[index].imageUrl!.isNotEmpty
                                          ? CircleAvatar(
                                              radius: 20,
                                              backgroundImage: NetworkImage(
                                                  '${data[index].imageUrl}'))
                                          : CircleAvatar(
                                              radius: 20,
                                              backgroundImage: AssetImage(
                                                  'assets/images/logo.png')),
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                "${data[index].fname}",
                                                style: const TextStyle(
                                                    color: Color(0xff83050C),
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                "${data[index].lname}",
                                                style: const TextStyle(
                                                    color: Color(0xff83050C),
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 5,
                                            width: 5,
                                          ),
                                          Text(
                                            "${data[index].phone}",
                                            style: const TextStyle(
                                                color: const Color.fromRGBO(
                                                    149, 149, 149, 0.88),
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      '\₦ ${data[index].earmingBalance}',
                                      style: const TextStyle(
                                          color: Colors.green,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        })),
              ),

              StreamBuilder<QuerySnapshot>(
                stream:
                    FirebaseFirestore.instance.collection('Admin').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final mydata = snapshot.data!.docs;
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SmallBtn(
                            txt: 'REMINDER',
                            ontap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AdminChatHomeScreen(
                                      name:
                                          '${FirebaseAuth.instance.currentUser!.displayName}',
                                      compId: mydata[0].id,
                                      docid: mydata[0].id,
                                      image: mydata[0]['Image']),
                                ),
                              );
                            },
                            clr: Colors.black),
                        SmallBtn(
                            txt: 'ADD MEMBER',
                            ontap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => NewMemberScreen(
                                    userEmail: widget.userEmail,
                                    userPassword: widget.userPassword,
                                    compId: mydata[0].id,
                                  ),
                                ),
                              );
                            },
                            clr: const Color(0xff83050C)),
                      ],
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Color(0xff83050C),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

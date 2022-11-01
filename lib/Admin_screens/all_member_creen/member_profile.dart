import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:oneal_school/Admin_screens/Models/cateogryModel.dart';
import 'package:oneal_school/Admin_screens/Models/members.dart';
import 'package:oneal_school/Admin_screens/Models/newRecord.dart';
import 'package:oneal_school/Admin_screens/all_member_creen/member_detail.dart';
import 'package:oneal_school/Admin_screens/newrecord/credit_screen.dart';
import 'package:oneal_school/Admin_screens/newrecord/debit_screen.dart';
import 'package:oneal_school/Admin_screens/newrecord/newrecordscreen.dart';
import '../../models/records.dart';
import '../welcome_back_screen.dart';

class MembersDetailTWO extends StatefulWidget {
  MembersDetailTWO({required this.data});

  final MemberData data;

  @override
  State<MembersDetailTWO> createState() => _MembersDetailTWOState();
}

class _MembersDetailTWOState extends State<MembersDetailTWO> {
  int categeoryLength = 0;
  List<NewRecordData> recordData = [];

  num sum = 0;

  @override
  void initState() {
    super.initState();
    getCatgeory();
  }

  @override
  Widget build(BuildContext context) {
    var screesize = MediaQuery.of(context).size; // screen size of the Phone for responsiveness

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Color(0xff83050C),
              statusBarIconBrightness: Brightness.light, // For Android (dark icons)
            ),
            backgroundColor: const Color(0xff83050C),
            title: const Text(
              '',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color(0xffFFFFFF),
              ),
            ),
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => WelcomeBack()));
              },
              icon: const Icon(
                Icons.home,
                color: Color(0xffFFFFFF),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                            title: const Text("Are you sure to delete"),
                            content: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                MaterialButton(
                                    child: const Text("CANCEL"),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    }),
                                MaterialButton(
                                    child: const Text("Delete"),
                                    onPressed: () {
                                      Navigator.pop(context);
                                      FirebaseFirestore.instance
                                          .collection('Members')
                                          .doc(widget.data.added)
                                          .delete();
                                      Navigator.pop(context);
                                    }),
                              ],
                            ),
                          ));
                },
                child: const Text(
                  'Delete',
                  style: TextStyle(
                    color: Colors.white60,
                  ),
                ),
              )
            ],
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: screesize.height / 2.80,
                  width: double.infinity,
                  color: const Color(0xff83050C),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: screesize.height / 12.2,
                        width: 310,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            gradient: LinearGradient(colors: [
                              const Color(0xff83050C),
                              Colors.white.withOpacity(0.3),
                            ], begin: Alignment.centerRight, end: Alignment.bottomLeft),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                spreadRadius: 2,
                                blurRadius: 1,
                                offset: Offset(1, 2),
                              )
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(
                              width: 13,
                            ),
                            Container(
                              width: 49,
                              height: 49,
                              child: widget.data.imageUrl!.isNotEmpty
                                  ? CircleAvatar(
                                      radius: 20,
                                      backgroundImage: NetworkImage('${widget.data.imageUrl}'))
                                  : CircleAvatar(
                                      radius: 20, backgroundImage: AssetImage('assets/images/logo.png')),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: screesize.width / 1.97,
                                  child: Row(
                                    children: [
                                      Text(
                                        "${widget.data.fname}",
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "${widget.data.lname}",
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  '${widget.data.phone}',
                                  style: const TextStyle(
                                      color: Colors.white70, fontSize: 14, fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                            Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                  color: const Color(0xff83050C),
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.3),
                                        spreadRadius: 2,
                                        blurRadius: 2)
                                  ]),
                              child: Center(
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => MemberEdit(
                                          data: widget.data,
                                        ),
                                      ),
                                    );
                                  },
                                  icon: const Icon(
                                    FontAwesomeIcons.pencil,
                                    color: Colors.white,
                                    size: 14,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: const [
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Member\'s Summary',
                            style: TextStyle(
                                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 18.0, right: 18, top: 15),
                            child: Container(
                              height: screesize.height / 13.8,
                              width: screesize.width / 1,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(254, 222, 254, 0.32),
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black12.withOpacity(0.1),
                                      spreadRadius: 2,
                                      blurRadius: 2,
                                      offset: const Offset(0.1, 1)),
                                ],
                              ),
                              child: SizedBox(
                                height: screesize.height / 13.8,
                                width: screesize.width / 1,
                                child: Row(
                                  children: [
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Image.asset(
                                      'images/soraiDol.png',
                                      height: 45,
                                      width: 45,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text(
                                      'Last Seen',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(
                                      width: 65,
                                    ),
                                    Text(
                                      getHours(widget.data.lastseen!.toDate()),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 18.0, right: 18, top: 8),
                            child: Container(
                              height: screesize.height / 13.8,
                              width: screesize.width / 1,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(254, 222, 254, 0.32),
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black12.withOpacity(0.1),
                                      spreadRadius: 2,
                                      blurRadius: 2,
                                      offset: const Offset(0.1, 1)),
                                ],
                              ),
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Image.asset(
                                    'images/hnd.png',
                                    height: 45,
                                    width: 45,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Text(
                                    'Currently Owing',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    width: 56,
                                  ),
                                  Text(
                                    "\₦ ${widget.data.earmingBalance}",
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'CATEGORIES',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff83050C),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: screesize.height / 2.99,
                  child: ListView.builder(
                      itemCount: recordData.isEmpty ? 0 : recordData.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      primary: false,
                      itemBuilder: (context, index) {
                        // return TransactionCategoryWidget(
                        //   data: unique[index],
                        //   name: widget.data.fname!,
                        // );

                        return Padding(
                          padding: const EdgeInsets.only(right: 20, left: 20, top: 20),
                          child: Container(
                              height: screesize.height / 14,
                              width: screesize.width / 1,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.3),
                                      spreadRadius: 1,
                                      blurRadius: 2,
                                      offset: const Offset(0.3, 2)),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      recordData[index].transactionCategory!,
                                      style: TextStyle(
                                          color: Colors.blueGrey.shade200,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          recordData[index].amount.toString(),
                                          style: TextStyle(
                                              color: recordData[index].typetrance! == 'Debit'
                                                  ? Colors.red
                                                  : Colors.green,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        SizedBox(
                                          width: 25,
                                        ),
                                        Icon(
                                          recordData[index].typetrance! == 'Debit'
                                              ? Icons.remove_circle
                                              : Icons.add_circle,
                                          color: recordData[index].typetrance! == 'Debit'
                                              ? Colors.red
                                              : Colors.green,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )),
                        );
                      }),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DebitScreen()),
                        );
                      },
                      color: const Color(0xff2F2F2F),
                      height: screesize.height / 17,
                      minWidth: screesize.width / 2.52,
                      child: Text(
                        'NEW DEBIT',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    MaterialButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CreditScreen()),
                        );
                      },
                      color: const Color(0xff83050C),
                      height: screesize.height / 17,
                      minWidth: screesize.width / 2.52,
                      child: const Text(
                        'NEW CREDIT',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }

  Future getCatgeory() async {
    QuerySnapshot snap = await FirebaseFirestore.instance.collection('Categories').get();
    if (snap.docs.isNotEmpty) {
      List<CategoryModel> model =
          snap.docs.map((e) => CategoryModel.fromMap(e.data() as Map<String, dynamic>)).toList();
      for (var item in model) {
        QuerySnapshot recordSnap = await FirebaseFirestore.instance
            .collection('NewRecord')
            .where('Transaction Category', isEqualTo: item.categoryName)
            .where('Parentid', isEqualTo: widget.data.added)
            .get();
        if (recordSnap.docs.isNotEmpty) {
          setState(() {
            recordData.addAll(recordSnap.docs
                .map((e) => NewRecordData.fromMap(e.data() as Map<String, dynamic>))
                .toList());
          });
        }
      }
    }
  }

  String getHours(DateTime dateTime) {
    int days = DateTime.now().difference(dateTime).inDays;
    String label = '';
    if (days == 0) {
      setState(() {
        int mins = DateTime.now().difference(dateTime).inMinutes;
        if (mins < 59) {
          label = '$mins mins ago';
        } else if (mins > 59 && mins < 119) {
          label = '1 hours ago';
        } else if (mins > 119 && mins < 179) {
          label = '2 hours ago';
        } else if (mins > 179 && mins < 239) {
          label = '3 hours ago';
        } else if (mins > 239 && mins < 299) {
          label = '4 hours ago';
        } else if (mins > 299 && mins < 259) {
          label = '5 hours ago';
        } else if (mins > 259 && mins < 319) {
          label = '6 hours ago';
        } else if (mins > 319 && mins < 379) {
          label = '7 hours ago';
        } else if (mins > 379 && mins < 419) {
          label = '8 hours ago';
        } else if (mins > 419 && mins < 479) {
          label = '9 hours ago';
        } else if (mins > 479 && mins < 539) {
          label = '10 hours ago';
        } else if (mins > 539 && mins < 599) {
          label = '11 hours ago';
        } else if (mins > 599 && mins < 659) {
          label = '12 hours ago';
        } else if (mins > 659 && mins < 719) {
          label = '13 hours ago';
        } else if (mins > 719 && mins < 779) {
          label = '14 hours ago';
        } else if (mins > 779 && mins < 819) {
          label = '15 hours ago';
        } else if (mins > 819 && mins < 879) {
          label = '16 hours ago';
        } else {
          label = DateFormat('hh:mm a').format(DateTime.now().subtract(Duration(minutes: mins)));
        }
      });
    } else if (days == 1) {
      setState(() {
        label = 'yesterday';
      });
    } else if (days > 1) {
      setState(() {
        label = DateFormat('MM/dd/yyy').format(DateTime.now().subtract(Duration(days: days)));
      });
    }
    return label;
  }
}

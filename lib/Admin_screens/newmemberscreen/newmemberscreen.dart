import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:oneal_school/Admin_screens/Models/cateogryModel.dart';
import 'package:oneal_school/Admin_screens/all_member_creen/all_member_screen.dart';
import 'package:oneal_school/Widgets/large_btn.dart';

// ignore: must_be_immutable
class NewMemberScreen extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  NewMemberScreen({required this.compId, this.userEmail, this.userPassword});

  String compId;
  String? userEmail;
  String? userPassword;

  @override
  State<NewMemberScreen> createState() => _NewMemberScreenState();
}

class _NewMemberScreenState extends State<NewMemberScreen> {
  final uid = FirebaseAuth.instance.currentUser!.uid;
  FirebaseAuth auth = FirebaseAuth.instance;
  List<String> categoryIds = [];
  List<CategoryModel> categorymodels = [];
  // final NewMemberController newMemberController =
  // Get.put(NewMemberController());
  bool loading = false;
  TextEditingController fnameC = TextEditingController();
  TextEditingController lnameC = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController phone = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  //String dropdownValue = 'SS1';

  //getting categroy list

  Future getCategory() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('Categories').get();
    if (snapshot.docs.isNotEmpty) {
      setState(() {
        categorymodels =
            snapshot.docs.map((e) => CategoryModel.fromMap(e.data() as Map<String, dynamic>)).toList();
      });
    }
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  validateInput() {
    var formState = _formKey.currentState;
    if (formState!.validate()) {
      return true;
    } else {
      AutovalidateMode.onUserInteraction;
      return false;
    }
  }

  //registerUser(BuildContext context, String compId) async {}

  Future createUserDatabase(String uid, String compId) async {
    Map<String, dynamic> data = {
      "email": email.text,
      "fname": fnameC.text,
      "lname": lnameC.text,
      // "Class Type": dropdownValue,
      "earning_balance": 0,
      "Image": '',
      "Employee_Off": compId,
      'Date': DateTime.now().toString(),
      "Added": _auth.currentUser!.uid,
      'Phone Number': phone.text,
      "status": '',
      'categories': categoryIds,
      'lastseen': DateTime.now(),
      'token': ''
    };
    await FirebaseFirestore.instance.collection('Members').doc(_auth.currentUser!.uid).set(data);
  }

  @override
  void initState() {
    getCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screesize = MediaQuery.of(context).size; // screen size of the Phone for responsiveness

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: Padding(
          padding: const EdgeInsets.only(top: 4.5),
          child: AppBar(
            centerTitle: true,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Color(0xff83050C),
              statusBarIconBrightness: Brightness.light, // For Android (dark icons)
            ),
            backgroundColor: const Color(0xff83050C),
            title: Text(
              'NEW MEMBER',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color(0xffFFFFFF),
              ),
            ),
            leading: IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => AllMembers(compId: widget.compId)));
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Color(0xffFFFFFF),
              ),
            ),
            elevation: 0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 46,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 23.0, right: 23),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'FIRST NAME',
                      style:
                          TextStyle(color: Color(0xff83050C), fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Container(
                      height: screesize.height / 15.5,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xffDDDCDC),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        validator: (_) {
                          if (_ == null || _ == '') {
                            return 'Enter First Name';
                          } else
                            return null;
                        },
                        controller: fnameC,
                        decoration: InputDecoration(
                            hintStyle: TextStyle(
                                color: Color(0xffC4C4C4), fontSize: 15, fontWeight: FontWeight.w400),
                            hintText: 'E.g., Benjamin',
                            contentPadding: EdgeInsets.fromLTRB(10, 15, 0, 15),
                            border: InputBorder.none),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 23.0, right: 23),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'LAST NAME',
                          style: TextStyle(
                              color: Color(0xff83050C), fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Container(
                      height: screesize.height / 15.5,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xffDDDCDC),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        validator: (_) {
                          if (_ == null || _ == '') {
                            return 'Enter First Name';
                          } else
                            return null;
                        },
                        controller: lnameC,
                        decoration: const InputDecoration(
                            hintStyle: TextStyle(
                                color: Color(0xffC4C4C4), fontSize: 15, fontWeight: FontWeight.w400),
                            hintText: 'E.g., Ahmed',
                            contentPadding: EdgeInsets.fromLTRB(10, 15, 0, 15),
                            border: InputBorder.none),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 23.0, right: 23),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'PHONE NUMBER',
                      style:
                          TextStyle(color: Color(0xff83050C), fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Container(
                      height: screesize.height / 15.5,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xffDDDCDC),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        validator: (_) {},
                        controller: phone,
                        decoration: const InputDecoration(
                            hintStyle: TextStyle(
                                color: Color(0xffC4C4C4), fontSize: 15, fontWeight: FontWeight.w400),
                            hintText: 'Phone Number',
                            contentPadding: EdgeInsets.fromLTRB(10, 18, 0, 15),
                            border: InputBorder.none),
                        keyboardType: TextInputType.phone,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 23.0, right: 23),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Email',
                      style:
                          TextStyle(color: Color(0xff83050C), fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Container(
                      height: screesize.height / 15.5,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xffDDDCDC),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        validator: (_) {
                          var email = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

                          if (_ == null || _ == '') {
                            return ' Enter Mail';
                          } else if (email.hasMatch(_)) {
                            return null;
                          } else
                            return "Wrong Email Adress";
                        },
                        controller: email,
                        decoration: const InputDecoration(
                            hintStyle: TextStyle(
                                color: Color(0xffC4C4C4), fontSize: 15, fontWeight: FontWeight.w400),
                            hintText: 'Email',
                            contentPadding: EdgeInsets.fromLTRB(22, 15, 0, 15),
                            border: InputBorder.none),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 23.0, right: 23),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'USER\'S PASSWORD',
                          style: TextStyle(
                              color: Color(0xff83050C), fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                        const Text(
                          '(Admission Number)',
                          style: const TextStyle(
                              color: Color(0xffC4C4C4), fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Container(
                      height: screesize.height / 15.5,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xffDDDCDC),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        validator: (_) {
                          if (_ == null || _ == '') {
                            return 'Must Enter Password';
                          } else if (_.length < 7) {
                            return 'Password should at least 7 characters';
                          }
                          return null;
                        },
                        controller: pass,
                        decoration: const InputDecoration(
                            hintStyle: TextStyle(
                                color: Color(0xffC4C4C4), fontSize: 15, fontWeight: FontWeight.w400),
                            hintText: 'Admision Number',
                            contentPadding: EdgeInsets.fromLTRB(22, 15, 0, 15),
                            border: InputBorder.none),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 12, left: 25),
                    child: Text(
                      'Select Student Catagory(s)',
                      style: const TextStyle(
                          color: Color(0xff83050C), fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
              ListView.builder(
                  itemCount: categorymodels.isEmpty ? 0 : categorymodels.length,
                  shrinkWrap: true,
                  primary: false,
                  itemBuilder: (context, index) {
                    return categoryItem(categorymodels[index], index);
                  }),
              const SizedBox(height: 80),
              Largebtn(
                txt: 'ADD MEMBER',
                clr: Color(0xff83050C),
                ontap: () async {
                  if (_formKey.currentState!.validate()) {
                    //registerUser(context, widget.compId);
                    if (validateInput()) {
                      loading = true;
                      try {
                        UserCredential credential = await _auth.createUserWithEmailAndPassword(
                          email: email.text,
                          password: pass.text,
                        );
                        User? user = credential.user;
                        if (user != null) {
                          await createUserDatabase(user.uid, widget.compId)
                              .whenComplete(() => showDialog(
                                    context: context,
                                    builder: (_) => AlertDialog(
                                      title: Text('Member Added'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            fnameC.clear();
                                            lnameC.clear();
                                            email.clear();
                                            phone.clear();
                                            pass.clear();
                                            for (var select in categorymodels) {
                                              setState(() {
                                                select.isSelected = false;
                                              });
                                            }
                                            categoryIds.clear();
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        AllMembers(compId: widget.compId)));
                                          },
                                          child: Text('Ok'),
                                        ),
                                      ],
                                    ),
                                  ));
                        }
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'email-already-in-use') {
                          return showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text('Alert'),
                                  content: Text('Email already in use'),
                                  actions: [CloseButton()],
                                );
                              });
                        } else if (e.code == 'Weak Password')
                          ;
                        else
                          return e.message;
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Color(0xff83050C),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7),
                            ),
                            content: Text(
                              "${e}",
                              style: TextStyle(color: Colors.white, fontSize: 19),
                            ),
                            duration: Duration(seconds: 1),
                          ),
                        );
                      } finally {
                        await FirebaseAuth.instance.signOut();

                        UserCredential _userCredential = await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: widget.userEmail!, password: widget.userPassword!);
                      }
                    }
                  }
                },
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget categoryItem(CategoryModel category, int index) {
    return Container(
        padding: const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 30.0, right: 30.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(category.categoryName!),
            Switch(
                value: category.isSelected ?? false,
                onChanged: (value) {
                  setState(() {
                    category.isSelected = value;
                    if (category.isSelected!) {
                      categoryIds.add(category.id.toString());
                    } else {
                      categoryIds.remove(category.id.toString());
                    }
                  });
                })
          ],
        ));
    // Padding(
    //   padding: const EdgeInsets.only(left: 50.0, right: 50.0, top: 10.0, bottom: 3.0),
    //   child: Container(
    //     height: 30,
    //     padding: const EdgeInsets.all(0.0),
    //     child: SwitchListTile(
    //         title: Text(category.categoryName!),
    //         value: isSelected,
    //         controlAffinity: ListTileControlAffinity.trailing,
    //         onChanged: (value) {
    //           setState(() {
    //             isSelected = value;
    //           });
    //         }),
    //   ),
    // );
  }
}

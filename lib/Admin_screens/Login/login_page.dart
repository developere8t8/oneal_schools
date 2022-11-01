import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:oneal_school/Admin_screens/Models/admindata.dart';
import 'package:oneal_school/Admin_screens/welcome_back_screen.dart';
import 'package:oneal_school/Members_screens/Login_member/checkLogin.dart';
import 'package:oneal_school/Members_screens/Login_member/login_member_page.dart';
import 'package:oneal_school/Members_screens/home_member_page.dart';
import 'package:oneal_school/Widgets/large_btn.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

//FirebaseAuth auth = FirebaseAuth.instance;

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final GlobalKey<ScaffoldState> scaffold_key = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool _passwordVisible = false;

  // late String phoneNumber;
  // late String phoneIsoCode;

  // void onPhoneNumberChange(
  //     String number, String internationalizedPhoneNumber, String isoCode) {
  //   setState(() {
  //     phoneNumber = internationalizedPhoneNumber;
  //     phoneIsoCode = isoCode;
  //   });
  // }

  // bool otpVisibilty = false;
  // String verificationID = '';
  // String verificationCode = '';

  String role = 'Admin';

  TextEditingController emailX = TextEditingController(text: 'onealschools@yahoo.com');
  TextEditingController passX = TextEditingController();
  late FirebaseAuth auth;
  // final QuerySnapshot  query= FirebaseFirestore.instance.collection('Admin').snapshots();

  //late String phoneNo, smssent, verificationId;

  // Future<void> verifyPhone() async {
  //   // ignore: prefer_function_declarations_over_variables
  //   final PhoneCodeAutoRetrievalTimeout autoRetrieve = (String verId) {
  //     verificationId = verId;
  //   };
  //   final PhoneCodeSent smsCodeSent = (String verId, [int? forceCodeResend]) {
  //     verificationId = verId;
  //     smsCodeDialoge(context).then((value) {
  //       print("Code Sent");
  //     });
  //   } as PhoneCodeSent;
  //   final PhoneVerificationCompleted verifiedSuccess = (AuthCredential auth) {};
  //   final PhoneVerificationFailed verifyFailed = (FirebaseAuthException e) {
  //     print('${e.message}');
  //   };
  //   await FirebaseAuth.instance.verifyPhoneNumber(
  //     phoneNumber: phoneNo,
  //     timeout: const Duration(seconds: 120),
  //     verificationCompleted: verifiedSuccess,
  //     verificationFailed: verifyFailed,
  //     codeSent: smsCodeSent,
  //     codeAutoRetrievalTimeout: autoRetrieve,
  //   );

  //   //CreatDatabase();
  // }

  // Future smsCodeDialoge(BuildContext context) {
  //   return showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (BuildContext context) {
  //       var errorController;
  //       return AlertDialog(
  //         title: const Text('Provide OTP'),
  //         content: PinCodeTextField(
  //           length: 6,
  //           obscureText: false,
  //           animationType: AnimationType.fade,
  //           animationDuration: const Duration(milliseconds: 300),
  //           errorAnimationController: errorController,
  //           // Pas// s it here
  //           pinTheme: PinTheme(
  //             shape: PinCodeFieldShape.box,
  //             borderRadius: BorderRadius.circular(5),
  //             fieldHeight: 50,
  //             fieldWidth: 40,
  //             activeFillColor: Colors.white,
  //           ),
  //           onChanged: (value) {
  //             setState(() {
  //               smssent = value;
  //             });
  //           },
  //           appContext: context,
  //         ),
  //         contentPadding: const EdgeInsets.all(10.0),
  //         actions: <Widget>[
  //           MaterialButton(
  //               onPressed: () {
  //                 var user = FirebaseAuth.instance.currentUser;
  //                 if (user != null) {
  //                   Navigator.pushReplacement(
  //                     context,
  //                     MaterialPageRoute(builder: (context) => WelcomeBack()),
  //                   );
  //                 } else {
  //                   Navigator.of(context).pop();
  //                   signIn(smssent);
  //                 }
  //               },
  //               child: const Text(
  //                 'Done',
  //                 style: TextStyle(color: Colors.blue),
  //               ))
  //         ],
  //       );
  //     },
  //   );
  // }

  // Future<void> signIn(String smsCode) async {
  //   final AuthCredential credential = PhoneAuthProvider.credential(
  //     verificationId: verificationId,
  //     smsCode: smsCode,
  //   );
  //   await FirebaseAuth.instance.signInWithCredential(credential).then((user) {
  //     //CreatDatabase();
  //     Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => WelcomeBack(),
  //       ),
  //     );
  //   }).catchError((e) {
  //     print(e);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    var screesize = MediaQuery.of(context).size; // screen size of the Phone for responsiveness

    return Scaffold(
      key: scaffold_key,
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: Container(
          height: screesize.height / 1,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Color.fromRGBO(255, 255, 255, 0), Color(0xffFFE7D7)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: screesize.height / 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LogInMember()));
                      },
                      child: const Text(
                        'Member',
                        style: TextStyle(
                          color: Color(0xff959595),
                        ),
                      ),
                    ),
                  ],
                ),
                // SizedBox(
                //   height: screesize.height / 12,
                // ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Oneal',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 32,
                        color: Color(0xff666464),
                      ),
                    ),
                    Text(
                      ' Schools',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 32,
                        color: Color(0xff666464),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'ADMIN LOGIN',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 22,
                    color: Color(0xff83050C),
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                Column(
                  children: [
                    Image.asset(
                      'images/dash.png',
                      height: 200,
                      width: 200,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Parent Payment Management Portal',
                      style: TextStyle(
                          color: Color(
                            0xff333D41,
                          ),
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    // Column(
                    //   children: [
                    //     const Text(
                    //       'PHONE NUMBER',
                    //       style: TextStyle(
                    //           color: Color(0xff83050C),
                    //           fontSize: 12,
                    //           fontWeight: FontWeight.w400),
                    //     ),
                    //     const SizedBox(
                    //       height: 5,
                    //     ),
                    //     SizedBox(
                    //       height: 100,
                    //       width: 250,
                    //       child: IntlPhoneField(
                    //         keyboardType: TextInputType.phone,
                    //         cursorColor: const Color(0xff83050C),
                    //         dropdownIcon: const Icon(
                    //           Icons.arrow_drop_down,
                    //           color: Color(0xff83050C),
                    //         ),
                    //         decoration: InputDecoration(
                    //           hintText: 'Phone Number',
                    //           labelStyle: const TextStyle(
                    //             color: Colors.red,
                    //           ),
                    //           border: const OutlineInputBorder(
                    //             borderSide: BorderSide(),
                    //           ),
                    //           focusedBorder: OutlineInputBorder(
                    //               borderSide: const BorderSide(
                    //                   color: Color(0xff83050C), width: 1.0),
                    //               borderRadius: BorderRadius.circular(10)),
                    //           enabledBorder: OutlineInputBorder(
                    //               borderSide: const BorderSide(
                    //                   color: Color(0xff83050C), width: 1.0),
                    //               borderRadius: BorderRadius.circular(10)),
                    //         ),
                    //         initialCountryCode: 'PK',
                    //         onChanged: (value) {
                    //           phoneNo = value.completeNumber;
                    //         },
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    Column(
                      children: [
                        const Text(
                          'EMAIL',
                          style: TextStyle(
                              color: Color(0xff83050C), fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 47,
                          width: 236,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              border: Border.all(
                                color: const Color(0xffDDDCDC),
                                width: 1,
                              )),
                          child: TextFormField(
                            cursorColor: const Color(0xff83050C),
                            decoration: const InputDecoration(
                                contentPadding: EdgeInsets.only(left: 10),
                                border: InputBorder.none,
                                hintText: 'Enter Email',
                                hintStyle: TextStyle(
                                    color: Color(0xffC4C4C4),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400)),
                            validator: (_) {
                              var email = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                              if (_ == null || _ == '') {
                                showDialog(
                                    context: context,
                                    builder: (_) => AlertDialog(
                                          content: const Text("Enter Your Mail"),
                                          actions: [
                                            TextButton(
                                                onPressed: () => Navigator.pop(context),
                                                child: const Text('Close'))
                                          ],
                                        ));
                              } else if (email.hasMatch(_)) {
                                return null;
                              } else
                                return "Wrong Email Adress";
                            },
                            controller: emailX,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Column(
                      children: [
                        const Text(
                          'PASSWORD',
                          style: TextStyle(
                              color: Color(0xff83050C), fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 55,
                          width: 236,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              border: Border.all(
                                color: const Color(0xffDDDCDC),
                                //width: 1,
                              )),
                          child: TextFormField(
                            obscureText: !_passwordVisible,
                            cursorColor: const Color(0xff83050C),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(left: 10, top: 20),
                              border: InputBorder.none,
                              hintText: 'Enter Password',
                              hintStyle: const TextStyle(
                                  color: Color(0xffC4C4C4), fontSize: 15, fontWeight: FontWeight.w400),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                                icon: Icon(
                                  _passwordVisible ? Icons.visibility : Icons.visibility_off,
                                  color: Colors.grey.withOpacity(0.6),
                                ),
                              ),
                            ),
                            validator: (_) {
                              if (_ == null || _ == '') {
                                return 'Must Enter Password';
                              } else if (_.length < 7) {
                                return 'Password should at least 7 characters';
                              }
                              return null;
                            },
                            controller: passX,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ClipRect(
                      child: isLoading
                          ? const SizedBox(
                              height: 50,
                              width: 50,
                              child: LoadingIndicator(
                                indicatorType: Indicator.ballPulse,

                                /// Required, The loading type of the widget
                                colors: [Color(0xff83050C)],
                              ))
                          : Largebtn(
                              txt: 'LOGIN',
                              ontap: () {
                                if (_formKey.currentState!.validate()) {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  adminLogin();
                                  //checkingAdmin();
                                  //verifyPhone();
                                }
                              },
                              clr: const Color(0xff83050C),
                            ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextButton(
                        onPressed: () async {
                          try {
                            QuerySnapshot snap =
                                await FirebaseFirestore.instance.collection('Admin').get();
                            if (snap.docs.isNotEmpty) {
                              AdminData data =
                                  AdminData.fromMap(snap.docs.first.data() as Map<String, dynamic>);
                              await FirebaseAuth.instance.sendPasswordResetEmail(email: data.email!);

                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        title: Text('Error'),
                                        content: Text('Password reset email sent'),
                                        actions: [CloseButton()],
                                      ));
                            }
                          } catch (e) {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      title: Text('Error'),
                                      content: Text(e.toString()),
                                      actions: [CloseButton()],
                                    ));
                          }
                        },
                        child: Text('Reset Password?')),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future adminLogin() async {
    try {
      setState(() {
        isLoading = true;
      });

      QuerySnapshot snap = await FirebaseFirestore.instance
          .collection('Admin')
          .where('email', isEqualTo: emailX.text)
          .get();

      if (snap.docs.isNotEmpty) {
        UserCredential _userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: emailX.text, password: passX.text);
        final tokenupdate =
            FirebaseFirestore.instance.collection('Admin').doc(_userCredential.user!.uid);
        String? token = await FirebaseMessaging.instance.getToken();
        await tokenupdate.update({'token': token});
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => WelcomeBack(
                      userEmail: emailX.text,
                      userPassword: passX.text,
                    )));
        // UserCredential userCredential = await FirebaseAuth.instance
        //     .createUserWithEmailAndPassword(email: emailX.text, password: passX.text);

        // UserCredential _userCredential = await FirebaseAuth.instance
        //     .signInWithEmailAndPassword(email: emailX.text, password: passX.text);
        // final user = await FirebaseAuth.instance.currentUser;

        // if (user != null) {
        //   final newadmin = FirebaseFirestore.instance.collection('Admin').doc(user.uid);
        //   newadmin.set({
        //     'Account Holder Name': 'accountHolder',
        //     'Account Number': '1234545',
        //     'Added By': user.uid,
        //     'Bank name': 'asdf',
        //     'Check': 'pass',
        //     'Company': 'Oneal School',
        //     'Defult Amount': '0',
        //     'Image':
        //         'https://firebasestorage.googleapis.com/v0/b/testoneal.appspot.com/o/images%2Fpost_1664262436729.jpg?alt=media&token=33bdeae9-78be-4f5d-9b39-253ce924e818',
        //     'email': 'onealschools@yahoo.com'
        //   });
        //}
      } else {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text('Error'),
                  content: Text('Your are Not an Admin'),
                  actions: [CloseButton()],
                ));
      }
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text('Error'),
                content: Text(e.toString()),
                actions: [CloseButton()],
              ));
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  //checking admin credentials

  // Future checkingAdmin() async {
  //   QuerySnapshot snap = await FirebaseFirestore.instance
  //       .collection('Admin')
  //       .where('Phone Number', isEqualTo: phoneNo)
  //       .get();
  //   if (snap.docs.isNotEmpty) {
  //     verifyPhone();
  //   } else {
  //     setState(() {
  //       isLoading = false;
  //       showDialog(
  //           context: context,
  //           builder: (context) {
  //             return AlertDialog(
  //               title: Text('Error'),
  //               content: Text('Enter The Correct Phone Number'),
  //             );
  //           });
  //     });
  //   }
  // }

  // void CreatDatabase() async {
  //   final user = FirebaseAuth.instance.currentUser;
  //   Map<String, dynamic> deta = {
  //     "Check": role,
  //     "Company": 'Oneal Schools',
  //     "Added By": user!.uid,
  //     "Image":
  //         'https://www.lansweeper.com/wp-content/uploads/2018/05/ASSET-USER-ADMIN.png',
  //     "Defult Amount": '',
  //     'Phone Number': phoneNo,
  //     "Bank name": 'The Trade Lmt',
  //     "Account Number": '00231245',
  //     "Account Holder Name": "Jack Edwon",
  //   };
  //   await FirebaseFirestore.instance.collection('Admin').add(deta);
  // }
}

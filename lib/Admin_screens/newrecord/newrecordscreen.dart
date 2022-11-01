// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:oneal_school/Admin_screens/Models/cateogryModel.dart';
// import 'package:oneal_school/Admin_screens/Models/members.dart';
// import 'package:oneal_school/Admin_screens/newrecord/controller/creditrecordcontroller.dart';
// import 'package:oneal_school/Widgets/large_btn.dart';

// import '../welcome_back_screen.dart';

// class NewRecord extends StatefulWidget {
//   final String transType;

//   const NewRecord({Key? key, required this.transType}) : super(key: key);
//   @override
//   State<NewRecord> createState() => _NewRecordState();
// }

// class _NewRecordState extends State<NewRecord> {
//   String Date1 = '';
//   int? amount;
//   bool secVisible = true;
//   String paymentType = '';

//   final NewRecordController newrecordC = Get.put(NewRecordController());
//   TextEditingController admintext = TextEditingController();
//   TextEditingController amountController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     var screesize = MediaQuery.of(context)
//         .size; // screen size of the Phone for responsiveness

//     return WillPopScope(
//       onWillPop: () async => false,
//       child: Scaffold(
//         resizeToAvoidBottomInset: false,
//         appBar: PreferredSize(
//           preferredSize: const Size.fromHeight(70),
//           child: Padding(
//             padding: const EdgeInsets.only(top: 4.5),
//             child: AppBar(
//               elevation: 0,
//               systemOverlayStyle: const SystemUiOverlayStyle(
//                 statusBarColor: Color(0xff83050C),
//                 statusBarIconBrightness:
//                     Brightness.light, // For Android (dark icons)
//               ),
//               leading: IconButton(
//                 onPressed: () {
//                   Navigator.pushReplacement(context,
//                       MaterialPageRoute(builder: (context) => WelcomeBack()));
//                 },
//                 icon: const Icon(
//                   Icons.arrow_back_ios,
//                   color: Colors.white,
//                 ),
//               ),
//               centerTitle: true,
//               backgroundColor: const Color(0xff83050C),
//               title: const Text(
//                 "NEW RECORD",
//                 style: const TextStyle(
//                     color: Color(0xFFFFFFFF),
//                     fontWeight: FontWeight.w600,
//                     fontSize: 20),
//               ),
//             ),
//           ),
//         ),
//         body: SingleChildScrollView(
//           child: Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(
//                   height: 35,
//                 ),

//                 Obx(
//                   () => Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       newrecordC.transtypee.value == "Debit"
//                           ? InkWell(
//                               onTap: () {
//                                 setState(() {
//                                   newrecordC.isdebit = true;
//                                 });
//                                 print(newrecordC.isdebit);
//                                 newrecordC.transtypee.value = "Debit";
//                               },
//                               child: Container(
//                                 decoration: const BoxDecoration(
//                                     color: Color(0xff83050C),
//                                     borderRadius: BorderRadius.only(
//                                         topLeft: Radius.circular(5),
//                                         bottomLeft: Radius.circular(5))),
//                                 child: Padding(
//                                   padding:
//                                       const EdgeInsets.fromLTRB(20, 14, 20, 14),
//                                   child: Text(
//                                     widget.transType,
//                                     style: const TextStyle(
//                                         color: Color(0xFFFFFFFF),
//                                         fontWeight: FontWeight.w700,
//                                         fontSize: 20),
//                                   ),
//                                 ),
//                               ),
//                             )
//                           : InkWell(
//                               onTap: () {
//                                 setState(() {
//                                   newrecordC.isdebit = true;
//                                 });
//                               },
//                               child: Container(
//                                 decoration: const BoxDecoration(
//                                     color: Color(0xFFE2E2E2),
//                                     borderRadius: BorderRadius.only(
//                                         topLeft: Radius.circular(5),
//                                         bottomLeft: Radius.circular(5))),
//                                 child: Padding(
//                                   padding:
//                                       const EdgeInsets.fromLTRB(20, 14, 20, 14),
//                                   child: Text(
//                                     widget.transType,
//                                     style: const TextStyle(
//                                         color:
//                                             const Color.fromRGBO(0, 0, 0, 0.35),
//                                         fontWeight: FontWeight.w700,
//                                         fontSize: 20),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                       // newrecordC.transtypee.value == "Credit"
//                       //     ? InkWell(
//                       //         onTap: () {
//                       //           setState(() {
//                       //             newrecordC.isdebit = false;
//                       //           });
//                       //           print(newrecordC.isdebit);
//                       //           newrecordC.transtypee.value = "Credit";
//                       //         },
//                       //         child: Container(
//                       //           decoration: const BoxDecoration(
//                       //               color: Color(0xff83050C),
//                       //               borderRadius: BorderRadius.only(
//                       //                   topRight: Radius.circular(5), bottomRight: Radius.circular(5))),
//                       //           child: const Padding(
//                       //             padding: EdgeInsets.fromLTRB(20, 14, 20, 14),
//                       //             child: Text(
//                       //               "CREDIT",
//                       //               style: TextStyle(
//                       //                   color: Color(0xFFFFFFFF),
//                       //                   fontWeight: FontWeight.w700,
//                       //                   fontSize: 20),
//                       //             ),
//                       //           ),
//                       //         ),
//                       //       )
//                       //     : InkWell(
//                       //         onTap: () {
//                       //           setState(() {
//                       //             newrecordC.isdebit = false;
//                       //           });
//                       //           print(newrecordC.isdebit);
//                       //           newrecordC.transtypee.value = "Credit";
//                       //         },
//                       //         child: Container(
//                       //           decoration: BoxDecoration(
//                       //               color: Color(0xFFE2E2E2),
//                       //               borderRadius: BorderRadius.only(
//                       //                   topRight: Radius.circular(5), bottomRight: Radius.circular(5))),
//                       //           child: Padding(
//                       //             padding: EdgeInsets.fromLTRB(20, 14, 20, 14),
//                       //             child: Text(
//                       //               "CREDIT",
//                       //               style: TextStyle(
//                       //                   color: Color.fromRGBO(0, 0, 0, 0.35),
//                       //                   fontWeight: FontWeight.w700,
//                       //                   fontSize: 20),
//                       //             ),
//                       //           ),
//                       //         ),
//                       //       ),
//                     ],
//                   ),
//                 ),

//                 const SizedBox(
//                   height: 15,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 23.0, right: 23),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         'ENTER AMOUNT',
//                         style: const TextStyle(
//                             color: Color(0xff83050C),
//                             fontSize: 12,
//                             fontWeight: FontWeight.w400),
//                       ),
//                       const SizedBox(
//                         height: 6,
//                       ),
//                       Container(
//                         height: screesize.height / 16,
//                         decoration: BoxDecoration(
//                           border: Border.all(
//                             color: const Color(0xffDDDCDC),
//                             width: 1,
//                           ),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: TextFormField(
//                           validator: (_) {
//                             if (_ == null || _ == '') {
//                               return ("Enter Amount");
//                             } else
//                               return null;
//                           },
//                           controller: newrecordC.ammount,
//                           keyboardType: TextInputType.number,
//                           decoration: const InputDecoration(
//                               hintStyle: TextStyle(
//                                   color: Color(0xffC4C4C4),
//                                   fontSize: 15,
//                                   fontWeight: FontWeight.w400),
//                               hintText: 'Numbers Only',
//                               contentPadding:
//                                   const EdgeInsets.fromLTRB(22, 15, 0, 15),
//                               border: InputBorder.none),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 15,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 23.0, right: 23, top: 3),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         'PAYMENT TYPE',
//                         style: const TextStyle(
//                             color: const Color(0xff83050C),
//                             fontSize: 12,
//                             fontWeight: FontWeight.w400),
//                       ),
//                       const SizedBox(
//                         height: 6,
//                       ),
//                       Container(
//                           height: screesize.height / 16,
//                           width: screesize.width / 1,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10.0),
//                             border: Border.all(
//                               color: const Color(0xffDDDCDC),
//                               width: 1,
//                             ),
//                           ),
//                           child: DropdownButtonHideUnderline(
//                             child: Padding(
//                               padding:
//                                   const EdgeInsets.only(right: 8.0, left: 22),
//                               child: DropdownButton<String>(
//                                 icon: const Icon(
//                                   Icons.keyboard_arrow_down,
//                                   color: const Color(0xff83050C),
//                                   size: 20,
//                                 ),
//                                 value: newrecordC.dropdownValue,
//                                 iconSize: 24,
//                                 elevation: 16,
//                                 style: const TextStyle(
//                                     color: const Color(0xffC4C4C4),
//                                     fontSize: 15),
//                                 onChanged: (String? newValue) {
//                                   setState(() {
//                                     newrecordC.dropdownValue = newValue!;
//                                     if (newrecordC.dropdownValue ==
//                                         'Catagory Payment') {
//                                       secVisible = false;
//                                       paymentType = 'Catagory Payment';
//                                     } else {
//                                       secVisible = true;
//                                       paymentType = 'Single Payment';
//                                     }
//                                   });
//                                 },
//                                 items: <String>[
//                                   'Single Payment',
//                                   'Catagory Payment'
//                                 ].map<DropdownMenuItem<String>>((String value) {
//                                   return DropdownMenuItem<String>(
//                                     value: value,
//                                     child: Text(
//                                       value,
//                                     ),
//                                   );
//                                 }).toList(),
//                               ),
//                             ),
//                           )),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 15,
//                 ),

//                 Visibility(
//                     visible: secVisible,
//                     child: Column(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(left: 23.0, right: 23),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               const Text(
//                                 'STUDENT NAME',
//                                 style: TextStyle(
//                                     color: Color(0xff83050C),
//                                     fontSize: 12,
//                                     fontWeight: FontWeight.w400),
//                               ),
//                               const SizedBox(
//                                 height: 6,
//                               ),
//                               InkWell(
//                                   onTap: () {
//                                     bottomshet(context);
//                                   },
//                                   child: Obx(
//                                     () => Container(
//                                       height: screesize.height / 16,
//                                       width: double.infinity,
//                                       decoration: BoxDecoration(
//                                         border: Border.all(
//                                           color: const Color(0xffDDDCDC),
//                                           width: 1,
//                                         ),
//                                         borderRadius: BorderRadius.circular(10),
//                                       ),
//                                       child: Padding(
//                                         padding: const EdgeInsets.fromLTRB(
//                                             22, 12, 0, 10),
//                                         child: newrecordC.selectedmembernamee
//                                                     .value ==
//                                                 ""
//                                             ? Row(
//                                                 children: [
//                                                   const Text(
//                                                     "Select Member",
//                                                     style: TextStyle(
//                                                         color:
//                                                             Color(0xffC4C4C4),
//                                                         fontSize: 15,
//                                                         fontWeight:
//                                                             FontWeight.w400),
//                                                   ),
//                                                   const SizedBox(
//                                                     width: 140,
//                                                   ),
//                                                   Padding(
//                                                     padding:
//                                                         const EdgeInsets.only(
//                                                       left: 33,
//                                                     ),
//                                                     child: IconButton(
//                                                       onPressed: () {
//                                                         bottomshet(context);
//                                                       },
//                                                       icon: const Icon(
//                                                         Icons
//                                                             .keyboard_arrow_down,
//                                                         color:
//                                                             Color(0xff83050C),
//                                                         size: 20,
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ],
//                                               )
//                                             : Row(
//                                                 children: [
//                                                   Text(
//                                                     newrecordC
//                                                         .selectedmembernamee
//                                                         .value,
//                                                     style: const TextStyle(
//                                                         color: const Color(
//                                                             0xffC4C4C4),
//                                                         fontSize: 15,
//                                                         fontWeight:
//                                                             FontWeight.w400),
//                                                   ),
//                                                   const SizedBox(
//                                                     width: 180,
//                                                   ),
//                                                   IconButton(
//                                                     onPressed: () {},
//                                                     icon: const Icon(
//                                                       Icons.keyboard_arrow_down,
//                                                       color: const Color(
//                                                           0xff83050C),
//                                                       size: 22,
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                       ),
//                                     ),
//                                   )),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 15,
//                         ),
//                       ],
//                     )),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 23.0, right: 23),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         'SELECT TRANSACTION CATEGORY',
//                         style: const TextStyle(
//                             color: const Color(0xff83050C),
//                             fontSize: 12,
//                             fontWeight: FontWeight.w400),
//                       ),
//                       const SizedBox(
//                         height: 6,
//                       ),
//                       InkWell(
//                           onTap: () {
//                             Categoryshet(context);
//                           },
//                           child: Obx(
//                             () => Container(
//                               height: screesize.height / 16,
//                               width: double.infinity,
//                               decoration: BoxDecoration(
//                                 border: Border.all(
//                                   color: const Color(0xffDDDCDC),
//                                   width: 1,
//                                 ),
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               child: Padding(
//                                 padding:
//                                     const EdgeInsets.fromLTRB(22, 12, 0, 10),
//                                 child: newrecordC.selectedCategory.value == ""
//                                     ? Row(
//                                         children: [
//                                           const Text(
//                                             "Select Category",
//                                             style: const TextStyle(
//                                                 color: const Color(0xffC4C4C4),
//                                                 fontSize: 15,
//                                                 fontWeight: FontWeight.w400),
//                                           ),
//                                           const SizedBox(
//                                             width: 135,
//                                           ),
//                                           IconButton(
//                                             onPressed: () {
//                                               Categoryshet(context);
//                                             },
//                                             icon: Padding(
//                                               padding: const EdgeInsets.only(
//                                                   left: 37),
//                                               child: const Icon(
//                                                 Icons.keyboard_arrow_down,
//                                                 color: const Color(0xff83050C),
//                                                 size: 20,
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       )
//                                     : Row(
//                                         children: [
//                                           Text(
//                                             newrecordC.selectedCategory.value,
//                                             style: const TextStyle(
//                                                 color: Color(0xffC4C4C4),
//                                                 fontSize: 15,
//                                                 fontWeight: FontWeight.w400),
//                                           ),
//                                           const SizedBox(
//                                             width: 175,
//                                           ),
//                                           IconButton(
//                                             onPressed: () {
//                                               Categoryshet(context);
//                                             },
//                                             icon: const Icon(
//                                               Icons.keyboard_arrow_down,
//                                               color: Color(0xff83050C),
//                                               size: 22,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                               ),
//                             ),
//                           )),
//                     ],
//                   ),
//                 ),

//                 const SizedBox(
//                   height: 15,
//                 ),

//                 // if(FirebaseAuth.instance.currentUser!.displayName == )

//                 // Padding(
//                 //   padding: EdgeInsets.only(left: 23.0, right: 23),
//                 //   child: Column(
//                 //     crossAxisAlignment: CrossAxisAlignment.start,
//                 //     children: [
//                 //       Text(
//                 //         'ADMIN PASSWORD',
//                 //         style: TextStyle(
//                 //             color: Color(0xff83050C),
//                 //             fontSize: 12,
//                 //             fontWeight: FontWeight.w400),
//                 //       ),
//                 //       SizedBox(
//                 //         height: 6,
//                 //       ),
//                 //       Container(
//                 //         height: screesize.height / 16,
//                 //         decoration: BoxDecoration(
//                 //           border: Border.all(
//                 //             color: const Color(0xffDDDCDC),
//                 //             width: 1,
//                 //           ),
//                 //           borderRadius: BorderRadius.circular(10),
//                 //         ),
//                 //         child: TextFormField(
//                 //           validator: (_) {
//                 //             if (_ == null || _ == '') {
//                 //               return ("Enter Password");
//                 //             } else
//                 //               return null;
//                 //           },
//                 //           decoration: const InputDecoration(
//                 //               hintStyle: TextStyle(
//                 //                   color: Color(0xffC4C4C4),
//                 //                   fontSize: 15,
//                 //                   fontWeight: FontWeight.w400),
//                 //               contentPadding:
//                 //                   EdgeInsets.fromLTRB(22, 15, 0, 15),
//                 //               border: InputBorder.none),
//                 //           controller: admintext,
//                 //         ),
//                 //       ),
//                 //     ],
//                 //   ),
//                 // ),

//                 const SizedBox(
//                   height: 120,
//                 ),
//                 // Row(
//                 //   mainAxisAlignment: MainAxisAlignment.center,
//                 //   // ignore: prefer_const_literals_to_create_immutables
//                 //   children: [
//                 //     const Text(
//                 //       "This is a DEDUCTION tansaction (like a invoice)",
//                 //       style: TextStyle(
//                 //           fontSize: 14,
//                 //           fontWeight: FontWeight.w400,
//                 //           color: Color(0xff83050C)),
//                 //     )
//                 //   ],
//                 // ),
//                 const SizedBox(
//                   height: 15,
//                 ),

//                 StreamBuilder<QuerySnapshot>(
//                   stream: FirebaseFirestore.instance
//                       .collection('Admin')
//                       .snapshots(),
//                   builder: (context, snapshot) {
//                     if (snapshot.hasData) {
//                       final mydata = snapshot.data!.docs;
//                       return Center(
//                         child: Largebtn(
//                             txt: 'PREVIEW',
//                             ontap: () async {
//                               if (_formKey.currentState!.validate()) {
//                                 if (paymentType == 'Class Payment') {
//                                   List<MemberData> members = [];
//                                   QuerySnapshot snapCatageory =
//                                       await FirebaseFirestore.instance
//                                           .collection('Categories')
//                                           .where('Category',
//                                               isEqualTo: newrecordC
//                                                   .selectedCategory.value
//                                                   .toString())
//                                           .get();
//                                   if (snapCatageory.docs.isNotEmpty) {
//                                     List<CategoryModel> catageoryModel =
//                                         snapCatageory.docs
//                                             .map((e) => CategoryModel.fromMap(
//                                                 e.data()
//                                                     as Map<String, dynamic>))
//                                             .toList();
//                                     for (var cat in catageoryModel) {
//                                       QuerySnapshot snapMember =
//                                           await FirebaseFirestore.instance
//                                               .collection('Members')
//                                               .where('categories',
//                                                   arrayContains: cat.id)
//                                               .get();
//                                       if (snapMember.docs.isNotEmpty) {
//                                         setState(() {
//                                           members = snapMember.docs
//                                               .map((e) => MemberData.fromMap(
//                                                   e.data()
//                                                       as Map<String, dynamic>))
//                                               .toList();
//                                         });
//                                         if (members.isNotEmpty) {
//                                           for (var mem in members) {
//                                             Map<String, dynamic> data = {
//                                               "Ammount": widget.transType ==
//                                                       'Debit'
//                                                   ? 0 -
//                                                       double.parse(newrecordC
//                                                           .ammount.text)
//                                                   : double.parse(
//                                                       newrecordC.ammount.text),
//                                               "Payment Type": paymentType,
//                                               "typetrans": widget.transType,
//                                               "parentName":
//                                                   '${mem.fname!} ${mem.lname!}',
//                                               "Parentid": mem.added,
//                                               "Transaction Category": newrecordC
//                                                   .selectedCategory.value
//                                                   .toString(),
//                                               "date": DateTime.now(),
//                                               'CompId': mem.employee,
//                                             };
//                                             await FirebaseFirestore.instance
//                                                 .collection('NewRecord')
//                                                 .doc()
//                                                 .set(data);
//                                             if (widget.transType == 'Credit') {
//                                               FirebaseFirestore.instance
//                                                   .collection('Members')
//                                                   .doc(
//                                                     mem.added,
//                                                   )
//                                                   .update({
//                                                 "earning_balance": newrecordC
//                                                         .Currentbalance.value +
//                                                     double.parse(newrecordC
//                                                         .ammount.text),
//                                               });
//                                             } else if (widget.transType ==
//                                                 'Debit') {
//                                               FirebaseFirestore.instance
//                                                   .collection('Members')
//                                                   .doc(mem.added)
//                                                   .update({
//                                                 "earning_balance": newrecordC
//                                                         .Currentbalance.value -
//                                                     double.parse(newrecordC
//                                                         .ammount.text),
//                                               });
//                                             }
//                                           }
//                                         }
//                                       }
//                                     }
//                                   }
//                                   newrecordC.ammount.clear();
//                                   newrecordC.transtype.clear();
//                                   admintext.clear();
//                                   setState(() {
//                                     newrecordC.selectedCategory.value = '';
//                                     newrecordC.selectedmembernamee.value = '';
//                                   });
//                                   showDialog(
//                                     context: context,
//                                     builder: (_) => const AlertDialog(
//                                       title: const Text('Transaction Done'),
//                                     ),
//                                   );
//                                 } else {
//                                   newrecordC.createUserDatabase();
//                                   newrecordC.updatebalance(context);
//                                   newrecordC.ammount.clear();
//                                   newrecordC.transtype.clear();
//                                   admintext.clear();
//                                   showDialog(
//                                     context: context,
//                                     builder: (_) => const AlertDialog(
//                                       title: const Text('Transaction Done'),
//                                     ),
//                                   );
//                                 }

//                                 // ignore: use_build_context_synchronously
//                                 Navigator.pushReplacement(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) => WelcomeBack()));
//                               }
//                             },
//                             clr: const Color(0xff83050C)),
//                       );
//                     }
//                     return const Center(
//                       child: CircularProgressIndicator(
//                         color: Color(0xff83050C),
//                       ),
//                     );
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   void bottomshet(context) {
//     showModalBottomSheet(
//         context: context,
//         builder: (BuildContext bc) {
//           return Container(
//             height: 250,
//             child: SingleChildScrollView(
//               scrollDirection: Axis.vertical,
//               child: Column(
//                 children: [
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   const Text(
//                     'Select Member',
//                     style: const TextStyle(
//                         color: const Color(0xff83050C),
//                         fontSize: 20,
//                         fontWeight: FontWeight.w700),
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   Column(
//                     children: [
//                       StreamBuilder<QuerySnapshot>(
//                         stream: FirebaseFirestore.instance
//                             .collection('Members')
//                             .snapshots(),
//                         builder: (context, snapshot) {
//                           final sc = snapshot.data;
//                           if (snapshot.hasData) {
//                             return SingleChildScrollView(
//                               child: Column(
//                                 children: [
//                                   for (int i = 0;
//                                       i < snapshot.data!.docs.length;
//                                       i++)
//                                     InkWell(
//                                       onTap: () {
//                                         newrecordC.Currentbalance.value =
//                                             sc!.docs[i].get("earning_balance");
//                                         newrecordC.selectedCompId.value =
//                                             sc.docs[i].get("Employee_Off");
//                                         newrecordC.selectedmemberid.value =
//                                             sc.docs[i].get("Added");
//                                         newrecordC.selectedmembernamee.value =
//                                             sc.docs[i].get("fname");
//                                         Navigator.pop(context);
//                                       },
//                                       child: ListTile(
//                                         title: Text(
//                                           "${sc!.docs[i].get("fname")}",
//                                           style: const TextStyle(
//                                               color: Colors.black),
//                                         ),
//                                       ),
//                                     )
//                                 ],
//                               ),
//                             );
//                           }
//                           return const CircularProgressIndicator();
//                         },
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           );
//         });
//   }

//   void Categoryshet(context) {
//     showModalBottomSheet(
//         context: context,
//         builder: (BuildContext bc) {
//           return Container(
//             height: 250,
//             child: SingleChildScrollView(
//               scrollDirection: Axis.vertical,
//               child: Column(
//                 children: [
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   const Text(
//                     'Select Category',
//                     style: const TextStyle(
//                         color: const Color(0xff83050C),
//                         fontSize: 20,
//                         fontWeight: FontWeight.w700),
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   Column(
//                     children: [
//                       StreamBuilder<QuerySnapshot>(
//                         stream: FirebaseFirestore.instance
//                             .collection('Categories')
//                             .snapshots(),
//                         builder: (context, snapshot) {
//                           final sc = snapshot.data;
//                           if (snapshot.hasData) {
//                             return SingleChildScrollView(
//                               child: Column(
//                                 children: [
//                                   for (int i = 0;
//                                       i < snapshot.data!.docs.length;
//                                       i++)
//                                     InkWell(
//                                       onTap: () {
//                                         newrecordC.selectedCategory.value =
//                                             sc!.docs[i].get("Category");
//                                         Navigator.pop(context);
//                                       },
//                                       child: ListTile(
//                                         title: Text(
//                                           "${sc!.docs[i].get("Category")}",
//                                           style: const TextStyle(
//                                               color: Colors.black),
//                                         ),
//                                       ),
//                                     )
//                                 ],
//                               ),
//                             );
//                           }
//                           return const CircularProgressIndicator();
//                         },
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           );
//         });
//   }
// }

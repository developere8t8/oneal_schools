// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
//
// class Scrach extends StatelessWidget {
//   const Scrach({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//
//               //Orange Transport Builder
//
//               StreamBuilder<QuerySnapshot>(
//                 stream: FirebaseFirestore.instance
//                     .collection('NewRecord')
//                     .where('Parentid',
//                     isEqualTo:
//                     FirebaseAuth.instance.currentUser!.uid)
//                     .where('Transaction Category',
//                     isEqualTo: 'Transport')
//                     .snapshots(),
//                 builder: (context, snapshot) {
//                   if (snapshot.hasData) {
//                     final mydata = snapshot.data;
//
//                     {
//                       sum = 0;
//                       for (int j = 0;
//                       j < snapshot.data!.docs.length;
//                       j++) {
//                         tak = '${mydata!.docs[j]['Ammount']}';
//                         sum += int.parse(tak);
//
//                         print(sum);
//                       }
//                     }
//                     for (int i = 0;
//                     i < snapshot.data!.docs.length;
//                     i++)
//                       return InkWell(
//                         onTap: () {
//                           showDialog(
//                             context: context,
//                             builder: (context) => AlertDialog(
//                               backgroundColor: Color(0xffC4C4C4),
//                               title: Center(
//                                 child: Row(
//                                   mainAxisAlignment:
//                                   MainAxisAlignment.center,
//                                   children: [
//                                     SizedBox(
//                                       width: 60,
//                                     ),
//                                     Text(
//                                       'TRANSPORT',
//                                       style: TextStyle(
//                                         fontWeight: FontWeight.w400,
//                                         fontSize: 20.sp,
//                                         color: Color(0xFF83050C),
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       width: 25,
//                                     ),
//                                     IconButton(
//                                       onPressed: () {
//                                         Navigator.pop(context);
//                                       },
//                                       icon: Icon(
//                                         Icons.cancel,
//                                         color: Colors.red,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               content: Builder(
//                                 builder: (context) {
//                                   // Get available height and width of the build area of this widget. Make a choice depending on the size.
//                                   return Container(
//                                     height: 300,
//                                     width: 315,
//                                     child: ListView(
//                                       scrollDirection:
//                                       Axis.vertical,
//                                       children: [
//                                         for (int i = 0;
//                                         i <
//                                             snapshot.data!.docs
//                                                 .length;
//                                         i++)
//                                           Padding(
//                                             padding: const EdgeInsets.only(top: 8.0),
//                                             child: Container(
//                                               width: 276,
//                                               height: 64,
//                                               decoration:
//                                               BoxDecoration(
//                                                 color: Colors.white,
//                                                 borderRadius:
//                                                 BorderRadius
//                                                     .circular(
//                                                     13.r),
//                                               ),
//                                               child: Row(
//                                                 mainAxisAlignment:
//                                                 MainAxisAlignment
//                                                     .spaceBetween,
//                                                 children: [
//                                                   Padding(
//                                                     padding: EdgeInsets
//                                                         .symmetric(
//                                                         horizontal:
//                                                         6.5.w),
//                                                     child: Row(
//                                                       children: [
//                                                         if (mydata!
//                                                             .docs[
//                                                         i]
//                                                             .get(
//                                                             'typetrans') ==
//                                                             'Credit')
//                                                           Image.asset(
//                                                             'assets/icons/Tfee.png',
//                                                             scale: 5,
//                                                             color: Color(
//                                                                 0xff18D193),
//                                                           ),
//                                                         if (mydata
//                                                             .docs[
//                                                         i]
//                                                             .get(
//                                                             'typetrans') ==
//                                                             'Debit')
//                                                           Image.asset(
//                                                             'assets/icons/debit.png',
//                                                             scale: 5,
//                                                           ),
//                                                         SizedBox(
//                                                           width:
//                                                           15.85.w,
//                                                         ),
//                                                         if (mydata
//                                                             .docs[
//                                                         i]
//                                                             .get(
//                                                             'typetrans') ==
//                                                             'Credit')
//                                                           Text(
//                                                             'Credit',
//                                                             style:
//                                                             TextStyle(
//                                                               fontSize:
//                                                               16,
//                                                               fontWeight:
//                                                               FontWeight.w400,
//                                                               color: Color(
//                                                                   0xff18D193),
//                                                             ),
//                                                           ),
//                                                         if (mydata
//                                                             .docs[
//                                                         i]
//                                                             .get(
//                                                             'typetrans') ==
//                                                             'Debit')
//                                                           Text(
//                                                             'Debit',
//                                                             style:
//                                                             TextStyle(
//                                                               fontSize:
//                                                               16,
//                                                               fontWeight:
//                                                               FontWeight.w400,
//                                                               color: Color(
//                                                                   0xFF83050C),
//                                                             ),
//                                                           ),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                   Padding(
//                                                     padding:
//                                                     const EdgeInsets
//                                                         .only(
//                                                         right: 10,
//                                                         top: 10),
//                                                     child: Column(
//                                                       crossAxisAlignment:
//                                                       CrossAxisAlignment
//                                                           .end,
//                                                       children: [
//                                                         SizedBox(
//                                                           height:
//                                                           10.h,
//                                                         ),
//                                                         if (mydata
//                                                             .docs[
//                                                         i]
//                                                             .get(
//                                                             'typetrans') ==
//                                                             'Credit')
//                                                           Text(
//                                                             '\$${mydata.docs[i]['Ammount']}',
//                                                             style:
//                                                             TextStyle(
//                                                               fontSize:
//                                                               15,
//                                                               fontWeight:
//                                                               FontWeight.w600,
//                                                               color: Color(
//                                                                   0xff18D193),
//                                                             ),
//                                                           ),
//                                                         if (mydata
//                                                             .docs[
//                                                         i]
//                                                             .get(
//                                                             'typetrans') ==
//                                                             'Debit')
//                                                           Text(
//                                                             '-\$${mydata.docs[i]['Ammount']}',
//                                                             style:
//                                                             TextStyle(
//                                                               fontSize:
//                                                               15,
//                                                               fontWeight:
//                                                               FontWeight.w600,
//                                                               color: Color(
//                                                                   0xFFE83632),
//                                                             ),
//                                                           ),
//                                                         Text(
//                                                           '${mydata.docs[i]['date']}'
//                                                               .substring(
//                                                               0,
//                                                               10),
//                                                           style:
//                                                           TextStyle(
//                                                             fontSize:
//                                                             11,
//                                                             fontWeight:
//                                                             FontWeight
//                                                                 .w400,
//                                                             color: Color(
//                                                                 0xFF959595),
//                                                           ),
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                           ),
//                                       ],
//                                     ),
//                                   );
//                                 },
//                               ),
//                             ),
//                           );
//                         },
//                         child: Container(
//                           width: screenSize.width / 2.38,
//                           height: screenSize.height / 5,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(13),
//                             gradient: LinearGradient(
//                                 begin: Alignment.topLeft,
//                                 end: Alignment.bottomRight,
//                                 colors: [
//                                   Color(0xFFFF7F27),
//                                   Color(0xFFFFA96D),
//                                 ]),
//                           ),
//                           child: Stack(
//                             children: <Widget>[
//                               Positioned(
//                                 child: Image.asset(
//                                   'assets/icons/design.png',
//                                 ),
//                               ),
//                               Positioned(
//                                 top: 15,
//                                 left: 12,
//                                 child: Image.asset(
//                                   'assets/icons/transport.png',
//                                   //scale: 5,
//                                   width: 61.77,
//                                   height: 61.77,
//                                 ),
//                               ),
//                               Positioned(
//                                 top: 88,
//                                 left: 18,
//                                 child: Text(
//                                   'TRANSPORT',
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.w500,
//                                     fontSize: 20.sp,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                               ),
//                               Positioned(
//                                 top: 117,
//                                 left: 18,
//                                 child: Text(
//                                   '\$${sum}',
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.w500,
//                                     fontSize: 20.sp,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                   }
//                   return Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 },
//               ),
//
//               //Purple Tuition Builder
//
//
//               StreamBuilder<QuerySnapshot>(
//                 stream: FirebaseFirestore.instance
//                     .collection('NewRecord')
//                     .where('Parentid',
//                     isEqualTo:
//                     FirebaseAuth.instance.currentUser!.uid)
//                     .where('Transaction Category',
//                     isEqualTo: 'Tuition')
//                     .snapshots(),
//                 builder: (context, snapshot) {
//                   if (snapshot.hasData) {
//                     final mydata = snapshot.data;
//
//                     {
//                       sum = 0;
//                       for (int j = 0;
//                       j < snapshot.data!.docs.length;
//                       j++) {
//                         tak = '${mydata!.docs[j]['Ammount']}';
//                         sum += int.parse(tak);
//
//                         print(sum);
//                       }
//                     }
//                     for (int i = 0;
//                     i < snapshot.data!.docs.length;
//                     i++)
//                       return InkWell(
//                         onTap: () {
//                           showDialog(
//                             context: context,
//                             builder: (context) => AlertDialog(
//                               backgroundColor: Color(0xffC4C4C4),
//                               title: Center(
//                                 child: Row(
//                                   mainAxisAlignment:
//                                   MainAxisAlignment.center,
//                                   children: [
//                                     SizedBox(
//                                       width: 60,
//                                     ),
//                                     Text(
//                                       'TUTION',
//                                       style: TextStyle(
//                                         fontWeight: FontWeight.w400,
//                                         fontSize: 20.sp,
//                                         color: Color(0xFF83050C),
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       width: 25,
//                                     ),
//                                     IconButton(
//                                       onPressed: () {
//                                         Navigator.pop(context);
//                                       },
//                                       icon: Icon(
//                                         Icons.cancel,
//                                         color: Colors.red,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               content: Builder(
//                                 builder: (context) {
//                                   return Container(
//                                       height: 300,
//                                       width: 315,
//                                       child: ListView(
//                                         scrollDirection:
//                                         Axis.vertical,
//                                         children: [
//                                           for (int i = 0;
//                                           i <
//                                               snapshot.data!
//                                                   .docs.length;
//                                           i++)
//                                             Padding(
//                                               padding: const EdgeInsets.only(top: 8.0),
//                                               child: Container(
//                                                 width: 276,
//                                                 height: 64,
//                                                 decoration:
//                                                 BoxDecoration(
//                                                   color: Colors.white,
//                                                   borderRadius:
//                                                   BorderRadius
//                                                       .circular(
//                                                       13.r),
//                                                 ),
//                                                 child: Row(
//                                                   mainAxisAlignment:
//                                                   MainAxisAlignment
//                                                       .spaceBetween,
//                                                   children: [
//                                                     Padding(
//                                                       padding: EdgeInsets
//                                                           .symmetric(
//                                                           horizontal:
//                                                           6.5.w),
//                                                       child: Row(
//                                                         children: [
//                                                           if (mydata!
//                                                               .docs[
//                                                           i]
//                                                               .get(
//                                                               'typetrans') ==
//                                                               'Credit')
//                                                             Image
//                                                                 .asset(
//                                                               'assets/icons/Tfee.png',
//                                                               scale:
//                                                               5,
//                                                               color: Color(
//                                                                   0xff18D193),
//                                                             ),
//                                                           if (mydata
//                                                               .docs[
//                                                           i]
//                                                               .get(
//                                                               'typetrans') ==
//                                                               'Debit')
//                                                             Image
//                                                                 .asset(
//                                                               'assets/icons/debit.png',
//                                                               scale:
//                                                               5,
//                                                             ),
//                                                           SizedBox(
//                                                             width:
//                                                             15.85
//                                                                 .w,
//                                                           ),
//                                                           if (mydata
//                                                               .docs[i]
//                                                               .get('typetrans') ==
//                                                               'Credit')
//                                                             Text(
//                                                               'Credit',
//                                                               style:
//                                                               TextStyle(
//                                                                 fontSize:
//                                                                 16,
//                                                                 fontWeight:
//                                                                 FontWeight.w400,
//                                                                 color:
//                                                                 Color(0xff18D193),
//                                                               ),
//                                                             ),
//                                                           if (mydata
//                                                               .docs[i]
//                                                               .get('typetrans') ==
//                                                               'Debit')
//                                                             Text(
//                                                               'Debit',
//                                                               style:
//                                                               TextStyle(
//                                                                 fontSize:
//                                                                 16,
//                                                                 fontWeight:
//                                                                 FontWeight.w400,
//                                                                 color:
//                                                                 Color(0xFF83050C),
//                                                               ),
//                                                             ),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                     Padding(
//                                                       padding:
//                                                       const EdgeInsets
//                                                           .only(
//                                                           right:
//                                                           10,
//                                                           top:
//                                                           10),
//                                                       child: Column(
//                                                         crossAxisAlignment:
//                                                         CrossAxisAlignment
//                                                             .end,
//                                                         children: [
//                                                           SizedBox(
//                                                             height:
//                                                             10.h,
//                                                           ),
//                                                           if (mydata
//                                                               .docs[i]
//                                                               .get('typetrans') ==
//                                                               'Credit')
//                                                             Text(
//                                                               '\$${mydata.docs[i]['Ammount']}',
//                                                               style:
//                                                               TextStyle(
//                                                                 fontSize:
//                                                                 15,
//                                                                 fontWeight:
//                                                                 FontWeight.w600,
//                                                                 color:
//                                                                 Color(0xff18D193),
//                                                               ),
//                                                             ),
//                                                           if (mydata
//                                                               .docs[i]
//                                                               .get('typetrans') ==
//                                                               'Debit')
//                                                             Text(
//                                                               '-\$${mydata.docs[i]['Ammount']}',
//                                                               style:
//                                                               TextStyle(
//                                                                 fontSize:
//                                                                 15,
//                                                                 fontWeight:
//                                                                 FontWeight.w600,
//                                                                 color:
//                                                                 Color(0xFFE83632),
//                                                               ),
//                                                             ),
//                                                           Text(
//                                                             '${mydata.docs[i]['date']}'
//                                                                 .substring(
//                                                                 0,
//                                                                 10),
//                                                             style:
//                                                             TextStyle(
//                                                               fontSize:
//                                                               11,
//                                                               fontWeight:
//                                                               FontWeight.w400,
//                                                               color: Color(
//                                                                   0xFF959595),
//                                                             ),
//                                                           ),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                             ),
//                                         ],
//                                       ));
//                                 },
//                               ),
//                             ),
//                           );
//                         },
//                         child: Container(
//                           width: screenSize.width / 2.38,
//                           height: screenSize.height / 5,
//                           decoration: BoxDecoration(
//                             borderRadius:
//                             BorderRadius.circular(13.r),
//                             gradient: LinearGradient(
//                                 begin: Alignment.topLeft,
//                                 end: Alignment.bottomRight,
//                                 colors: [
//                                   Color(0xFFC465FE),
//                                   Color(0xFFCE90FF),
//                                 ]),
//                           ),
//                           child: Stack(
//                             children: <Widget>[
//                               Positioned(
//                                 child: Image.asset(
//                                   'assets/icons/design.png',
//                                 ),
//                               ),
//                               Positioned(
//                                 top: 15,
//                                 left: 12,
//                                 child: Image.asset(
//                                   'assets/icons/Tuition.png',
//                                   //scale: 5,
//                                   width: 61.77,
//                                   height: 61.77,
//                                 ),
//                               ),
//                               Positioned(
//                                 top: 88,
//                                 left: 18,
//                                 child: Text(
//                                   'TUITION',
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.w500,
//                                     fontSize: 20.sp,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                               ),
//                               Positioned(
//                                 top: 117,
//                                 left: 18,
//                                 child: Text(
//                                   '\$${sum}',
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.w500,
//                                     fontSize: 20.sp,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                   }
//                   return Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 },
//               ),
//             ],
//           ),
//
//         ],
//       ),
//     );
//   }
// }

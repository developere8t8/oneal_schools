import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:oneal_school/Widgets/large_btn.dart';

class AddCategory extends StatefulWidget {
  const AddCategory({super.key});

  @override
  State<AddCategory> createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  TextEditingController textC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Add Catagory'),
        centerTitle: true,
        backgroundColor: Color(0xff83050C),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextFormField(
              cursorColor: const Color(0xff83050C),
              cursorHeight: 20,
              decoration: InputDecoration(
                hintText: 'Add Catagory',
                hintStyle: const TextStyle(
                  color: Color(0xffC4C4C4),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xff83050C), width: 1.0),
                    borderRadius: BorderRadius.circular(10)),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xff83050C), width: 1.0),
                    borderRadius: BorderRadius.circular(10)),
              ),
              controller: textC,
            ),
          ),
          SizedBox(height: 25),
          Largebtn(
              txt: 'Add',
              ontap: () async {
                final newCat = FirebaseFirestore.instance.collection('Categories').doc();
                Map<String, dynamic> deta = {
                  "Category": textC.text,
                  "Added By": FirebaseAuth.instance.currentUser!.uid,
                  "id": newCat.id
                };
                await newCat.set(deta);
                textC.clear();
                Navigator.pop(context);
              },
              clr: Colors.black)
        ],
      ),
    ));
  }
}

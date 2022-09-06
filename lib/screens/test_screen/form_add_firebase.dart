import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FormAddFirebase extends StatelessWidget {
  FormAddFirebase({Key? key}) : super(key: key);

  TextEditingController Name = new TextEditingController();
  TextEditingController Email = new TextEditingController();
  TextEditingController Phone = new TextEditingController();
  TextEditingController Message = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          child:Column(
            children: [
              Container(

                padding: EdgeInsets.fromLTRB(700, 30, 100, 0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.person),
                    hintText: 'Enter your full name',
                    labelText: 'Name',
                  ),
                ),
              ),
              Container(

                padding: EdgeInsets.fromLTRB(700, 30, 100, 0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.email),
                    hintText: 'Enter your Email',
                    labelText: 'Email ID',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(700, 30, 100, 0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.phone),
                    hintText: 'Enter your Phone No.',
                    labelText: 'Phone No.',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(700, 30, 100, 0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.message),
                    hintText: 'Message',
                    labelText: 'Message',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(700, 30, 100, 0),
                constraints: const BoxConstraints(minWidth: double.infinity),
                child: ElevatedButton(
                  onPressed: () {
                    Map <String,dynamic> data = {
                      "field1":Name.text,
                      "field2":Email.text,
                      "field2":Phone.text,
                      "field2":Message.text};
                    FirebaseFirestore.instance.collection("test").add(data);
                  },
                  child: Text("Submit Request"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple,),
                ),
              ),

            ],
          )
      ),
    );
  }
}

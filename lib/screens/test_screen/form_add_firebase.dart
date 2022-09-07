import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FormAddFirebase extends StatelessWidget {
  FormAddFirebase({Key? key}) : super(key: key);

  TextEditingController Name = new TextEditingController();
  TextEditingController Email = new TextEditingController();
  TextEditingController Phone = new TextEditingController();
  TextEditingController Message = new TextEditingController();

  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          key: _formKey,
          child:Column(
            children: [
              Container(

                padding: EdgeInsets.fromLTRB(700, 30, 100, 0),
                child: TextFormField(
                  controller: Name,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.person),
                    hintText: 'Enter your full name',
                    labelText: 'Name',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(700, 30, 100, 0),
                child: TextFormField(
                  controller: Email,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.email),
                    hintText: 'Enter your Email',
                    labelText: 'Email ID',
                  ),
                  validator: (value) {
                    if(value == null || value.isEmpty || !value.contains('@') || !value.contains('.')){
                      return 'Invalid Email';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(700, 30, 100, 0),
                child: TextFormField(
                  controller: Phone,
                  validator: (value){
                    //if (value != null)
                    if(value?.length != 10){
                      return 'Mobile Number must be of 10 digit';
                    } else {
                      return null;
                    }
                  },
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.phone),
                    hintText: 'Enter your Phone No.',
                    labelText: 'Phone No.',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(700, 30, 100, 0),
                child: TextFormField(controller: Message,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.message),
                    hintText: 'Message',
                    labelText: 'Message',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(700, 30, 100, 0),
                constraints: const BoxConstraints(minWidth: double.infinity),
                child: ElevatedButton(
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                      if (_formKey.currentState!.validate()) {
                        // If the form is valid, display a snackbar. In the real world,
                        // you'd often call a server or save the information in a database.
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
                      }
                    Map <String,dynamic> data = {
                      "name":Name.text,
                      "email":Email.text,
                      "phone":Phone.text,
                      "message":Message.text};
                    print(data);
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

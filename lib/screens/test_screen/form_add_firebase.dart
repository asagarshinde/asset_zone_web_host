import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FormAddFirebase extends StatefulWidget {
  FormAddFirebase({Key? key}) : super(key: key);

  @override
  State<FormAddFirebase> createState() => _FormAddFirebaseState();
}

class _FormAddFirebaseState extends State<FormAddFirebase> {

  TextEditingController Name = new TextEditingController();
  TextEditingController Email = new TextEditingController();
  TextEditingController Phone = new TextEditingController();
  TextEditingController Pan = new TextEditingController();
  TextEditingController Message = new TextEditingController();
  TextEditingController Bathrooms = TextEditingController();
  TextEditingController Date = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool isSwitched = false;

  @override
  void initState() {
    Date.text = ""; //set the initial value of text field
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
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
                      if(value?.length != 10 ){
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
                  child: TextFormField(
                    controller: Pan,
                    validator: (value){
                      //if (value != null)
                      if(!value!.contains(r'^[2-9]{1}[0-9]{3}\\s[0-9]{4}\\s[0-9]{4}$')){
                        return 'Pan Number is not valid';
                      } else {
                        return null;
                      }
                    },
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.credit_card_outlined),
                      hintText: 'Enter your Pan card No.',
                      labelText: 'PanCard No.',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(700, 30, 100, 0),
                  child: TextFormField(
                    controller: Message,
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
                  child: Switch(
                    value: isSwitched,
                    activeColor: Colors.blue,
                    onChanged: (value) {
                      setState(() {
                        isSwitched = value;
                        print(value);
                      });
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(700, 30, 100, 0),
                  child: TextFormField(
                    controller: Bathrooms,
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.bathtub_outlined),
                      hintText: 'Enter the no of bathrooms',
                      labelText: 'Bathrooms',
                    ),
                  ),
                ),
                Container(
                    padding: EdgeInsets.fromLTRB(700, 30, 100, 0),
                    //height: MediaQuery.of(context).size.width / 3,
                    child: Center(
                        child: TextField(
                          controller: Date,
                          //editing controller of this TextField
                          decoration: InputDecoration(
                              icon: Icon(Icons.calendar_today), //icon of text field
                              labelText: "Enter Date" //label text of field
                          ),
                          readOnly: true,
                          //set it true, so that user will not able to edit text
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1950),
                                //DateTime.now() - not to allow to choose before today.
                                lastDate: DateTime(2100));

                            if (pickedDate != null) {
                              print(
                                  pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                              String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                              print(
                                  formattedDate); //formatted date output using intl package =>  2021-03-16
                              setState(() {
                                Date.text =
                                    formattedDate; //set output date to TextField value.
                              });
                            } else {}
                          },
                        )
                    )
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
                          "property_about" : {
                            "bathrooms": Bathrooms.text,
                          },
                       "contact_info": {
                         "name":Name.text,
                         "email":Email.text,
                         "phone":Phone.text,
                         "message":Message.text,
                         "pan":Pan.text,
                         "date":Date.text,
                         "on": isSwitched,
                       },

                        };
                      print(data);
                      //FirebaseFirestore.instance.collection("test").add(data);
                    },
                    child: Text("Submit Request"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.purple,),
                  ),
                ),

              ],
            )
        ),
      ),
    );
  }
}

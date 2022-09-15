import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class FormAddFirebase extends StatefulWidget {
  FormAddFirebase({Key? key}) : super(key: key);

  @override
  State<FormAddFirebase> createState() => _FormAddFirebaseState();
}

class _FormAddFirebaseState extends State<FormAddFirebase> {
  //{ property details

  //contact info
  TextEditingController Name = new TextEditingController();
  TextEditingController Email = new TextEditingController();
  TextEditingController Phone = new TextEditingController();
  TextEditingController Pan = new TextEditingController();
  TextEditingController Message = new TextEditingController();

  //property about
  TextEditingController Bathrooms = TextEditingController();
  TextEditingController Balcony = TextEditingController();
  TextEditingController Bedrooms = TextEditingController();
  TextEditingController City = TextEditingController();
  TextEditingController Garage = TextEditingController();
  TextEditingController Halls = TextEditingController();
  TextEditingController Price = TextEditingController();
  TextEditingController PropertyId = TextEditingController();
  TextEditingController PropertySize = TextEditingController();
  TextEditingController PropertyStatus = TextEditingController();
  TextEditingController PropertyType = TextEditingController();


  TextEditingController Date = TextEditingController();
  TextEditingController FloorPlan = TextEditingController();
  TextEditingController Gallery = TextEditingController();
  TextEditingController Video = TextEditingController();


  bool isFeatured = false;

  //}

  final _formKey = GlobalKey<FormState>();






  @override
  void initState() {
    Date.text = ""; //set the initial value of text field
    super.initState();
  }




  @override
  Widget build(BuildContext context) {

    File _image = File('');

    Future<dynamic> getImage() async {
      PickedFile? pickedFile = await ImagePicker().getImage(
        source: ImageSource.gallery,
      );
      if (pickedFile != null) {
        setState(() {
          _image = File(pickedFile.path);
        });
      }
    }

    Future uploadPic(BuildContext context) async{
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference ref = storage.ref().child('profile/images/'+"image" + DateTime.now().toString());
      UploadTask uploadTask = ref.putFile(_image);
      uploadTask.then((res) {
        res.ref.getDownloadURL();
        print("Upload Image on firebase");
      });
    }




    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: 2500,
          child: Center(
            child: Form(
                key: _formKey,
                child:Column(
                  children: [
                    //{ property details

                    //{ contact info
                    Container(
                      padding: EdgeInsets.fromLTRB(300, 30, 300, 0),
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
                      padding: EdgeInsets.fromLTRB(300, 30, 300, 0),
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
                      padding: EdgeInsets.fromLTRB(300, 30, 300, 0),
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
                      padding: EdgeInsets.fromLTRB(300, 30, 300, 0),
                      child: TextFormField(
                        controller: Pan,
                        validator: (value){
                          //if (value != null)
                          if (value.toString().isEmpty){
                            return "";
                          }
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
                      padding: EdgeInsets.fromLTRB(300, 30, 300, 0),
                      child: TextFormField(
                        controller: Message,
                        minLines: 1,
                        maxLines: 5,
                        keyboardType: TextInputType.multiline,
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
                    // contact info }

                    // { property about             children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(300, 30, 300, 0),
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
                      padding: EdgeInsets.fromLTRB(300, 30, 300, 0),
                      child: TextFormField(
                        controller: Balcony,
                        decoration: const InputDecoration(
                          icon: const Icon(Icons.balcony),
                          hintText: 'Enter the no of balcony',
                          labelText: 'Balcony',
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(300, 30, 300, 0),
                      child: TextFormField(
                        controller: Bedrooms,
                        decoration: const InputDecoration(
                          icon: const Icon(Icons.bedroom_parent),
                          hintText: 'Enter the no of bedrooms',
                          labelText: 'Bedrooms',
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(300, 30, 300, 0),
                      child: TextFormField(
                        controller: City,
                        decoration: const InputDecoration(
                          icon: const Icon(Icons.location_city),
                          hintText: 'Enter city name',
                          labelText: 'City',
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(300, 30, 300, 0),
                      child: TextFormField(
                        controller: Garage,
                        decoration: const InputDecoration(
                          icon: const Icon(Icons.garage),
                          hintText: 'Enter No. of garage',
                          labelText: 'Garage',
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(300, 30, 300, 0),
                      child: TextFormField(
                        controller: Halls,
                        decoration: const InputDecoration(
                          icon: const Icon(Icons.meeting_room_outlined),
                          hintText: 'Enter No. of halls',
                          labelText: 'Halls',
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(300, 30, 300, 0),
                      child: TextFormField(
                        controller: Price,
                        decoration: const InputDecoration(
                          icon: const Icon(Icons.price_change),
                          hintText: 'Price',
                          labelText: 'Price',
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(300, 30, 300, 0),
                      child: TextFormField(
                        controller: PropertyId,
                        decoration: const InputDecoration(
                          icon: const Icon(Icons.garage),
                          hintText: 'PropertyId',
                          labelText: 'PropertyId',
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(300, 30, 300, 0),
                      child: TextFormField(
                        controller: PropertySize,
                        decoration: const InputDecoration(
                          icon: const Icon(Icons.garage),
                          hintText: 'PropertySize',
                          labelText: 'PropertySize',
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(300, 30, 300, 0),
                      child: TextFormField(
                        controller: PropertyStatus,
                        decoration: const InputDecoration(
                          icon: const Icon(Icons.garage),
                          hintText: 'PropertyStatus',
                          labelText: 'PropertyStatus',
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(300, 30, 300, 0),
                      child: TextFormField(
                        controller: PropertyType,
                        decoration: const InputDecoration(
                          icon: const Icon(Icons.garage),
                          hintText: 'PropertyType',
                          labelText: 'PropertyType',
                        ),
                      ),
                    ),
                    // property about }

                    Container(
                      padding: EdgeInsets.fromLTRB(300, 30, 300, 0),
                      child: TextFormField(
                        controller: FloorPlan,
                        decoration: const InputDecoration(
                          icon: const Icon(Icons.next_plan),
                          hintText: 'FloorPlan',
                          labelText: 'FloorPlan',
                        ),
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.fromLTRB(300, 30, 300, 0),
                      child: TextFormField(
                        controller: getImage(),
                        // decoration: const InputDecoration(
                        //   icon: const Icon(Icons.browse_gallery_outlined),
                        //   hintText: 'Gallery',
                        //   labelText: 'Gallery',
                        // ),
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.fromLTRB(300, 30, 300, 0),
                      child: TextFormField(
                        controller: Video,
                        decoration: const InputDecoration(
                          icon: const Icon(Icons.video_call),
                          hintText: 'Video',
                          labelText: 'Video',
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(350, 30, 300, 0),
                          child: Text("Featured"),
                        ),
                        Container(
                          //padding: EdgeInsets.fromLTRB(00, 30, 300, 0),
                          child: Switch(
                            value: isFeatured,
                            activeColor: Colors.blue,
                            onChanged: (value) {
                              setState(() {
                                isFeatured = value;
                                print(value);
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    Container(
                        padding: EdgeInsets.fromLTRB(300, 30, 300, 0),
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

                    // property details }




                    Container(
                      padding: EdgeInsets.fromLTRB(400, 30, 400, 0),
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
                                "balcony": Balcony.text,
                                "bedrooms": Bedrooms.text,
                                "city": City.text,
                                "garage": Garage.text,
                                "halls": Halls.text,
                                "price": Price.text,
                                "property_id": PropertyId.text,
                                "property_size": PropertySize.text,
                                "property_status": PropertyStatus.text,
                                "property_type": PropertyType.text,

                              },
                           "contact_info": {
                             "name":Name.text,
                             "email":Email.text,
                             "phone":Phone.text,
                             "message":Message.text,
                             "pan":Pan.text,

                           },

                            "date":Date.text,
                            "video":Video.text,
                            "gallery":Gallery.text,
                            "floor_plan":FloorPlan.text,
                            "isFeatured": isFeatured,

                            };
                          print(data);
                          //FirebaseFirestore.instance.collection("PropertyDetails").add(data);
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
        ),
      ),
    );
  }
}

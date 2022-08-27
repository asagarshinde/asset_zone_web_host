import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:the_asset_zone_web/models/property_detail_model.dart';


class PropertyDetailsFirestore extends GetxController {
  var firestoreDB = FirebaseFirestore.instance;

  addPropertyDetails(PropertyDetails propertyDetails) async {
    await firestoreDB.collection("PropertyDetails").add(propertyDetails.toMap());
  }

  updatePropertyDetails(PropertyDetails propertyDetails) async {
    await firestoreDB.collection("PropertyDetails").doc(propertyDetails.id).update(propertyDetails.toMap());
  }

  Future<void> deletePropertyDetails(String documentId) async {
    await firestoreDB.collection("PropertyDetails").doc(documentId).delete();

  }

  Future<List<PropertyDetails>> retrievePropertyDetails() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
    await firestoreDB.collection("PropertyDetails").get();
    return snapshot.docs
        .map((docSnapshot) => PropertyDetails.fromDocumentSnapshot(docSnapshot))
        .toList();
  }





// getSummaryForCards(int number_of_properties ){
  //   StreamBuilder(
  //     stream: firestoreDB,
  //     builder: (context,snapshots){
  //       if(!snapshots.hasData) return CircularProgressIndicator();
  //       return ListView.builder(
  //           itemCount: (snapshots.data! as QuerySnapshot).docs.length,
  //           itemBuilder: (context,int index){
  //             return Text((snapshots.data! as QuerySnapshot).docs[index]['S6FEKO6jbsHRdvnqPCZR']);
  //           }
  //       );
  //     },
  //   );
  //
  // }
  //
  // getPropertyDetailsFromId(var propertyId){
  //
  // }
  //

}

// class FirebaseData extends StatefulWidget {
//   const FirebaseData({Key? key, required String title}) : super(key: key);
//
//   @override
//   State<FirebaseData> createState() => _FirebaseDataState();
// }
//
// class _FirebaseDataState extends State<FirebaseData> {
//   var firestoreDB = FirebaseFirestore.instance.collection("PropertyDetails").snapshots();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Container(
//             height: 20,
//             child: StreamBuilder(
//               stream: firestoreDB,
//               builder: (context,snapshots){
//                 if(!snapshots.hasData) return CircularProgressIndicator();
//                 return ListView.builder(
//                     itemCount: (snapshots.data! as QuerySnapshot).docs.length,
//                     itemBuilder: (context,int index){
//                       return Text((snapshots.data! as QuerySnapshot).docs[index]['Property Type']);
//
//
//                     }
//                 );
//               },
//             ),
//
//           ),
//
//         ],
//       ),
//     );
//   }
// }

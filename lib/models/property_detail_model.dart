import 'package:cloud_firestore/cloud_firestore.dart';

class PropertyDetails{
  String id;
  late List<String> gallery;
  late final PropertyAbout property_about;
  late String video;
  late String floor_plan;
  late Map<String, double> location;

  PropertyDetails(
      this.id,
      this.gallery,
      this.property_about,
      this.video,
      this.floor_plan,
      this.location);

  PropertyDetails.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
  : id = doc.id,
     gallery = doc.data()!["gallery"],
        video = doc.data()!["video"],
        floor_plan = doc.data()!["floor_plan"],
        location = doc.data()!["location"],
        property_about = PropertyAbout.fromMap(doc.data()!["property_about"]);


  Map<String, dynamic> toMap(){
    return{
      'gallery': gallery,
      'property_about': property_about.toMap(),
      'video': video,
      'floor_plan': floor_plan,
      'location': location,

    };
  }
  
  

}

class PropertyAbout {
  late String property_type;
  late int bathroom;
  late String property_id;
  late String property_status;
  late String city ;
  late int bedrooms;
  late int price ;
  late int property_size;
  late int balcony;


  PropertyAbout({
      required this.property_type,
      required this.bathroom,
      required this.property_id,
      required this.property_status,
      required this.city,
      required this.bedrooms,
      required this.price,
      required this.property_size,
      required this.balcony,
      });

  Map<String, dynamic> toMap(){
    return{
      'property_type': property_type,
      'bathroom': bathroom,
      'property_id': property_id,
      'property_status': property_status,
      'city': city,
      'bedrooms': bedrooms,
      'price': price,
      'property_size': property_size,
      'balcony': balcony,
    };
  }

  PropertyAbout.fromMap(Map<String, dynamic> propertyAboutMap)
  : property_type = propertyAboutMap["property_type"],
        bathroom = propertyAboutMap["bathroom"],
        property_id = propertyAboutMap["property_id"],
        property_status = propertyAboutMap["property_status"],
        city = propertyAboutMap["city"],
        bedrooms = propertyAboutMap["bedrooms"],
        price = propertyAboutMap["price"],
        property_size = propertyAboutMap["property_size"],
        balcony = propertyAboutMap["balcony"];
}
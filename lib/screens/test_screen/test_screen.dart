import 'package:flutter/material.dart';
import 'package:the_asset_zone_web/models/list_mode.dart';

class TestPageScreen extends StatefulWidget {
  const TestPageScreen({Key? key}) : super(key: key);

  @override
  State<TestPageScreen> createState() => _TestPageScreenState();
}

class _TestPageScreenState extends State<TestPageScreen> {

  Future<List<Widget>?> getData() async{
    PropertiesList propertiesList = PropertiesList();
    List<Widget>? pl = await propertiesList.propertyList();
    // await Future.delayed(Duration(seconds: 5));
    return pl;
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Center(
            child: FutureBuilder<List?>(
              future: getData(),
              builder: (context, snapshot){
                if (snapshot.hasData){
                  List<Widget> data = snapshot.data! as List<Widget>;
                  return Column(
                    children: data,
                  );
                }else {
                return CircularProgressIndicator();
                }
                // return CircularProgressIndicator();
              },
            )
        ),
      ),
    );
  }
}

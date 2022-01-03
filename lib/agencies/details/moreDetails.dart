import 'dart:async';

import 'dart:io';
import 'dart:typed_data';

import 'package:agencies/agencies/details/map.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';

import 'mainDetails.dart';

class MoreDetails extends StatefulWidget {
  const MoreDetails({Key? key}) : super(key: key);

  @override
  _MoreDetailsState createState() => _MoreDetailsState();
}

class _MoreDetailsState extends State<MoreDetails> {

  int current_index=0;
  String? image;
  File? _fileimage;
  final ImagePicker _picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      if (pickedFile != null) {
        _fileimage = File(pickedFile.path);
      } else {}
    });
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading:Padding(
          padding: const EdgeInsets.only(left: 5,right: 0,top: 7.0),
          child: Container(
            alignment: Alignment.topLeft,
            child: IconButton(
              onPressed: () {
                if (Platform.isAndroid) {
                  Navigator.pop(context,MaterialPageRoute(builder:(context)=>AgencyDetails()),);
                } else if (Platform.isIOS) {
                  exit(0);
                }
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),),),
        title:Center(child: Text("Agencies",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),)),
        actions: [
          Container(
            width: 40,height: 40,
            child: IconButton(
              icon: const Icon(Icons.notifications_none,color:Colors.black,),
              onPressed: () { Scaffold.of(context).openDrawer(); },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            ),
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue.shade900,
        type: BottomNavigationBarType.fixed,
        currentIndex: current_index,
        onTap: (index){
          setState(() {
            current_index=index;
          });
        },
        items: [
          BottomNavigationBarItem(label:'My Account',icon: Icon(Icons.person),),
          BottomNavigationBarItem(label:'Chat',icon: Icon(Icons.chat),),
          BottomNavigationBarItem(label:'Favorites',icon: Icon(Icons.favorite),),
          BottomNavigationBarItem(label:'Home',icon: Icon(Icons.home),),
        ],
      ),
      body: Container(
        height: size.height+300,
    color: Colors.grey.shade200,
    child: SingleChildScrollView(
    child: Column(
    children: [
    Stack(
    children: [
    Align(
    alignment: Alignment.topRight,
    child: Transform.scale(scale:1,
    child:  Padding(
    padding: const EdgeInsets.all(15),
    child: ClipRRect(
    borderRadius: BorderRadius.circular(0),

    child: Image.asset( "assets/bunyan.jpg",

    ),),
    ),
    ),
    ),
    Center(
    child: Stack(
    children: [
    Center(
    child: Container(

    margin: const EdgeInsets.fromLTRB(30, 170, 30, 0),
    width: 400,
    height: 280,
    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10),

    ),
    child: Column(children: [
    Center(child: Padding(
    padding: const EdgeInsets.fromLTRB(0, 60, 0, 10),
    child: Text("Intertectra",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
    )),
    Padding(
    padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
    child: Center(child: Text("Villas and apartments",style: TextStyle(fontSize: 15,),)),
    ),
    Container(width: 400,color: Colors.grey,height: 0.8,),
    Center(child: Padding(
    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
    child: Text("455",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
    )),
    Padding(
    padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
    child: Center(child: Text("Followers",style: TextStyle(fontSize: 12),)),
    ),


    ],),
    ),
    ),
    Form(
    child: Column(
    children: [
    InkWell(
    onTap: () {
    showModalBottomSheet(
    context: context,
    builder: (builder) => bottomSheet(),
    );
    },
    child: Align(
    alignment: Alignment.center,

    child: Transform.scale(
    scale: 0.9,
    child: Container(
    padding: const EdgeInsets.fromLTRB(30,130, 30, 0),
    child: imageProfile()),
    )),
    ),
    ],
    )
    ),
    Center(
    child: Container(
    width: 400,
    padding: const EdgeInsets.only( top:410,right: 30,left: 30),
    child: MaterialButton(
    color: Colors.blue,
    onPressed: () {},
    shape: RoundedRectangleBorder(
    borderRadius:
    BorderRadius.circular(10)),
    child: Center(
    child: Text(
    "Follow   ",
    style: TextStyle(
    fontSize: 15,
    color: Colors.white,
    ),
    textAlign: TextAlign.center,
    ),)
    ),),)]
      ,),),],
    ),
      Container(width: 400,height: 150,
          margin: const EdgeInsets.only( top:20,right: 30,left: 30),
      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10),),
        child:Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Information information Information info information info info "
              "Information information Information information Information information Information information"
              "Information information Information information Information info information Information information",textAlign: TextAlign.center,style: TextStyle(fontSize: 10),),
        )
      ),
      Container(width: 400,height: 150,
          margin: const EdgeInsets.only( top:20,right: 30,left: 30),
          decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10),),
          child: Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 40, 20),
                  child: Text("Location",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 5, 0, 0),
                  child: Text("Manart Lusail Tower",style: TextStyle(fontSize: 10),),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                  child: Text("Lusail,Qatar",style: TextStyle(fontSize: 10),),
                ),
              ],),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 10, 10, 10),

                    child: InkWell(
                      onTap: (){ Navigator.push(context, MaterialPageRoute(builder: (context)=>MapLusail()),);},
                      child: Container(
                        decoration: BoxDecoration( borderRadius: BorderRadius.circular(10),),
                        alignment: Alignment.centerLeft,
                        width: 100,height: 100,
                        child:  Image.asset( "assets/lusail.jpg",

                        ),

                      ),
                    ),

              ),

            ],
          ),
      ),
      Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

          Container(
            padding: const EdgeInsets.only( top:10,right: 3,left: 3),
            child: MaterialButton(
                color: Colors.redAccent.shade100,
                onPressed: () {},
                shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    "  Email  ",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),)
            ),),
          Container(
            padding: const EdgeInsets.only( top:10,right: 3,left: 10),
            child: MaterialButton(
                color: Colors.blue,
                onPressed: () {},
                shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    "  Call  ",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),)
            ),),
          Container(
            padding: const EdgeInsets.only( top:10,right: 3,left: 10),
            child: MaterialButton(
                color: Colors.green,
                onPressed: () {},
                shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    "Whatsapp",
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),)
            ),),

        ],),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
        child: Container(
          width: 400,
          decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight:Radius.circular(10),),color: Colors.white
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Find Agents", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Text("Find our professional agents they will help you what you looking for",textAlign: TextAlign.center, style: TextStyle(fontSize: 10),)),
            )
          ],),
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
        child: Container(color: Colors.grey,width: 400,height: 0.5,),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 20),
        child: Container(width: 400,height: 200,
        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10),)),
          child: ListView.builder(itemCount: 3,physics: ScrollPhysics(),itemBuilder: (context,index){

            return  Card(
                child: Row(
                  children:  [
                    Container(

                      padding: const EdgeInsets.only(right: 0,left: 10),

                      child: CircleAvatar(
                        backgroundImage: AssetImage("assets/logo.jpg"),

                      ),
                    ),

                 Container(
                        width: 200,

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                          Container(
                            margin:const EdgeInsets.only(bottom: 10,top: 10,),
                            child: Text("Yeddas",style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.left,),
                          ),
                          Container(
                              width:190,
                              child: Text("Marketing Executive",textAlign:TextAlign.center,style: TextStyle(fontSize: 10),)),


                        ],),
                      ),




                  ],
                ),
                );

          }),
        ),
      ),

    ],
    ),
    ),),);
  }
  Widget imageProfile() {
    return Center(
      child: Stack(
        children: [
          _fileimage != null
              ? ClipRRect(
              borderRadius: BorderRadius.circular(80),
              child: Image.file(_fileimage!))
              : image != null
              ? ClipRRect(
            borderRadius:
            BorderRadius.circular(500),
            child: Image.network(
              image!,
              errorBuilder:
                  (context, error, stackTrace) {
                return CircleAvatar(
                  foregroundColor: Colors.white,
                  radius: 50,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage(
                    "assets/logo.jpg",
                  ),

                );
              },
            ),
          )
              : CircleAvatar(
            radius: 50,
            backgroundImage:AssetImage(
              "assets/logo.jpg",
            ),
          ),
          Positioned(
            bottom: 5,
            right: 10,
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (builder) => bottomSheet(),
                );
              },
              child: Icon(
                Icons.camera_alt,
                color: Colors.black,
                size: 28,
              ),
            ),
          ),


        ],
      ),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 150,
      width: MediaQuery
          .of(context)
          .size
          .width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: [
          Text(
            "Choose Profile Photo",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton.icon(
                onPressed: () => getImage(),
                icon: Icon(Icons.camera),
                label: Text("Camera"),
              ),
              FlatButton.icon(
                onPressed: () => getImage(),
                icon: Icon(Icons.image),
                label: Text("gallery"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

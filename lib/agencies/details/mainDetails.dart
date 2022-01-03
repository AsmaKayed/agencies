

import 'dart:io';
import 'package:agencies/agencies/agenciesMainPage.dart';
import 'package:agencies/agencies/details/moreDetails.dart';
import 'package:agencies/models/agencies%20model.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AgencyDetails extends StatefulWidget {
  const AgencyDetails({Key? key}) : super(key: key);

  @override
  _AgencyDetailsState createState() => _AgencyDetailsState();
}

class _AgencyDetailsState extends State<AgencyDetails> {

  List<bool> isSelected = [false, false, false,false];
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
    final foundUsers = ModalRoute.of(context)!.settings.arguments as Agency;
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
                      Navigator.pop(context,MaterialPageRoute(builder:(context)=>AgenciesMainPage()),);
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
                                               child: Text(foundUsers.names,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
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
                                                  ),
                                                )),
                                          ),
                                        )

                                       ],

                                    ),),

              ],
            ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                  child: TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MoreDetails()),);
                  }, child: Text("Company Details >>",style: TextStyle(fontSize: 10),)),
                ),
                Container(

                  decoration: BoxDecoration( borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10),),         color: Colors.white,),
                  child: ToggleButtons(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10),),
                    children: <Widget> [
                      Text('  Sort by '),
                      Text('  Premium ↓ ',style: TextStyle(fontSize: 10),),
                      Text('  Real estate ↓ ',style: TextStyle(fontSize: 10),),
                      Text('  All ↓ ',style: TextStyle(fontSize: 10),)
                    ],
                    onPressed: (int index) {
                      setState(() {
                        for (int buttonIndex = 0; buttonIndex < isSelected.length; buttonIndex++) {
                          if (buttonIndex == index) {
                            isSelected[buttonIndex] = !isSelected[buttonIndex];
                          } else {
                            isSelected[buttonIndex] = false;
                          }
                        }
                      });
                    },
                    isSelected: isSelected,
                  ),
                ),
                 Container(
                   height: 1000,
                   child: GridView.count(
                     physics: ScrollPhysics(),
                      crossAxisCount: 2,
                      children: List.generate(10, (index) => Padding(
                        padding: const EdgeInsets.all(15),
                        child: Card(
                         elevation: 0,
                           color: Colors.grey.shade200,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius
                              .circular(30),),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius
                                    .circular(20),
                                child:Image.asset( "assets/agency.jpg",),

                              ),
                              Row(children: [
                                Column(children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left:15),
                                        child: Icon(Icons.remove_red_eye,size: 15,),
                                      ),  Padding(
                                        padding: const EdgeInsets.fromLTRB(5, 5, 0, 5),
                                        child: Text("455",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 5),),
                                      ),
                                      Align(
                                          alignment: Alignment.topRight,
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 50),
                                            child: Icon(Icons.more_horiz),
                                          )),
                                    ],

                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 0),
                                        child: Container(
                                          height: 20,width: 20,
                                            child: CircleAvatar( backgroundImage:AssetImage("assets/bunyan.jpg",),
                                            ),),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: Column(children: [

                                          Padding(
                                            padding: const EdgeInsets.only(right: 20),
                                            child: Text("Intertectra",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 5),),
                                          ),
                                          Text("Villas and apartments",style: TextStyle(fontSize: 4),),
                                        ],),
                                      ),
                                    ],
                                  ),
                                ],),
                              ],),
                            ],
                          ),



                        ),
                      )
                      ),
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

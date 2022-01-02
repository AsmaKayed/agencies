

import 'package:agencies/models/agencies%20model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AgenciesMainPage extends StatefulWidget {


  @override

  _AgenciesMainPageState createState() => _AgenciesMainPageState();
}

class _AgenciesMainPageState extends State<AgenciesMainPage> {
  int current_index=0;
  List<Agency> agency = [
    Agency('Intertectra', "Intertectra information", Image.asset("assets/logo.jpg")),
    Agency('Cleaning company', "Cleaning company information ", Image.asset("assets/artboard .jpg"),),
    Agency('gardening company', "Gardening Company information", Image.asset("assets/logo.jpg"),),
  ];
  List<Agency> foundUsers = [];

  @override
  initState() {
    super.initState();
      setState(() {
         foundUsers=agency;
      });
  }
  onSearch(String search) {
    setState(() {
      foundUsers = agency.where((user) => user.names.toLowerCase().contains(search)).toList();
    });
  }

  // void _runFilter(String enteredKeyword) {
  //   List<Agency> results = [];
  //   if (enteredKeyword.isEmpty) {
  //     results = agencyList;
  //   } else {
  //     results = agencyList.where((user) =>
  //         user.names.toLowerCase().contains(enteredKeyword.toLowerCase()))
  //         .toList();
  //   }
  // }
  @override


  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading:Builder(
          builder: (BuildContext context) {
            return      Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(left:0),
                  child: Image.asset("assets/logo.jpg",width: 40,height: 40,),
                ));
          },
        ),
        title:Center(child: Text("Agencies",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),)),
        actions: [
              Container(
              margin: const EdgeInsets.only(left: 5),
              child: IconButton(
                icon: const Icon(Icons.language,color:Colors.black,),
                onPressed: () { Scaffold.of(context).openDrawer(); },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              ),
            ),

           IconButton(
                icon: const Icon(Icons.notifications_none,color:Colors.black,),
                  onPressed: () { Scaffold.of(context).openDrawer(); },
                  tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
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
          body:
         SingleChildScrollView(
           scrollDirection: Axis.vertical,
           child: Container(
                height: size.height+300,
                color: Colors.grey.shade200,
                child: Column(
                    children: [
                          Container( decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Transform.scale(scale:1,
                                    child:  Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),

                                        child: Image.asset( "assets/artboard .jpg",

                                        ),),
                                    ),
                                    ),
                            ),
                          ),
                            Container(child: _searchBar(),),
                      Container(
                            width: size.width,
                                height:size.height,

                      child: ListView.builder(
                                    itemCount: foundUsers.length,
                                    itemBuilder: (context,index) {
                                      return _listItem(index);
                                    }),
                    ),


                   ],
             ),

        ),
         ) );

  }
  _searchBar(){
    return Column(
        children: [
          Container(
            color: Colors.white,
            height: 37,
            margin:const EdgeInsets.only(right: 15,left: 15,top: 20,bottom: 10,),
            child: Center(
              child: TextFormField(
                decoration: InputDecoration(hintText: "Search for an agency", border: myinputborder(), //normal border
                  enabledBorder: myinputborder(), //enabled border
                  focusedBorder: myfocusborder(),),
                onChanged: (value) => onSearch(value),

              ),
            ),
          ),
        ],
      );




  }
  _listItem(index){
    return Container(
      padding: const EdgeInsets.only(right: 10,left: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),
      width: 200,
      height: 100,
      child: Card(

        child: Row(
          children:  [
            Container(

              padding: const EdgeInsets.only(right: 10,left: 10),

              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: foundUsers[index].image,


              ),
              width: 90,
              height: 90,
            ),

            SingleChildScrollView(
              scrollDirection: Axis.vertical,

              child: Container(
                width: 100,

                child: Column(children: [
                  Container(
                    margin:const EdgeInsets.only(bottom: 10,top: 10,),
                    child: Text("${foundUsers[index].names}"),
                  ),
                  Container(
                      width:190,
                      child: Text("${foundUsers[index].information}",style: TextStyle(fontSize: 10),)),


                ],),
              ),
            ),
            Spacer(),
            Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Align(
                  alignment: Alignment.centerRight,

                  child: Transform.scale(
                    scale: 0.8,
                    child: Container(
                      padding:const EdgeInsets.only(right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,

                        children: [
                          Container(

                            child: IconButton(
                              icon: const Icon(Icons.chat_sharp,color:Colors.black,),
                              onPressed: () { Scaffold.of(context).openDrawer(); },
                              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                            ),

                          ),
                          Container(
                            margin:const EdgeInsets.only(bottom: 40),
                            child: IconButton(
                              icon: const Icon(Icons.call,color:Colors.black,),
                              onPressed: () { Scaffold.of(context).openDrawer(); },
                              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),



          ],
        ), ),
    );
  }
  OutlineInputBorder myinputborder(){ //return type is OutlineInputBorder
    return OutlineInputBorder( //Outline border type for TextFeild
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(
          color:Colors.black,
          width: 1,
        )
    );
  }

  OutlineInputBorder myfocusborder(){
    return OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(
          color:Colors.black,
          width: 1,
        )
    );
  }
}

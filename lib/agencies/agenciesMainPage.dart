import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AgenciesMainPage extends StatefulWidget {
  const AgenciesMainPage({Key? key}) : super(key: key);

  @override
  _AgenciesMainPageState createState() => _AgenciesMainPageState();
}

class _AgenciesMainPageState extends State<AgenciesMainPage> {
  int current_index=0;
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
                icon: const Icon(Icons.notifications,color:Colors.redAccent,),
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
                height: size.height,
                color: Colors.grey.shade200,
                child: Column(
                    children: [
                          Container( decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                            child: Align(
                              alignment: Alignment.topCenter,
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

                      Container(
                            width: 500,
                                height:size.height,

                      child: ListView.builder(
                                    itemCount: 10,
                                    itemBuilder: (context,index) {
                                      return  Container(
                                        padding: const EdgeInsets.only(right: 10,left: 10),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                        width: 200,
                                        height: 100,
                                        child: Card(

                                          child: Row(
                                            children:  [
                                              Container(
                                            padding: const EdgeInsets.only(right: 10,left: 10),

                                                child: CircleAvatar(

                                                    child: Image.asset( "assets/artboard .jpg",width: 50,height: 50,fit: BoxFit.cover,)

                                                ),

                                              ),

                                              Column(children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 10,top: 8,bottom: 8,right: 80),
                                                  child: Text("Agency Name"),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 5),
                                                  child: Container(
                                                    width:190,
                                                      child: Text('hrfj sdhfuihwari'
                                                      ' ljkehgiuwahergu kjhewfiuwhfliu'
                                                      ' elgwuoWEGFRIW WEHROIUGARFIU WEHRIUOHWr iewhriuowr',style: TextStyle(fontSize: 10),)),
                                                ),

                                              ],),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 20),
                                                child: Row(
                                                  children: [
                                                    Container(

                                                      child: IconButton(
                                                        icon: const Icon(Icons.messenger_outlined,color:Colors.black,),
                                                        onPressed: () { Scaffold.of(context).openDrawer(); },
                                                        tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                                                      ),
                                      ),
                                                     IconButton(
                                                      icon: const Icon(Icons.call,color:Colors.black,),
                                                      onPressed: () { Scaffold.of(context).openDrawer(); },
                                                      tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                                                    ),

                                                  ],
                                                ),
                                              ),

                                            ],
                                          ), ),
                                      );
                                    }),
                    ),





                   ],
             ),

        ),
         ) );

  }
}

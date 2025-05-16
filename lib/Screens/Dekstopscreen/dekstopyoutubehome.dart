import 'package:flutter/material.dart';
import 'package:youtubedemo/Screens/Dekstopscreen/createbutton_screen.dart';

class Dekstopyoutubehome extends StatelessWidget {
   Dekstopyoutubehome({super.key});
  final GlobalKey<ScaffoldState>scaffoldKey=GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,

      appBar: AppBar(
        
        leading: IconButton(
          onPressed: () {
            scaffoldKey.currentState?.openDrawer();
          },
          icon: Icon(Icons.menu),
        ),
        title:Row(
          children: [
          IconButton(onPressed: () {}, icon: Text("Youtube")),
          Expanded(child: TextField(),)
          ],

        ),
        actions: [
           
            
            //ttField(),
            IconButton(onPressed: () {}, icon: Icon(Icons.mic)),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => CreatebuttonScreen(),),
                );
              },
              child: Text("create"),
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.access_alarm_sharp)),
            IconButton(onPressed: () {}, icon: CircleAvatar()),
        ],
          
       
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Text("Yotube"),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {},
            ),
            ListTile(leading: Icon(Icons.home), title: Text("Home")),
            ListTile(leading: Icon(Icons.home), title: Text("Home")),
          ],
        ),
      ),

      body: Text("description"),
    );
  }
}
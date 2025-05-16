import 'package:flutter/material.dart';

class CreatebuttonScreen extends StatelessWidget {
  const CreatebuttonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Column(
          children: [
         
            ElevatedButton(onPressed:(){},
            
             child: Text("Upload"),),
          ],
        ),
      ),

    );

}
}
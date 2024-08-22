import 'package:flutter/material.dart';
import 'map_screen.dart';
import 'map_screen.dart';

class boramae extends StatelessWidget {
  const boramae({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor:Colors.white,
        body:Stack(
          children: [
            Image.asset(
                height: MediaQuery.of(context).size.height,
                width:MediaQuery.of(context).size.height,
                'assets/boramae.png',fit:BoxFit.fill,
            ),
            Align(
              alignment: Alignment(0.6, 0.95),
              child: Container(
                width:MediaQuery.of(context).size.width * 0.73,
                height:MediaQuery.of(context).size.height * 0.07,
                // decoration: BoxDecoration(
                //   border:Border.all(),
                // ),
                child:GestureDetector(
                  onTap:(){
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => MapScreen()),
                    );
                  }
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}


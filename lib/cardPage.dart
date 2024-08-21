import 'package:flutter/material.dart';
import 'map_screen.dart';

class cardPage extends StatefulWidget {
  cardPage({super.key});

  @override
  State<cardPage> createState() => _cardPageState();
}

class _cardPageState extends State<cardPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body:Stack(
          children:[
            SizedBox(
                width:double.infinity,height:double.infinity,child: Image.asset('assets/mapScreen.png',fit:BoxFit.fill)
            ),
            Align(
              alignment: Alignment(0.5,0.8),
              child: Container(
                color:Colors.transparent,
                padding: EdgeInsets.all(10.0),
                height: MediaQuery.of(context).size.height * 0.2, // 20%,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    buildCard(title:'티맵추천', time:'37분', arrival:'오후 4:26 도착', distance: '13km', toll: '통행료 없음'),
                    buildCard(title:'최소시간', time:'37분', arrival:'오후 4:26 도착', distance: '13km', toll: '통행료 없음'),
                    buildCard(title:'무료도로', time:'44분', arrival:'오후 4:33 도착', distance: '13km', toll: '통행료 없음')
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment(0, 1),
              child: GestureDetector(
                onTap:(){print('hi');},
                child: Container(
                  margin:EdgeInsets.all(15),
                  width:double.infinity,
                  height:MediaQuery.of(context).size.height * 0.05,
                  decoration: BoxDecoration(color:Color(0xFF2B6AFF),borderRadius: BorderRadius.circular(10)),
                  child: Center(child: Text(style: TextStyle(color:Colors.white),'안내시작')),
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}

class buildCard extends StatelessWidget {
  const buildCard({super.key,this.title,this.time,this.arrival,this.distance,this.toll});
  final title;
  final time;
  final arrival;
  final distance;
  final toll;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MapScreen(),
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.3,
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                  color: Colors.blue, fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              time,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              arrival,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            Text(
              distance,
              style: TextStyle(fontSize: 14),
            ),
            Text(
              toll,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );;
  }
}

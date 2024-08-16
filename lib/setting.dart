import 'package:flutter/material.dart';

class setting extends StatelessWidget {
  const setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.white,
        centerTitle: true,title : Text('SAFT-T'),),
      body:Container(
        color:Colors.white,
        child: Column(
          children: [
            Image.asset('assets/Frame5028.png'),
            Container(color:Color(0x189c9c9c),height: 10,),
            Container(
              decoration: BoxDecoration(
                border:Border(
                  // top: BorderSide(color: Color(0x2D808080)), // 위쪽 테두리
                  bottom: BorderSide(color: Color(0x2D808080)), // 아래쪽 테두리
                ),
              ),
              child: ListTile(
                // contentPadding: EdgeInsets.zero,
                title: Text('페달 블랙박스 영상', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                subtitle: Text('주행 중 녹화된 페달 블랙박스', style: TextStyle(fontSize: 12, color: Colors.grey)),
                trailing: IconButton(
                  icon:Icon(Icons.arrow_forward_ios),
                  onPressed: (){
                    // Navigation 새 창 띄우기
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
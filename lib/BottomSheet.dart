// import 'package:flutter/material.dart';
//
// class BottomSheet extends StatelessWidget {
//   const BottomSheet({super.key, this.cont});
//   this.cont;
//
//   @override
//   Widget build(BuildContext context) {
//     return showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(
//           top: Radius.circular(20),
//         ),
//       ),
//       builder: (BuildContext context) {
//         return DraggableScrollableSheet(
//           expand: false,
//           initialChildSize: 0.5, // 초기 크기 (화면 높이의 50%)
//           minChildSize: 0.5, // 최소 크기 (화면 높이의 30%)
//           maxChildSize: 1, // 최대 크기 (화면 높이의 80%)
//           builder: (BuildContext context, ScrollController scrollController) {
//             return SingleChildScrollView(
//               controller: scrollController,
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // 작대기 추가
//                     GestureDetector(
//                       onVerticalDragUpdate: (details) {
//                         scrollController.position.jumpTo(
//                           scrollController.position.pixels - details.primaryDelta!,
//                         );
//                       },
//                       child: Container(
//                         height: 30,
//                         alignment: Alignment.center,
//                         child: Container(
//                           width: 40,
//                           height: 5,
//                           decoration: BoxDecoration(
//                             color: Colors.grey[300],
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Text(
//                       '즐겨찾기',
//                       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                     ),
//                     ListTile(
//                       title: Text('최근 목적지'),
//                       trailing: Icon(Icons.arrow_forward_ios),
//                     ),
//                     Divider(),
//                     ListTile(
//                       title: Text('SKT 타워'),
//                       trailing: Icon(Icons.location_pin),
//                     ),
//                     ListTile(
//                       title: Text('SKT 타워'),
//                       trailing: Icon(Icons.location_pin),
//                     ),
//                     ListTile(
//                       title: Text('SKT 타워'),
//                       trailing: Icon(Icons.location_pin),
//                     ),
//                     ListTile(
//                       title: Text('SKT 타워'),
//                       trailing: Icon(Icons.location_pin),
//                     ),
//                     ListTile(
//                       title: Text('SKT 타워'),
//                       trailing: Icon(Icons.location_pin),
//                     ),
//                     ListTile(
//                       title: Text('SKT 타워'),
//                       trailing: Icon(Icons.location_pin),
//                     ),
//                     ListTile(
//                       title: Text('SKT 타워'),
//                       trailing: Icon(Icons.location_pin),
//                     ),
//                     ListTile(
//                       title: Text('SKT 타워'),
//                       trailing: Icon(Icons.location_pin),
//                     ),
//                     ListTile(
//                       title: Text('SKT 타워'),
//                       trailing: Icon(Icons.location_pin),
//                     ),
//                     ListTile(
//                       title: Text('SKT 타워'),
//                       trailing: Icon(Icons.location_pin),
//                     ),
//                     // 여기에 추가 항목을 넣을 수 있습니다.
//                   ],
//                 ),
//               ),
//             );
//           },
//         );
//       },
//     );;
//   }
// }

import 'dart:convert';
import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:events_booking/screen/images.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class dashboard extends StatefulWidget {
  const dashboard({Key? key}) : super(key: key);

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  final List<String> images = [
    'https://www.shelter-structures.com/wp-content/uploads/2018/12/30-x-40m-Tent-with-Curved-Roof-Arch-Wedding-Marquee-sale-in-Mexico-5.jpg',

    'https://media.istockphoto.com/photos/beautiful-wedding-ceremony-on-the-beach-tropical-exotic-destination-picture-id1147052765?s=612x612',

    'https://i.pinimg.com/564x/4d/a4/9b/4da49ba79bb90e7e9d5db33b25742323.jpg',
    //     'https://images.unsplash.com/photo-1586882829491-b81178aa622e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80',
    // 'https://images.unsplash.com/photo-1586871608370-4adee64d1794?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2862&q=80',
    // 'https://images.unsplash.com/photo-1586901533048-0e856dff2c0d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
    // 'https://images.unsplash.com/photo-1586902279476-3244d8d18285?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80',
    // 'https://images.unsplash.com/photo-1586943101559-4cdcf86a6f87?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1556&q=80',
    // 'https://images.unsplash.com/photo-1586951144438-26d4e072b891?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
    // 'https://images.unsplash.com/photo-1586953983027-d7508a64f4bb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
  ];
  final List<String> imgList = [
    Images.h1,
    Images.h2,
    Images.h3,
    Images.h4,
    Images.h5
  ];
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      images.forEach((imageUrl) {
        precacheImage(NetworkImage(imageUrl), context);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: Color.fromRGBO(132, 22, 23, 1),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: CarouselSlider.builder(
                  itemCount: images.length,
                  options: CarouselOptions(
                    autoPlay: true,
                    aspectRatio: 2.0,
                    enlargeCenterPage: true,
                  ),
                  itemBuilder: (context, index, realIdx) {
                    return Container(
                      child: Center(
                          child: Image.network(images[index],
                              fit: BoxFit.cover, width: 1000)),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              _card(Images.h1),
              _card(Images.h2),
              _card(Images.h3),
              _card(Images.h4),
              _card(Images.h5),
              Container(),
            ],
          ),
        ),
      ),

      //  Container(
      //   child: CarouselSlider(
      //     options: CarouselOptions(
      //       autoPlay: true,
      //       aspectRatio: 2.0,
      //       enlargeCenterPage: true,
      //     ),
      //     items: images,
      //   ),
      // ),
    );
  }

  _card(image) {
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        decoration: BoxDecoration(
          color: Color.fromRGBO(132, 22, 23, 1),
          borderRadius: BorderRadius.circular(15),
        ),
        // padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(children: [
          Container(
            height: 180,
            width: 350.0,
            child: Image.asset(image, fit: BoxFit.fill),

            //  Image.asset(Images.h1, fit: BoxFit.fill),
          ),
        ]));
  }
}
      
      
      
      
      
      
      
      
      
//        Container(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               _card2(
//                 Images.h1,
//               ),
//               _card2(
//                 Images.h2,
//               ),
//               _card2(
//                 Images.h3,
//               ),
//               _card2(
//                 Images.h4,
//               ),
//               _card2(
//                 Images.h5,
//               ),

//               Row(
//                 children: [
//                   Expanded(
//                     child: _card(
//                       Images.h1,
//                       "Punjab",
//                     ),
//                     // child:
//                     //     _card(Images.users, "Users", const UsersAllScreen()),
//                   ),
//                   Expanded(
//                     child: _card(
//                       Images.h2,
//                       "Sindh",
//                     ),
//                   ),
//                 ],
//               ),
//               ///////
//               Row(
//                 children: [
//                   Expanded(
//                     child: _card(
//                       Images.h3,
//                       "Khyber Pakhtunkhwa",
//                     ),
//                     // child:
//                     //     _card(Images.users, "Users", const UsersAllScreen()),
//                   ),
//                   Expanded(
//                     child: _card(
//                       Images.h4,
//                       "Gilgit Balistan",
//                     ),
//                   ),
//                 ],
//               ),
//               //////
//               Row(
//                 children: [
//                   Expanded(
//                     child: _card1(
//                       Images.h5,
//                       "Balochistan",
//                     ),
//                     // child:
//                     //     _card(Images.users, "Users", const UsersAllScreen()),
//                   ),
//                   //  Expanded(
//                   //     child: _card(
//                   //       Images.sindh,
//                   //       "Sindh",
//                   //     ),
//                   //   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   _card(
//     image,
//     text,
//   ) {
//     return GestureDetector(
//       onTap: () {
//         // if (function != null) {
//         //   Navigator.push(
//         //     context,
//         //     MaterialPageRoute(
//         //       builder: (BuildContext context) => function,
//         //     ),
//         //   );
//         // }
//       },
//       child: Container(
//         height: 152,
//         margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
//         decoration: BoxDecoration(
//           color: Color.fromRGBO(8, 35, 85, 1),
//           borderRadius: BorderRadius.circular(18),
//         ),
//         // padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
//         child: Column(
//           // mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset(
//               image,
//               height: 130,
//               width: 173,
//             ),
//             Container(
//               child: Text(
//                 text,
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   _card1(
//     image,
//     text,
//   ) {
//     return GestureDetector(
//       onTap: () {
//         // if (function != null) {
//         //   Navigator.push(
//         //     context,
//         //     MaterialPageRoute(
//         //       builder: (BuildContext context) => function,
//         //     ),
//         //   );
//         // }
//       },
//       child: Container(
//         height: 170,
//         // width: 500,
//         margin: const EdgeInsets.symmetric(horizontal: 110, vertical: 10),
//         decoration: BoxDecoration(
//           color: Color.fromRGBO(8, 35, 85, 1),
//           borderRadius: BorderRadius.circular(18),
//         ),
//         padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 20),
//         child: Column(
//           // mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset(
//               image,
//               height: 110,
//               width: 223,
//             ),
//             Text(
//               text,
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   _card2(image) {
//     return GestureDetector(
//       onTap: () {
//         // if (function != null) {
//         //   Navigator.push(
//         //     context,
//         //     MaterialPageRoute(
//         //       builder: (BuildContext context) => function,
//         //     ),
//         //   );
//         // }
//       },
//       child: Container(
//         height: 270,
//         width: 500,
//         // margin: const EdgeInsets.symmetric(horizontal: 110, vertical: 10),
//         // decoration: BoxDecoration(
//         //   color: Color.fromRGBO(8, 35, 85, 1),
//         //   borderRadius: BorderRadius.circular(18),
//         // ),
//         // padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 20),
//         child: Column(
//           // mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset(
//               image,
//               height: 310,
//               width: 353,
//             ),
//             // Text(
//             //   text,
//             //   textAlign: TextAlign.center,
//             //   style: TextStyle(
//             //       fontSize: 16,
//             //       fontWeight: FontWeight.bold,
//             //       color: Colors.white),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:app/Screens/Donet.dart';
// import 'package:app/firebase_options.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:app/module/file.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: HomePage(),
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final TextEditingController textController = TextEditingController();
//   final TextEditingController textController2 = TextEditingController();
//   final TextEditingController textControlle3 = TextEditingController();

//   final FirestoreService firestoreService = FirestoreService();
//   void openAddbox() {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Add Donation '),
//           content: Container(
//             width: 300,
//             height: 200,
//             child: Column(
//               children: [
//                 TextField(
//                   controller: textController,
//                   decoration: InputDecoration(hintText: 'Enter Donation name'),
//                 ),
//                 TextField(
//                   controller: textController2,
//                   decoration:
//                       InputDecoration(hintText: 'Enter Donation Quality '),
//                 ),
//                 TextField(
//                   controller: textControlle3,
//                   decoration:
//                       InputDecoration(hintText: 'Enter Donation Location'),
//                 )
//               ],
//             ),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text('Cancel'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 firestoreService.AddItem(textController.text,
//                     textController2.text, textControlle3.text);
//                 textController.clear();
//                 textController2.clear();
//                 textControlle3.clear();
//                 Navigator.of(context).pop();
//               },
//               child: Text('Add'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   List<Box> categories = [];

//   void _getfiles() {
//     categories = Box.getfiles();
//   }

//   @override
//   Widget build(BuildContext context) {
//     _getfiles();

//     return Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           title: Container(
//             margin: EdgeInsets.only(
//               left: 4,
//             ),
//             child: Text(
//               'Food Rescue',
//               style: TextStyle(
//                   fontFamily: 'fonts1',
//                   fontSize: 39,
//                   color: Color.fromRGBO(114, 156, 139, 1)),
//             ),
//           ),
//           actions: [
//             Container(
//               alignment: Alignment.center,
//               width: 59,
//               height: 70,
//               margin: EdgeInsets.only(right: 22, top: 10),
//               child: Image(
//                 image: AssetImage("assests/images/user.png"),
//                 color: Color.fromRGBO(255, 252, 252, 1),
//               ),
//               decoration: BoxDecoration(
//                   color: Color.fromRGBO(104, 162, 138, 1),
//                   borderRadius: BorderRadius.circular(40)),
//             ),
//           ],
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: openAddbox,
//           child: Icon(Icons.add),
//         ),
//         body: Padding(
//             padding: EdgeInsets.symmetric(vertical: 46.0),
//             child: Container(
//                 child: Column(children: [
//               Container(
//                 alignment: Alignment.topLeft,
//                 margin: EdgeInsets.only(left: 22),
//                 child: Text(
//                   'Donations',
//                   style: TextStyle(
//                       fontSize: 30,
//                       fontFamily: 'Text',
//                       color: Color.fromRGBO(91, 100, 96, 1)),
//                 ),
//               ),
//               SizedBox(
//                 height: 22,
//               ),
//               Container(
//                 height: 245,
//                 child: ListView.separated(
//                     itemBuilder: (context, index) {
//                       return Stack(
//                         children: [
//                           Container(
//                             margin: EdgeInsets.only(left: 17, right: 17),
//                             width: 240,
//                             height: 140,
//                             decoration: BoxDecoration(
//                                 color: categories[index].color,
//                                 image: DecorationImage(
//                                     fit: BoxFit.cover,
//                                     image: AssetImage(categories[index].img)),
//                                 borderRadius: BorderRadius.circular(20)),
//                           ),
//                           Align(
//                               alignment: Alignment.bottomCenter,
//                               child: Container(
//                                 margin: EdgeInsets.only(left: 36, bottom: 10),
//                                 width: 206,
//                                 height: 114,
//                                 decoration: BoxDecoration(
//                                     color: categories[index].color,
//                                     borderRadius: BorderRadius.circular(30)),
//                                 child: Column(
//                                   children: [
//                                     Text(
//                                       categories[index].name,
//                                       style: TextStyle(
//                                           fontSize: 23,
//                                           fontFamily: 'Text',
//                                           color:
//                                               Color.fromRGBO(91, 100, 96, 1)),
//                                     ),
//                                     Row(
//                                       children: [
//                                         Icon(Icons.star),
//                                         Text(
//                                           categories[index].quilty,
//                                           style: TextStyle(
//                                               fontFamily: 'Text',
//                                               color: Color.fromRGBO(
//                                                   107, 120, 115, 1),
//                                               fontSize: 16),
//                                         ),
//                                         SizedBox(
//                                           width: 13,
//                                         ),
//                                         Text(
//                                           '|',
//                                           style: TextStyle(fontSize: 22),
//                                         ),
//                                         SizedBox(
//                                           width: 13,
//                                         ),
//                                         Icon(Icons.location_on),
//                                         Text(
//                                           categories[index].location,
//                                           style: TextStyle(
//                                               fontFamily: 'Text',
//                                               color: Color.fromRGBO(
//                                                   107, 120, 115, 1),
//                                               fontSize: 16),
//                                         ),
//                                       ],
//                                     ),
//                                     SizedBox(
//                                       height: 3,
//                                     ),
//                                     Container(
//                                       margin: EdgeInsets.only(left: 100),
//                                       width: 52,
//                                       height: 37,
//                                       alignment: Alignment.center,
//                                       decoration: BoxDecoration(
//                                           gradient: LinearGradient(colors: [
//                                             Color.fromRGBO(161, 205, 185, 1),
//                                             Color.fromRGBO(104, 162, 138, 1),
//                                           ]),
//                                           borderRadius:
//                                               BorderRadius.circular(15)),
//                                       child: Text(
//                                         '${categories[index].price.toStringAsFixed(2)}\$',
//                                         style: TextStyle(
//                                             fontSize: 15,
//                                             fontWeight: FontWeight.bold),
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ))
//                         ],
//                       );
//                     },
//                     scrollDirection: Axis.horizontal,
//                     separatorBuilder: (context, index) => SizedBox(
//                           width: 1,
//                         ),
//                     itemCount: categories.length),
//               ),
//               SizedBox(
//                 height: 33,
//               ),
//               Container(
//                 alignment: Alignment.topLeft,
//                 margin: EdgeInsets.only(left: 22),
//                 child: Text(
//                   'Your Donation',
//                   style: TextStyle(
//                       fontSize: 30,
//                       fontFamily: 'Text',
//                       color: Color.fromRGBO(91, 100, 96, 1)),
//                 ),
//               ),
//               StreamBuilder<QuerySnapshot>(
//                   stream: firestoreService.getDonation(),
//                   builder: (context, snapshot) {
//                     if (snapshot.hasData) {
//                       List donationList = snapshot.data!.docs;
//                       return ListView.builder(
//                           itemCount: donationList.length,
//                           itemBuilder: (context, index) {
//                             DocumentSnapshot document = donationList[index];
//                             String docIF = document.id;
//                             // each one
//                             Map<String, dynamic> data =
//                                 document.data() as Map<String, dynamic>;
//                             String donationText = data['Donation Name'];
//                             // String donationquilty = data['Donation Quality'];
//                             // String donationlocation = data['Donation Location'];

//                             return ListTile(
//                               title: Text(donationText),
//                             );
//                           });
//                     } else {
//                       return const Text('You Didnot Add Any Donation');
//                     }
//                   })
//             ]))));
//   }
// }

import 'package:app/Screens/Donet.dart';
import 'package:app/firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:app/module/file.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController textController = TextEditingController();
  final TextEditingController textController2 = TextEditingController();
  final TextEditingController textControlle3 = TextEditingController();
  final user = FirebaseAuth.instance.currentUser!;
  final FirestoreService firestoreService = FirestoreService();
  void out() {
    FirebaseAuth.instance.signOut();
  }

  void openAddbox({String? docID}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Color.fromRGBO(233, 243, 238, 1),
          title: Text('Add Donation '),
          content: Container(
            width: 300,
            height: 200,
            child: Column(
              children: [
                TextField(
                  controller: textController,
                  decoration: InputDecoration(hintText: 'Enter Donation name'),
                ),
                TextField(
                  controller: textController2,
                  decoration:
                      InputDecoration(hintText: 'Enter Donation Quality '),
                ),
                TextField(
                  controller: textControlle3,
                  decoration:
                      InputDecoration(hintText: 'Enter Donation Location'),
                )
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(104, 162, 138, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9),
                  ),
                  minimumSize: Size(25, 43),
                ),
                onPressed: () {
                  if (docID == null) {
                    firestoreService.AddItem(textController.text,
                        textController2.text, textControlle3.text);
                  } else {
                    firestoreService.updateDonation(docID, textController.text,
                        textController2.text, textControlle3.text);
                  }
                  textController.clear();
                  textController2.clear();
                  textControlle3.clear();
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Add',
                  style: TextStyle(
                      fontSize: 15, color: Color.fromRGBO(233, 243, 238, 1)),
                )),
          ],
        );
      },
    );
  }

  List<Box> categories = [];

  void _getfiles() {
    categories = Box.getfiles();
  }

  @override
  Widget build(BuildContext context) {
    _getfiles();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Container(
          margin: EdgeInsets.only(
            left: 4,
          ),
          child: Text(
            'Food Rescue',
            style: TextStyle(
                fontFamily: 'fonts1',
                fontSize: 39,
                color: Color.fromRGBO(114, 156, 139, 1)),
          ),
        ),
        leading: Builder(
          builder: (context) => IconButton(
            icon:
                Icon(Icons.menu, size: 36.0), // Set your desired icon size here
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: Drawer(
        child: Container(
          color: Color.fromRGBO(233, 243, 238, 1),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                  child: Column(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.person,
                      size: 55,
                    ),
                  ),
                  Text(user.email!)
                ],
              )),
              ListTile(
                title: Text('Make Donation'),
                leading: Icon(Icons.add),
                onTap: () {
                  openAddbox;
                },
              ),
              ListTile(
                title: Text('Give Us Reviews'),
                leading: Icon(Icons.reviews),
                onTap: () {
                  out;
                },
              ),
              ListTile(
                title: Text('Log Out'),
                leading: Icon(Icons.logout),
                onTap: () {
                  out;
                },
              ),
              ListTile(
                title: Text('Privacy Policy'),
                leading: Icon(Icons.policy),
                onTap: () {
                  // Handle the tap
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: openAddbox,
        child: Icon(
          Icons.add,
          size: 34,
          color: Color.fromRGBO(212, 225, 220, 1),
        ),
        backgroundColor: (Color.fromRGBO(104, 162, 138, 1)),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 46.0),
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 22),
              child: Text(
                'Donations',
                style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Text',
                    color: Color.fromRGBO(91, 100, 96, 1)),
              ),
            ),
            SizedBox(
              height: 22,
            ),
            Container(
              height: 245,
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 17, right: 17),
                        width: 240,
                        height: 140,
                        decoration: BoxDecoration(
                          color: categories[index].color,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(categories[index].img)),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          margin: EdgeInsets.only(left: 36, bottom: 10),
                          width: 206,
                          height: 114,
                          decoration: BoxDecoration(
                              color: categories[index].color,
                              borderRadius: BorderRadius.circular(30)),
                          child: Column(
                            children: [
                              Text(
                                categories[index].name,
                                style: TextStyle(
                                    fontSize: 23,
                                    fontFamily: 'Text',
                                    color: Color.fromRGBO(91, 100, 96, 1)),
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 13,
                                  ),
                                  Icon(Icons.star),
                                  Text(
                                    categories[index].quilty,
                                    style: TextStyle(
                                        fontFamily: 'Text',
                                        color: Color.fromRGBO(107, 120, 115, 1),
                                        fontSize: 16),
                                  ),
                                  SizedBox(
                                    width: 13,
                                  ),
                                  Text(
                                    '|',
                                    style: TextStyle(fontSize: 22),
                                  ),
                                  SizedBox(
                                    width: 13,
                                  ),
                                  Icon(Icons.location_on),
                                  Text(
                                    categories[index].location,
                                    style: TextStyle(
                                        fontFamily: 'Text',
                                        color: Color.fromRGBO(107, 120, 115, 1),
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Container(
                                width: 72,
                                height: 37,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: [
                                      Color.fromRGBO(161, 205, 185, 1),
                                      Color.fromRGBO(104, 162, 138, 1),
                                    ]),
                                    borderRadius: BorderRadius.circular(15)),
                                child: Text(
                                  '\$${categories[index].price.toStringAsFixed(2)}',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(233, 243, 238, 1)),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  );
                },
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => SizedBox(
                  width: 1,
                ),
                itemCount: categories.length,
              ),
            ),
            SizedBox(
              height: 33,
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 22),
              child: Text(
                'Your Donation',
                style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Text',
                    color: Color.fromRGBO(91, 100, 96, 1)),
              ),
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: firestoreService.getDonation(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<DocumentSnapshot> donationList = snapshot.data!.docs;
                    return ListView.builder(
                      itemCount: donationList.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot document = donationList[index];
                        String docID = document.id;
                        Map<String, dynamic> data =
                            document.data() as Map<String, dynamic>;
                        String donationText = data['Donation Name'];
                        String donationquilty = data['Donation Quality'];
                        String donationlocation = data['Donation Location'];

                        return Container(
                            margin: EdgeInsets.only(
                                left: 22, right: 34, bottom: 19),
                            height: 84,
                            decoration: BoxDecoration(
                              color: categories[index].color,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          donationText,
                                          style: TextStyle(
                                            fontSize: 23,
                                            fontFamily: 'Text',
                                            color:
                                                Color.fromRGBO(91, 100, 96, 1),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          IconButton(
                                            onPressed: () =>
                                                openAddbox(docID: docID),
                                            icon: const Icon(Icons.edit),
                                          ),
                                          IconButton(
                                            onPressed: () => firestoreService
                                                .deleteDenation(docID),
                                            icon: const Icon(Icons.delete),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                    padding:
                                        EdgeInsets.only(bottom: 10, left: 10),
                                    child: Row(
                                      children: [
                                        Text(
                                          donationquilty,
                                          style: TextStyle(
                                              fontFamily: 'Text',
                                              color: Color.fromRGBO(
                                                  107, 120, 115, 1),
                                              fontSize: 16),
                                        ),
                                        SizedBox(width: 9),
                                        Text('|'),
                                        SizedBox(width: 9),
                                        Text(
                                          donationlocation,
                                          style: TextStyle(
                                              fontFamily: 'Text',
                                              color: Color.fromRGBO(
                                                  107, 120, 115, 1),
                                              fontSize: 16),
                                        )
                                      ],
                                    ))
                              ],
                            ));
                      },
                    );
                  } else {
                    return Center(
                      child: Text('You Did not Add Any Donation'),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

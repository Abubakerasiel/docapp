import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterappoinmentapp/Views/constanst.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/booking_controller.dart';
import '../controllers/home_controller.dart';

class StatmentPage extends StatelessWidget {
  const StatmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController txt = TextEditingController();
    final ReservationController controller = Get.put(ReservationController());
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          bottomOpacity: 0,
          elevation: 0,
          backgroundColor: Colors.white,
          leading: Image.asset('assets/Frame.png'),
          title: const Text(
            "Hello Dr.Perry",
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            IconButton(
              onPressed: Get.find<HomeController>().logOut,
              icon: const Icon(
                Icons.logout_sharp,
                color: Colors.black,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              TextField(
                controller: txt,
                autofocus: false,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 2, color: AppConstants.appColor), //<-- SEE HERE
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  hintText: "Post Statement",
                  hintStyle: TextStyle(
                      color: AppConstants.nameColor,
                      fontWeight: FontWeight.w600),
                ),
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: AppConstants.appColor))),
                      backgroundColor:
                          MaterialStatePropertyAll(AppConstants.appColor)),
                  onPressed: () {
                    Timestamp timestamp = Timestamp.now();
                    controller.saveTextToFirebase(txt.text, timestamp);
                    controller.sendAllUsersNotfication(
                        controller.tak!, txt.text, 'New annocmesnt');
                    txt.clear();
                  },
                  child: Text('Post Statment'.tr)),
              StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('userText')
                    .orderBy('timestamp',
                        descending: true) // Fetch documents in descending order
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  // Reverse the list of documents before mapping them to ListTiles
                  // List<QueryDocumentSnapshot> reversedDocs =
                  //     snapshot.data!.docs.reversed.toList();

                  return Expanded(
                    child: ListView(
                      children:
                          snapshot.data!.docs.map((DocumentSnapshot document) {
                        Map<String, dynamic> data =
                            document.data() as Map<String, dynamic>;
                        String text = data['text'] ?? '';
                        Timestamp timestamp = data['timestamp'];
                        DateTime dateTime = timestamp.toDate();
                        String formattedTime =
                            DateFormat("hh:mm a, dd MMM yyyy").format(dateTime);

                        return ListTile(
                          title: Text(
                            text,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          subtitle: Text(formattedTime),
                        );
                      }).toList(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            // color: AppConstants.appColor,
          ),
        ),
      ),
    );
  }
}

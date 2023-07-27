import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
          // leading: IconButton(
          //   onPressed: () => Get.to(() => ReservationScreen()),
          //   icon: const Icon(Icons.date_range),
          // ),
          title: const Text("Hello Dr Perry"),
          actions: [
            IconButton(
              onPressed: Get.find<HomeController>().logOut,
              icon: const Icon(Icons.logout),
            ),
          ],
        ),
        body: Column(
          children: [
            TextField(
              controller: txt,
            ),
            ElevatedButton(
                onPressed: () {
                  Timestamp timestamp = Timestamp.now();
                  controller.saveTextToFirebase(txt.text, timestamp);
                },
                child: Text('Post Statment'.tr)),
            StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection('userText').snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

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
                        title: Text('$text'),
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
    );
  }
}

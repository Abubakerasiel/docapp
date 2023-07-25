import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/booking_controller.dart';

class UserDetailsPage extends StatefulWidget {
  @override
  State<UserDetailsPage> createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  var data = Get.arguments;
  @override
  final ReservationController _reservationController =
      Get.put(ReservationController());
  @override
  void initState() {
    _reservationController.paymentStatus(data);
    //     .sendNotificatonToUser(_reservationController.user!.uid);
    // ignore: unnecessary_null_comparison

    super.initState();
  }

  // Function to show the weight edit dialog
  Future<void> _showWeightEditDialog(BuildContext context) async {
    String editedWeight = _reservationController.weight.value;

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Weight'),
          content: TextFormField(
            initialValue: editedWeight,
            onChanged: (value) {
              editedWeight = value;
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                _reservationController.weight.value = editedWeight;
                _updateWeight(context);
                // Save the edited weight to the ReservationController

                Navigator.pop(context); // Close the dialog
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final ReservationController _reservationController =
        Get.put(ReservationController());
    var data = Get.arguments;

    bool x = false;
    if (_reservationController.user!.uid == 'RfY49ef1TtPD7f6spDbaMN7aiKd2') {
      x = true;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(
          () {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name: ${_reservationController.userName.value}',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  'Phone: ${_reservationController.userPhone.value}',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  'Age: ${_reservationController.age.value}',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  'Height: ${_reservationController.height.value}',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  'Gender: ${_reservationController.gender.value}',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 20),
                TextButton(
                  child: Text(
                    'Weight: ${_reservationController.weight.value}',
                    style: TextStyle(fontSize: 18),
                  ),

                  // Open the weight edit dialog when weight is tapped
                  onPressed: () => _showWeightEditDialog(context),
                ),
                x
                    ? ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: _reservationController.y.value
                                ? MaterialStatePropertyAll(Colors.green)
                                : MaterialStatePropertyAll(Colors.amber)),
                        onPressed: () {
                          _reservationController.Paidpackge(data);
                          //  _reservationController. y.value = true;
                        },
                        child: _reservationController.y.value
                            ? Text('paid')
                            : Text(' did not paid'))
                    : SizedBox(),
                _reservationController.y.value
                    ? Icon(
                        Icons.check_circle_outlined,
                        color: Colors.green,
                      )
                    : SizedBox()
              ],
            );
          },
        ),
      ),
    );
  }

  void _updateWeight(BuildContext context) async {
    try {
      // Save the updated weight to Firestore
      await _reservationController.usersRef
          .doc(_reservationController.user!.uid)
          .update({'weight': _reservationController.weight.value});

      // Show a success message
      Get.snackbar(
        'weight update',
        'weight updated successulfy ',
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 4),
        backgroundColor: Colors.greenAccent,
        colorText: Colors.white,
      );
    } catch (error) {
      // Show an error message if update fails
      Get.snackbar(
        'weight update',
        'the weight did not update',
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 4),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}

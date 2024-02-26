import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddChallengeController extends GetxController {
  final challengeNameController = TextEditingController();
  final challengeDescriptionController = TextEditingController();
  final startDateController = TextEditingController();
  final endDateController = TextEditingController();
  final locationController = TextEditingController();
  final minPeopleController = TextEditingController();
  final isAccessibleController = RxBool(false);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  
  void addChallenge() {
    if (!formKey.currentState!.validate()) {
      // Handle invalid form
      return;
    }
    
    // Perform the add challenge logic here
    // For example, send data to a backend or database

    // Show success feedback to user
    Get.snackbar('Success', 'Challenge added successfully!',
      snackPosition: SnackPosition.BOTTOM,
    );

    // Optionally, clear the form or navigate the user away
  }

  @override
  void onClose() {
    // Clean up controllers when the controller is removed
    challengeNameController.dispose();
    challengeDescriptionController.dispose();
    startDateController.dispose();
    endDateController.dispose();
    super.onClose();
  }
}

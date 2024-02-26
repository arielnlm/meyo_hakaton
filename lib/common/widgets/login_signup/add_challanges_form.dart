import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:meyo_impact/features/authentication/controllers/challenge_controller.dart';
import 'package:meyo_impact/features/personalization/screens/hakaton_widgets/date_picker_challange.dart';
import 'package:meyo_impact/utils/constants/sizes.dart';

class AddChallengeForm extends StatelessWidget {
  AddChallengeForm({Key? key}) : super(key: key);

  final controller = Get.put(AddChallengeController());

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTextField(controller.challengeNameController, 'Event Name', Iconsax.ticket),
            _buildTextField(controller.challengeDescriptionController, 'Event Description', Iconsax.text_block, maxLines: 2),
            DatePickerField(controller: TextEditingController(), label: 'On date'),
            _buildTextField(controller.locationController, 'Location', Iconsax.location, maxLines: 1),
            _buildNumberField(controller.minPeopleController, 'Minimum People', Iconsax.user),
            _buildSwitch('Accessible for Everyone', controller.isAccessibleController, context),
            _buildCauseField(),
            _buildImagePicker(),
            const SizedBox(height: TSizes.spaceBtwSections),
            ElevatedButton(
              onPressed: () => controller.addChallenge(),
              child: Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace/3),
                child: const Text('Create Event'),
              ),
              style: ElevatedButton.styleFrom(primary: Theme.of(context).primaryColor),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, IconData icon, {int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwItems),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
        ),
        maxLines: maxLines,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'Please enter $label';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildNumberField(TextEditingController controller, String label, IconData icon) {
    return _buildTextField(controller, label, icon);
  }

  Widget _buildSwitch(String label, RxBool controller, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwItems),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Obx(() => Switch(
            value: controller.value,
            onChanged: (value) => controller.value = value,
            activeColor: Theme.of(context).primaryColor,
          )),
        ],
      ),
    );
  }

  Widget _buildCauseField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwItems),
      child: DropdownButtonFormField<String>(
        hint: Text('Select Cause'),
        onChanged: (value) {
          // Handle cause selection
        },
        items: <String>['Environment', 'Animal Welfare', 'Community', 'Others']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildImagePicker() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwItems),
      child: OutlinedButton.icon(
        onPressed: () {
          // Handle image picking
        },
        icon: Icon(Icons.camera_alt),
        label: Text('Add Image'),
      ),
    );
  }
}

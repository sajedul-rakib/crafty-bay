import 'dart:developer';
import 'package:crafty_bay_ecommerce/widgets/%20app_bar/custom/custom_app_bar.dart';
import 'package:crafty_bay_ecommerce/widgets/common/app_elevated_button.dart';
import 'package:crafty_bay_ecommerce/widgets/common/text_form_field.dart';
import 'package:flutter/material.dart';

class CreateReviewScreen extends StatelessWidget {
  const CreateReviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarTitle: "Create Review",),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const InputFormField(
                  hintText: "First Name",
                ),
                const SizedBox(
                  height: 20,
                ),
                const InputFormField(
                  hintText: "Last Name",
                ),
                const SizedBox(
                  height: 20,
                ),
                const InputFormField(
                  hintText: "Write Review",
                  maxLine: 7,
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: AppElevatedButton(
                    text: "Submit",
                    onPressed: () {
                      log("Submit Review");
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

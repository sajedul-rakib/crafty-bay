import 'dart:developer';
import 'package:crafty_bay_ecommerce/utils/user/user_data/save_user_data.dart';
import 'package:crafty_bay_ecommerce/widgets/%20app_bar/custom/custom_app_bar.dart';
import 'package:crafty_bay_ecommerce/widgets/common/app_elevated_button.dart';
import 'package:crafty_bay_ecommerce/widgets/common/text_form_field.dart';
import 'package:flutter/material.dart';

class CreateReviewScreen extends StatefulWidget {
  const CreateReviewScreen({Key? key}) : super(key: key);

  @override
  State<CreateReviewScreen> createState() => _CreateReviewScreenState();
}

class _CreateReviewScreenState extends State<CreateReviewScreen> {
  final TextEditingController _firstNameETController = TextEditingController();

  final TextEditingController _lastNameETController = TextEditingController();

  final TextEditingController _reviewDescriptionNameETController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _firstNameETController.text = SaveLoggedUserData.firstName ?? '';
    _lastNameETController.text = SaveLoggedUserData.lastName ??'';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        appBarTitle: "Create Review",
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  InputFormField(
                    hintText: "First Name",
                    textEditingController: _firstNameETController,
                    isReadable: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InputFormField(
                    hintText: "Last Name",
                    textEditingController: _lastNameETController,
                    isReadable: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InputFormField(
                    hintText: "Write Review",
                    textEditingController: _reviewDescriptionNameETController,
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
      ),
    );
  }
}

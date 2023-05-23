import 'package:crafty_bay_ecommerce/widgets/%20app_bar/custom/custom_app_bar.dart';
import 'package:crafty_bay_ecommerce/widgets/common/app_elevated_button.dart';
import 'package:flutter/material.dart';

class ProfileDetailScreen extends StatelessWidget {
  const ProfileDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(appBarTitle: "My profile"),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
                child: SizedBox(
              height: 300,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Full Name:'),
                  Text("Sajedul Islam Rakib"),
                  Text("Email"),
                  Text("rakibmd5050505@gmail.com"),
                  Text('Mobile'),
                  Text('01609491403'),
                  Text("Address"),
                  Text("Shekhertek 8,Mohammadpur, Adabor, Dhaka-1207")
                ],
              ),
            )),
          ),
          AppElevatedButton(text: "Edit Profile")
        ],
      ),
    );
  }
}

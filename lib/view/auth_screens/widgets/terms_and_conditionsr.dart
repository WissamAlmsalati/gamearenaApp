import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

Future<String> loadAsset() async {
  return await rootBundle.loadString('assets/texts/terms_and_conditions.text');
}

Widget termsAndConditionsText(BuildContext context) {
  return FutureBuilder<String>(
    future: loadAsset(),
    builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        return RichText(
          text: TextSpan(
            text: 'I agree to the ',
            style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              TextSpan(
                text: 'terms and conditions',
                style: TextStyle(color: Colors.blue),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                   Get.to(() => TermsAndConditionsScreen(termsAndConditions: snapshot.data!),
                   transition: Transition.native,
                    duration: Duration(milliseconds: 500)
                   );
                  },
              ),
            ],
          ),
        );
      } else {
        return CircularProgressIndicator();
      }
    },
  );
}

class TermsAndConditionsScreen extends StatelessWidget {
  final String termsAndConditions;

  TermsAndConditionsScreen({required this.termsAndConditions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terms and Conditions'),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(termsAndConditions),
        ),
      ),
    );
  }
}
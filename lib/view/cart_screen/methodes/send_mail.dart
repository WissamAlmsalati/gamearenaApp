import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'dart:math';
import '../../../model/product_model.dart';

class EmailSender {
  static Future<void> sendOrderEmail(
      String recipientEmail,
      List<ProductModel> productList,
      ) async {
    // Create an SMTP client configuration
    final smtpServer = gmail('ststoremail9@gmail.com', 'rrlr oqcm hcmk rmsr');

    // Create the email message
    final message = Message()
      ..from = Address('ststoremail9@gmail.com', 'Game Arena Store')
      ..recipients.add(recipientEmail)
      ..subject = 'New Order'
      ..html = '';

    // Generate and send OTP to the user's email
    final generatedOTP = generateOTP();
    sendOTP(recipientEmail, generatedOTP);

    // OTP input container
    message.html = '''
      <p>Please enter the OTP to confirm your order:</p>
      <form action="/confirm-order" method="post">
        <input type="text" name="otp" placeholder="Enter OTP">
        <button type="submit">Confirm Order</button>
      </form>
    ''';

    try {
      // Send the email
      final sendReport = await send(message, smtpServer);
      print('Message sent: $sendReport');
    } catch (e) {
      print('Error occurred: $e');
    }
  }

  static String generateOTP() {
    final random = Random();
    final digits = List.generate(4, (_) => random.nextInt(10));
    return digits.join('');
  }

  static Future<void> sendOTP(String recipientEmail, String otp) async {
    final smtpServer = gmail('ststoremail9@gmail.com', 'rrlr oqcm hcmk rmsr');
    final message = Message()
      ..from = Address('ststoremail9@gmail.com', 'Game Arena Store')
      ..recipients.add(recipientEmail)
      ..subject = 'Your OTP'
      ..text = 'Your OTP is $otp';

    try {
      final sendReport = await send(message, smtpServer);
      print('OTP sent: $sendReport');
    } catch (e) {
      print('Error occurred: $e');
    }
  }

  static String generateOrderCartHtml(List<ProductModel> productList) {
    String html = '<h1>Order Details</h1>';

    for (var product in productList) {
      html += '<p>Product Name: ${product.productName}, Product Price: ${product.productPrice}</p>';
    }

    return html;
  }
}
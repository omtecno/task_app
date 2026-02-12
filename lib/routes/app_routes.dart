import 'package:flutter/material.dart';
import '../screens/help_center_screen.dart';
import '../screens/contact_us_1_screen.dart';
import '../screens/contact_us_2_screen.dart';
import '../screens/contact_us_3_screen.dart';
import '../screens/data_privacy_screen.dart';

class AppRoutes {
  static const helpCenter = '/';
  static const contact1 = '/contact1';
  static const contact2 = '/contact2';
  static const contact3 = '/contact3';
  static const dataPrivacy = '/dataPrivacy';

  static Map<String, WidgetBuilder> routes = {
    helpCenter: (context) => const HelpCenterScreen(),
    contact1: (context) => const ContactUs1Screen(),
    contact2: (context) => const ContactUs2Screen(),
    contact3: (context) => const ContactUs3Screen(),
    dataPrivacy: (context) => const DataPrivacyScreen(),
  };
}

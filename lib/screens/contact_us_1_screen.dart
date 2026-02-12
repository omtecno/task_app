import 'package:flutter/material.dart';
import '../routes/app_routes.dart';
import '../widgets/custom_card.dart';

class ContactUs1Screen extends StatelessWidget {
  const ContactUs1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [

              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back),
                  ),
                  const Expanded(
                    child: Center(
                      child: Text(
                        "Contact Us",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),

              const SizedBox(height: 20),

              const Text(
                "We're here to help. Choose an option below or send us a message directly",
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 20),

              Row(
                children: [
                  Expanded(
                    child: CustomCard(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.contact2);
                      },
                      child: const Column(
                        children: [
                          Icon(Icons.chat_bubble_outline, size: 30),
                          SizedBox(height: 10),
                          Text("Chat",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold)),
                          SizedBox(height: 5),
                          Text("Typically replies in 5 min.",
                              textAlign: TextAlign.center),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: CustomCard(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.contact2);
                      },
                      child: const Column(
                        children: [
                          Icon(Icons.mail_outline, size: 30),
                          SizedBox(height: 10),
                          Text("Email",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold)),
                          SizedBox(height: 5),
                          Text("Typically replies within 24h.",
                              textAlign: TextAlign.center),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 15),

              const Row(
                children: [
                  Icon(Icons.access_time, size: 18),
                  SizedBox(width: 5),
                  Text("Available 9:00 AM – 5:00 PM EST"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

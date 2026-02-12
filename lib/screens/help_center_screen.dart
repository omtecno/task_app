import 'package:flutter/material.dart';
import '../widgets/custom_card.dart';
import '../routes/app_routes.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const Center(
                child: Text(
                  "Help Center",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),

              const SizedBox(height: 20),

              // Search
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.black26),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.search),
                    SizedBox(width: 10),
                    Text("Search")
                  ],
                ),
              ),

              const SizedBox(height: 20),

              CustomCard(
                child: const Text(
                  "Top FAQs\n\n• Getting Started\n• Billing & Subscriptions\n• Privacy & Data Security",
                  style: TextStyle(fontSize: 15),
                ),
              ),

              CustomCard(
                child: const Text(
                  "Tutorials / Getting Started\n\n• Setting up your profile\n• Exploring meditations & exercises\n• Linking wearables",
                  style: TextStyle(fontSize: 15),
                ),
              ),

              CustomCard(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.contact1);
                },
                child: const Text(
                  "Contact Support",
                  style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),

              CustomCard(
                child: const Text(
                  "Resources\n\n• User Guides\n• Community Forums\n• FAQ Database",
                  style: TextStyle(fontSize: 15),
                ),
              ),

              const Spacer(),

              const Center(
                child: Text(
                  "App Version: 1.0  Last Updated: February 2026",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

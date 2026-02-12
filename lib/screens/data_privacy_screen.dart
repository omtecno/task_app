import 'package:flutter/material.dart';

class DataPrivacyScreen extends StatelessWidget {
  const DataPrivacyScreen({super.key});

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
                        "Data Privacy",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              _privacyCard(
                "Your Data & Your Control",
                "We believe in transparency and put you in control. Your data is private encrypted.",
              ),

              _privacyCard(
                "How we use data",
                "• To personalize your experience\n• For app improvement (anonymized)\n• To provide insights and activity pattern",
              ),

              _privacyCard(
                "Data Sharing",
                "Your data is private and visible only to you unless you choose to share it.",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _privacyCard(String title, String subtitle) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.black26),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(subtitle),
        ],
      ),
    );
  }
}

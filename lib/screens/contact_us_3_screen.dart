import 'package:flutter/material.dart';

class ContactUs3Screen extends StatelessWidget {
  const ContactUs3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),

                /// HEADER
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
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 48),
                  ],
                ),

                const SizedBox(height: 15),

                /// SUBTITLE
                const Text(
                  "We're here to help. Choose an option\nbelow or send us a message directly",
                  style: TextStyle(fontSize: 15, height: 1.4),
                ),

                const SizedBox(height: 25),

                /// CHAT & EMAIL CARDS
                Row(
                  children: [
                    Expanded(
                      child: _optionCard(
                        icon: Icons.chat_bubble_outline,
                        title: "Chat",
                        subtitle1: "Connect with a\nsupport agent.",
                        subtitle2: "Typically replies in\n5 min.",
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: _optionCard(
                        icon: Icons.mail_outline,
                        title: "Email",
                        subtitle1: "Send us an email.",
                        subtitle2: "Typically replies\nwithin 24h.",
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                /// TIME ROW
                Row(
                  children: const [
                    Icon(Icons.access_time, size: 18),
                    SizedBox(width: 8),
                    Text(
                      "Available 9:00 AM – 5:00 PM EST",
                      style: TextStyle(color: Colors.black54),
                    ),
                  ],
                ),

                const SizedBox(height: 40),

                /// CONTACT EMAIL CARD
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 25,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black45),
                  ),
                  child: const Column(
                    children: [
                      Text("contact us at", style: TextStyle(fontSize: 16)),
                      SizedBox(height: 8),
                      Text(
                        "serenemind@mentalhealth.in",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 60),

                /// THANK YOU
                const Center(
                  child: Text(
                    "Thank you",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
                  ),
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// OPTION CARD WIDGET
  static Widget _optionCard({
    required IconData icon,
    required String title,
    required String subtitle1,
    required String subtitle2,
  }) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black45),
      ),
      child: Column(
        children: [
          Icon(icon, size: 30),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle1,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 13),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle2,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 13),
          ),
        ],
      ),
    );
  }
}

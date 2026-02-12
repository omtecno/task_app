import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'contact_us_3_screen.dart';

class ContactUs2Screen extends StatefulWidget {
  const ContactUs2Screen({super.key});

  @override
  State<ContactUs2Screen> createState() => _ContactUs2ScreenState();
}

class _ContactUs2ScreenState extends State<ContactUs2Screen> {
  final TextEditingController _controller = TextEditingController();

  bool _isTyping = false;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _isTyping = _controller.text.trim().isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _sendMessage() async {
    if (!_isTyping || _isLoading) return;

    setState(() {
      _isLoading = true;
    });

    final url = Uri.parse("http://localhost:5000/api/messages");

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"message": _controller.text.trim()}),
      );

      if (response.statusCode == 201) {
        _controller.clear();

        if (!mounted) return;

        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const ContactUs3Screen()),
        );
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("Failed to send message")));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Server error. Check backend.")),
      );
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
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
                style: TextStyle(fontSize: 15),
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

              /// TIME
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

              /// MESSAGE BOX
              Container(
                height: 130,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black45),
                ),
                child: TextField(
                  controller: _controller,
                  maxLines: null,
                  expands: true,
                  textAlignVertical: TextAlignVertical.top,
                  decoration: const InputDecoration(
                    hintText: "Type message....",
                    border: InputBorder.none,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              /// SEND BUTTON
              GestureDetector(
                onTap: _isTyping ? _sendMessage : null,
                child: Container(
                  height: 55,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: _isTyping ? Colors.black : Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: _isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : Text(
                          "Send Message",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: _isTyping ? Colors.white : Colors.black54,
                          ),
                        ),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  /// OPTION CARD
  Widget _optionCard({
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

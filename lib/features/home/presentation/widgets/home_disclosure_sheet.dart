import 'package:flutter/material.dart';
import 'package:b1k5_mobile/shared/widgets/button/custom_button.dart';

class HomeDisclosureSheet extends StatelessWidget {
  const HomeDisclosureSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Why am I seeing this?",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF910A19),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "To provide a more relevant mobile banking experience, CIMB Niaga personalizes certain features, recommendations, and homepage content based on your activity and feature usage within the app",
                    style: TextStyle(fontSize: 14, color: Colors.black87),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 16),
                  RichText(
                    textAlign: TextAlign.start,
                    text: const TextSpan(
                      style: TextStyle(fontSize: 14, color: Colors.black87),
                      children: [
                        TextSpan(text: "By continuing, you "),
                        TextSpan(
                          text: "agree",
                          style: TextStyle(color: Color(0xFF910A19), fontWeight: FontWeight.bold),
                        ),
                        TextSpan(text: " and "),
                        TextSpan(
                          text: "confirm",
                          style: TextStyle(color: Color(0xFF910A19), fontWeight: FontWeight.bold),
                        ),
                        TextSpan(text: " that the system may analyze:"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  _buildBulletText("frequently used banking features,"),
                  _buildRichBulletText(
                    const TextSpan(
                      children: [
                        TextSpan(
                          text: "transaction activity",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(text: " and "),
                        TextSpan(
                          text: "spending patterns",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(text: ","),
                      ],
                    ),
                  ),
                  _buildBulletText("preferred financial services,"),
                  _buildBulletText("and app interaction behavior"),
                  const SizedBox(height: 16),
                  const Text(
                    "This information is used to:",
                    style: TextStyle(fontSize: 14, color: Colors.black87),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 8),
                  _buildBulletText("recommend relevant banking features and services,"),
                  _buildBulletText("prioritize shortcuts and quick actions,"),
                  _buildBulletText("personalize homepage banners and insights,"),
                  _buildBulletText("and improve your overall mobile banking experience."),
                  const SizedBox(height: 16),
                  const Text(
                    "Your personal data will remain protected and used only to support personalization within the application. You can manage or disable personalization preferences at any time through settings",
                    style: TextStyle(fontSize: 14, color: Colors.black87),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          CustomButton(
            backgroundColor: const Color(0xFF910A19),
            textColor: Colors.white,
            borderRadius: 24,
            text: "I Agree",
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildRichBulletText(TextSpan span) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4, left: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("\u2022", style: TextStyle(fontSize: 14, height: 1.4, color: Colors.black87)),
          const SizedBox(width: 8),
          Expanded(
            child: RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                style: const TextStyle(fontSize: 14, height: 1.4, color: Colors.black87),
                children: [span],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBulletText(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4, left: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("\u2022", style: TextStyle(fontSize: 14, height: 1.4, color: Colors.black87)),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 14, height: 1.4, color: Colors.black87),
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }
}

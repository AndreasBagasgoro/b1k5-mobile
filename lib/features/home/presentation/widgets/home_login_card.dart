import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeLoginCard extends StatelessWidget {
  const HomeLoginCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 20,
      right: 20,
      child: GestureDetector(
        onTap: () {
          context.push('/Login');
        },
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFfefdfb), Color(0xFFffd0d0)],
            ),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.red.withOpacity(0.05),
                blurRadius: 15,
                offset: const Offset(0, 10),
              )
            ]
          ),
          child: Stack(
            children: [
              Positioned(
                left: -22,
                bottom: -32,
                top: -20,
                child: Image.asset(
                  'assets/features/home/icons/octo_rocket.webp',
                  width: 80,
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                bottom: 0,
                child: Opacity(
                  opacity: 0.8, // Adjust if needed
                  child: Image.asset(
                    'assets/features/home/images/texture_login_card.webp',
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 64, right: 24, top: 20, bottom: 20),
                child: Row(
                  children: [
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ready to discover more?',
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'Login or Create Account Now',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                              letterSpacing: 0.05,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          )
                        ]
                      ),
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xFF910A19), // Maroon red
                        size: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

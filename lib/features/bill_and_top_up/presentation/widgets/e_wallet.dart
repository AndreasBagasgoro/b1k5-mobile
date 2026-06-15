import 'package:flutter/material.dart';
import 'package:b1k5_mobile/shared/widgets/input/search_bar.dart';

class EWallet extends StatelessWidget {
  const EWallet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 1. Text "Top Up e-wallet"
          const Text(
            "Top Up e-wallet",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 16),
          
          // 2. Search bar
          const CustomSearchBar(hintText: 'Search e-wallet...'),
          const SizedBox(height: 20),
          
          // 3. Container seperti my_account_body_1
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              image: const DecorationImage(
                image: AssetImage("assets/features/my_account/images/body_1_bg.png"),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey.shade300, width: 1.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: Text(
                      "Check your latest balance here",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Color(0xFFDF5145), Color(0xFFA32920)],
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        'Scan Card',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),  
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          
          // 4. Row list E wallet
          Expanded(
            child: Builder(
              builder: (context) {
                final List<Map<String, String>> eWallets = [
                  {'name': 'Flazz BCA', 'image': 'assets/features/bills_top_up/icons/flazz_bca.webp'},
                  {'name': 'BNI TapCash', 'image': 'assets/features/bills_top_up/icons/tapcash_bni.webp'},
                  {'name': 'Go-Pay', 'image': 'assets/features/bills_top_up/icons/gopay.webp'},
                  {'name': 'Go-Pay Driver', 'image': 'assets/features/bills_top_up/icons/gopay.webp'},
                  {'name': 'OVO', 'image': 'assets/features/bills_top_up/icons/ovo.webp'},
                  {'name': 'Dana', 'image': 'assets/features/bills_top_up/icons/dana.webp'},
                  {'name': 'Doku Wallet', 'image': 'assets/features/bills_top_up/icons/doku_wallet.webp'},
                ];

                return ListView.separated(
                  itemCount: eWallets.length,
                  separatorBuilder: (context, index) => const Divider(height: 32),
                  itemBuilder: (context, index) {
                    final wallet = eWallets[index];
                    return _buildEWalletRow(wallet['name']!, wallet['image']!);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEWalletRow(String name, String imagePath) {
    return Row(
      children: [
        Image.asset(imagePath, width: 40, height: 40),
        const SizedBox(width: 24),
        Expanded(
          child: Text(
            name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const Icon(Icons.chevron_right, color: Color(0xFF910A19), size: 30,),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class RecommendationItem {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  RecommendationItem({
    required this.title,
    required this.icon,
    required this.onTap,
  });
}

class HomeRecommendation extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<RecommendationItem> items;

  const HomeRecommendation({
    super.key,
    required this.title,
    required this.subtitle,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFEBEBEB)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 10,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 16),
          LayoutBuilder(
            builder: (context, constraints) {
              // Hitung lebar agar ukuran card konsisten berdasarkan ukuran jika memuat 3 card (2 gap = 32)
              double cardWidth = (constraints.maxWidth - 32) / 3;

              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: items.asMap().entries.map((entry) {
                    int idx = entry.key;
                    RecommendationItem item = entry.value;
                    
                    Widget cardWidget = SizedBox(
                      width: cardWidth,
                      child: _buildRecommendationCard(item),
                    );
                    
                    if (idx < items.length - 1) {
                      return [cardWidget, const SizedBox(width: 16)];
                    }
                    return [cardWidget];
                  }).expand((element) => element).toList(),
                ),
              );
            },
          ),
        ],
      ),
      ),
    );
  }

  Widget _buildRecommendationCard(RecommendationItem item) {
    return GestureDetector(
      onTap: item.onTap,
      child: AspectRatio(
        aspectRatio: 1, // Agar berbentuk persegi
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
          decoration: BoxDecoration(
            color: const Color(0xFF910A19), // Latar merah marun
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white, // Latar putih untuk icon/logo
                  shape: BoxShape.circle, // Gunakan shape circle agar bulat sempurna
                ),
                child: Icon(
                  item.icon,
                  color: const Color(0xFF910A19), // Warna icon disesuaikan
                  size: 20, // Diperkecil agar memberi ruang untuk teks
                ),
              ),
              // const SizedBox(height: 2),
              Expanded(
                child: Center(
                  child: Text(
                    item.title,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.visible, // Jangan di-ellipsis agar teks penuh tampil
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      height: 1.1, // Merapatkan jarak antar baris
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

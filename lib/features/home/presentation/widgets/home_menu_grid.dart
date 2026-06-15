import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MenuItemData {
  final String asset;
  final String label;
  final String category;
  final VoidCallback onPressed;

  MenuItemData({
    required this.asset,
    required this.label,
    required this.category,
    required this.onPressed,
  });
}

class HomeMenuGrid extends StatelessWidget {
  final String selectedTab;

  const HomeMenuGrid({
    super.key,
    required this.selectedTab,
  });

  Widget _buildMenuIcon(MenuItemData item) {
    return GestureDetector(
      onTap: item.onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(item.asset, height: 40, width: 40),
          const SizedBox(height: 8),
          Text(
            item.label,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w500, height: 1.2),
          ),
        ],
      ),
    );
  }

  Widget _buildIconGridRow(List<Widget> children) {
    List<Widget> rowChildren = [];
    for (int i = 0; i < 5; i++) {
      if (i < children.length) {
        rowChildren.add(Expanded(child: children[i]));
      } else {
        rowChildren.add(Expanded(child: const SizedBox()));
      }
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: rowChildren,
    );
  }

  @override
  Widget build(BuildContext context) {
    // Definisi data untuk setiap menu dengan props kategori dan onPressed
    final List<MenuItemData> allItems = [
      MenuItemData(
        asset: 'assets/features/home/icons/transfer.webp',
        label: 'Transfer',
        category: 'Transaction',
        onPressed: () {
          context.push('/Transfer');
        },
      ),
      MenuItemData(
        asset: 'assets/features/home/icons/bills_and_top_up.webp',
        label: 'Bills &\nTop Up',
        category: 'Transaction',
        onPressed: () {
          context.push('/BillAndTopUp');
        
        },
      ),
      MenuItemData(
        asset: 'assets/features/home/icons/cardless.webp',
        label: 'Cardless',
        category: 'Transaction',
        onPressed: () {},
      ),
      MenuItemData(
        asset: 'assets/features/home/icons/electronic_card.webp',
        label: 'Electronic\nCard',
        category: 'Products',
        onPressed: () {
          context.push('/ElectronicCard');
        },
      ),
      MenuItemData(
        asset: 'assets/features/home/icons/verify_with_octo.webp',
        label: 'Verify with\nOCTO',
        category: 'Others',
        onPressed: () {},
      ),
      MenuItemData(
        asset: 'assets/features/home/icons/my_schedule.webp',
        label: 'My\nSchedule',
        category: 'Others',
        onPressed: () {
          context.push('/MySchedule');
        },
      ),
      MenuItemData(
        asset: 'assets/features/home/icons/investment.webp',
        label: 'Investment',
        category: 'Products',
        onPressed: () {
          context.push('/Investment');
        },
      ),
      MenuItemData(
        asset: 'assets/features/home/icons/promo_code.webp',
        label: 'Promo\nCode',
        category: 'Others',
        onPressed: () {},
      ),
      MenuItemData(
        asset: 'assets/features/home/icons/savings_and_deposit.webp',
        label: 'Savings\n& Deposit',
        category: 'Products',
        onPressed: () {
          context.push('/Saving');
        },
      ),
    ];

    // Filter fitur berdasarkan tab yang dipilih
    final filteredItems = selectedTab == 'For You'
        ? allItems
        : allItems.where((item) => item.category == selectedTab).toList();

    // Membagi item yang difilter menjadi beberapa baris (maksimal 5 item per baris)
    List<Widget> rows = [];
    for (int i = 0; i < filteredItems.length; i += 5) {
      final end = (i + 5 < filteredItems.length) ? i + 5 : filteredItems.length;
      final rowItems = filteredItems.sublist(i, end).map((item) => _buildMenuIcon(item)).toList();
      rows.add(_buildIconGridRow(rowItems));
      
      // Tambahkan jarak antar baris jika masih ada baris berikutnya
      if (end < filteredItems.length) {
        rows.add(const SizedBox(height: 20));
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: rows.isNotEmpty ? rows : [const Center(child: Text('No features found'))],
      ),
    );
  }
}

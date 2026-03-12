import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:halal_app/features/domain/models/transaction_model.dart';
import 'package:halal_app/features/presentation/screens/home_screen/widgets/credit_score.dart';
import 'package:halal_app/features/presentation/screens/home_screen/widgets/halal_rewards.dart';
import 'package:halal_app/features/presentation/screens/home_screen/widgets/home_sections.dart';
import 'package:halal_app/features/presentation/screens/home_screen/widgets/promo_banner.dart';
import 'package:halal_app/features/presentation/screens/home_screen/widgets/quick_action.dart';
import 'package:halal_app/features/presentation/screens/home_screen/widgets/side_nav_drawer.dart';
import 'package:halal_app/features/presentation/screens/home_screen/widgets/transactions.dart';
import 'package:halal_app/features/presentation/screens/home_screen/widgets/wallet_card.dart';
import 'package:halal_app/utils/constants/sizes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _balanceVisible = true;
  final PageController _promoCtrl = PageController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Transaction> _transactions = [
    Transaction(
      title: 'Airtime to +234 837 2872',
      amount: '₦2,500',
      time: 'Yesterday, 11:40am',
    ),
    Transaction(
      title: 'Airtime to +234 837 2872',
      amount: '₦2,500',
      time: '4 days ago',
    ),
    Transaction(
      title: 'Airtime to +234 837 2872',
      amount: '₦2,500',
      time: '4 days ago',
    ),
    Transaction(
      title: 'Airtime to +234 837 2872',
      amount: '₦2,500',
      time: '4 days ago',
    ),
  ];

  @override
  void dispose() {
    _promoCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      drawer: const SideNavDrawer(),
      body: Column(
        children: [
          // Header row
          HomeTopSection(scaffoldKey: _scaffoldKey),

          // Blue wallet balance card
          HomeWalletCard(
            balanceVisible: _balanceVisible,
            onToggleBalance: () =>
                setState(() => _balanceVisible = !_balanceVisible),
          ),

          // Credit score row
          const HomeCreditScore(),

          // Scrollable body
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(bottom: ZohSizes.defaultSpace),
              child: Padding(
                padding: const EdgeInsets.only(top: ZohSizes.md),
                child: Column(
                  children: [
                    const HomeQuickActions(),
                    const SizedBox(height: 16),
                    const HomePromoBanner(),
                    const SizedBox(height: 24),
                    const HomeHalalRewards(),
                    const SizedBox(height: 24),
                    HomeTransactions(transactions: _transactions),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:halal_app/features/domain/models/savings_tx_model.dart';
import 'package:halal_app/features/presentation/screens/savings_screen/widgets/savings_balance_section.dart';
import 'package:halal_app/features/presentation/screens/savings_screen/widgets/savings_chart.dart';
import 'package:halal_app/features/presentation/screens/savings_screen/widgets/savings_details_card.dart';
import 'package:halal_app/features/presentation/screens/savings_screen/widgets/savings_sections.dart';
import 'package:halal_app/features/presentation/screens/savings_screen/widgets/savings_target_amount.dart';
import 'package:halal_app/features/presentation/screens/savings_screen/widgets/savings_transaction_history.dart';
import 'package:halal_app/utils/constants/sizes.dart';

class BackupMoneySavingsScreen extends StatefulWidget {
  const BackupMoneySavingsScreen({super.key});

  @override
  State<BackupMoneySavingsScreen> createState() =>
      _BackupMoneySavingsScreenState();
}

class _BackupMoneySavingsScreenState extends State<BackupMoneySavingsScreen> {
  // Chart touch state
  int? _touchedIndex;

  // Spline chart data points
  final List<double> _chartData = [
    0.45, 0.38, 0.50, 0.55, 0.48, 0.62, 0.70,
    0.80, 0.95, 0.75, 0.60, 0.65, 0.55, 0.58, 0.50,
  ];

  static const int _peakIndex = 8;

  final List<SavingsTx> _transactions = [
    SavingsTx(
      amount: '₦20,000.00',
      type: 'Automatic Top up',
      date: 'Sep 23, 2022',
      isTopUp: true,
    ),
    SavingsTx(
      amount: '₦20,000.00',
      type: 'Automatic Top up',
      date: 'Sep 23, 2022',
      isTopUp: true,
    ),
    SavingsTx(
      amount: '₦20,000.00',
      type: 'Withdrawal',
      date: 'Sep 23, 2022',
      isTopUp: false,
    ),
    SavingsTx(
      amount: '₦20,000.00',
      type: 'Withdrawal',
      date: 'Sep 23, 2022',
      isTopUp: false,
    ),
    SavingsTx(
      amount: '₦20,000.00',
      type: 'Automatic Top up',
      date: 'Sep 23, 2022',
      isTopUp: true,
      faded: true,
    ),
  ];

  void _onChartTapDown(Offset localPos, double screenWidth) {
    final step = screenWidth / (_chartData.length - 1);
    final index = (localPos.dx / step).round().clamp(0, _chartData.length - 1);
    setState(() => _touchedIndex = index);
  }

  void _onChartTapUp() {
    setState(() => _touchedIndex = null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SavingsAppBar(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: ZohSizes.defaultSpace),

                  const SavingsBalanceSection(),

                  const SizedBox(height: ZohSizes.sm),

                  SavingsChart(
                    chartData: _chartData,
                    peakIndex: _peakIndex,
                    touchedIndex: _touchedIndex,
                    onTapDown: _onChartTapDown,
                    onTapUp: _onChartTapUp,
                  ),

                  const SizedBox(height: ZohSizes.defaultSpace),

                  const SavingsTargetAmount(),

                  const SizedBox(height: ZohSizes.spaceBtwZoh),

                  const SavingsDetailsCard(),

                  const SizedBox(height: ZohSizes.spaceBtwSections),

                  SavingsTransactionHistory(transactions: _transactions),

                  const SizedBox(height: ZohSizes.spaceBtwSections * 1.2),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
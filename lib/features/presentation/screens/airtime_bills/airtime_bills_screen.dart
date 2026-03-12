import 'package:flutter/material.dart';
import 'package:halal_app/utils/constants/colors.dart';
import 'package:halal_app/utils/constants/image_strings.dart';
import 'package:halal_app/utils/constants/sizes.dart';

import '../../../data/services/remote_config_service.dart';
import '../../../domain/models/bill_item_model.dart';
import 'widgets/bill_tile.dart';

class AirtimeBillsScreen extends StatefulWidget {
  const AirtimeBillsScreen({super.key});

  @override
  State<AirtimeBillsScreen> createState() => _AirtimeBillsScreenState();
}

class _AirtimeBillsScreenState extends State<AirtimeBillsScreen> {
  List<BillItem> _items = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadItems();
    _listenForUpdates();
  }

  Future<void> _loadItems() async {
    setState(() => _isLoading = true);
    await RemoteConfigService().init();
    if (!mounted) return;
    setState(() {
      _items = RemoteConfigService().getAirtimeBillItems();
      _isLoading = false;
    });
  }

  void _listenForUpdates() {
    RemoteConfigService().onConfigUpdated.listen((_) async {
      await RemoteConfigService().activate();
      if (!mounted) return;
      setState(() {
        _items = RemoteConfigService().getAirtimeBillItems();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: ZohSizes.iconXs),
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: const Color(0xFFDDDDDD),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: ZohSizes.defaultSpace),
          const Text(
            'Buy Airtime & Bills',
            style: TextStyle(
              fontSize: ZohSizes.defaultSpace,
              fontWeight: FontWeight.w600,
              letterSpacing: -0.3,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 28),

          Expanded(
            child: _isLoading
                ? const Center(
              child: CircularProgressIndicator(
                color: ZohColors.primaryColor,
                strokeWidth: 2,
              ),
            )
                : ListView.builder(
              padding: const EdgeInsets.symmetric(
                horizontal: ZohSizes.spaceBtwZoh,
              ),
              itemCount: _items.length,
              itemBuilder: (context, index) {
                final item = _items[index];
                return BillTile(
                  label: item.label,
                  image: ZohImageStrings.resolveImage(item.image),
                  bgColor: Color(int.parse(item.bgColor)),
                  showDivider: index != _items.length - 1,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
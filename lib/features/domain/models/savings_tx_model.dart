class SavingsTx {
  final String amount, type, date;
  final bool isTopUp;
  final bool faded;

  const SavingsTx({
    required this.amount,
    required this.type,
    required this.date,
    required this.isTopUp,
    this.faded = false,
  });
}
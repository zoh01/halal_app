class BillItem {
  final String label;
  final String image;
  final String bgColor;

  const BillItem({
    required this.label,
    required this.image,
    required this.bgColor,
  });

  factory BillItem.fromJson(Map<String, dynamic> json) {
    return BillItem(
      label:   json['label']   as String,
      image:   json['image']   as String,
      bgColor: json['bgColor'] as String,
    );
  }
}
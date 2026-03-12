/// All avatar asset paths and bubble layout positions.
/// Lives in domain because it is pure data — no Flutter dependency.

final List<String> kAvatarAssets = List.generate(
  20,
      (i) => 'assets/avatars/avatar_${(i + 1).toString().padLeft(2, '0')}.png',
);

class BubbleLayout {
  final double x, y, s;
  const BubbleLayout({required this.x, required this.y, required this.s});
}

const List<BubbleLayout> kLayouts = [
  BubbleLayout(x: -0.38, y: -0.28, s: 0.90), // top-left large
  BubbleLayout(x: -0.12, y: -0.32, s: 0.70), // top center-left
  BubbleLayout(x:  0.10, y: -0.30, s: 0.55), // top center small
  BubbleLayout(x:  0.30, y: -0.26, s: 0.78), // top-right
  BubbleLayout(x:  0.44, y: -0.20, s: 0.60), // right-top small
  BubbleLayout(x: -0.44, y: -0.10, s: 0.55), // left mid-top
  BubbleLayout(x: -0.22, y: -0.14, s: 0.85), // left-center large
  BubbleLayout(x:  0.02, y: -0.10, s: 0.65), // center small
  BubbleLayout(x:  0.24, y: -0.12, s: 0.88), // right-center large
  BubbleLayout(x:  0.44, y: -0.04, s: 0.95), // far right large
  BubbleLayout(x: -0.42, y:  0.06, s: 0.85), // left mid large
  BubbleLayout(x: -0.18, y:  0.04, s: 0.55), // center-left small
  BubbleLayout(x:  0.04, y:  0.08, s: 0.76), // center large
  BubbleLayout(x:  0.26, y:  0.04, s: 0.52), // center-right small
  BubbleLayout(x:  0.42, y:  0.12, s: 0.65), // right mid
  BubbleLayout(x: -0.38, y:  0.22, s: 0.55), // left bottom
  BubbleLayout(x: -0.14, y:  0.20, s: 0.92), // center-left bottom large
  BubbleLayout(x:  0.08, y:  0.24, s: 0.56), // center bottom small
  BubbleLayout(x:  0.28, y:  0.20, s: 0.74), // right bottom
  BubbleLayout(x:  0.44, y:  0.28, s: 0.56), // far-right bottom small
];
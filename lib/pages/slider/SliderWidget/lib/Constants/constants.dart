/// This package contains all the constants used.

// ignore: constant_identifier_names
const BUBBLE_WIDTH = 55.0;

// ignore: constant_identifier_names
const FULL_TARNSITION_PX = 300.0;

// ignore: constant_identifier_names
const PERCENT_PER_MILLISECOND = 0.00125;

enum SlideDirection {
  leftToRight,
  rightToLeft,
  none,
}

enum UpdateType {
  dragging,
  doneDragging,
  animating,
  doneAnimating,
}

enum TransitionGoal {
  open,
  close,
}

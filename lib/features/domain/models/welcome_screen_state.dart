/// Represents the 3 states of the WelcomeScreen avatar selection flow.
/// Lives in domain because it is pure business logic — no Flutter dependency.

enum WelcomeScreenState { idle, selecting, selected }
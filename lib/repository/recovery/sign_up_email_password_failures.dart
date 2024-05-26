class SignInWithEmailPasswordFailure {
  final String message;

  const SignInWithEmailPasswordFailure([this.message = "someting went wrong"]);

  factory SignInWithEmailPasswordFailure.code(String code) {
    switch (code) {
      case 'weak-password':
        return const SignInWithEmailPasswordFailure(
            'Please enter a strong password');
      case 'invalid-email':
        return const SignInWithEmailPasswordFailure(
            'Your email is not valid or ill formatted');
      case 'email-already-in-use':
        return const SignInWithEmailPasswordFailure(
            'Email is already in use please Log-In');
      case 'operation-could-not-allowed':
        return const SignInWithEmailPasswordFailure(
            'Operation Could not allowed, please contact support');
      case 'user-disable':
        return const SignInWithEmailPasswordFailure(
            'Your account has been disabled, please cantact support');
      default:
        const SignInWithEmailPasswordFailure();
    }
    return const SignInWithEmailPasswordFailure();
  }
}

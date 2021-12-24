extension CheckString on String? {
  bool isNullOrEmpty() {
    return (this ?? '').isEmpty;
  }
}

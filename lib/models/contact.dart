class Contact {
  final String name;
  final int? accountNumber;

  Contact(this.name, this.accountNumber);

  String toString() {
    return 'Contact{name: $name, accountNumber: $accountNumber}';
  }
}

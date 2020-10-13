class Memory {
  String _value = '0';

  String get value => _value;

  void applyCommand(String command) {
    // if (this._value == '0') {
    //   this._value = command;
    // }
    if (command == 'AC') {
      _allClear();
    } else {
      this._value += command;
    }
  }

  _allClear() {
    this._value = '0';
  }
}

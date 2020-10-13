class Memory {
  static const operations = ['+/-', '%', '/', 'x', '-', '+', '='];

  final _buffer = [0.0, 0.0];
  int _bufferIndex = 0;
  String operation;
  String _value = '0';
  bool _wipeValue = true;

  String get value => _value;

  void applyCommand(String command) {
    if (command == 'AC') {
      _allClear();
    } else if (operations.contains(command)) {
      _setOperation(command);
    } else {
      _addDigit(command);
    }
  }

  _addDigit(String digit) {
    var isZero = _value == '0';
    var isDot = digit == '.';
    var hasDot = isDot && this._value.contains('.') && !this._wipeValue;
    var canWipeData = _wipeValue || (isZero && !isDot);
    final emptyValue = isDot ? '0' : '';
    if (hasDot) return;

    final currentValue = (canWipeData) ? emptyValue : _value;
    _value = currentValue + digit;
    _wipeValue = false;

    _buffer[_bufferIndex] = double.tryParse(_value) ?? 0;
    print(_buffer[_bufferIndex]);
  }

  _allClear() {
    //_wipeValue = true;
    return this._value = '0';
  }

  _setOperation(String command) {
    _wipeValue = true;
  }
}

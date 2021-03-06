class Memory {
  static const operations = ['+/-', '%', '/', 'x', '-', '+', '='];

  final _buffer = [0.0, 0.0];
  int _bufferIndex = 0;
  String _operation;
  String _value = '0';
  bool _wipeValue = true;
  String _lastCommand;

  applyCommand(String command) {
    if (_isReplacingOperantion(command)) {
      _operation = command;
      return;
    }

    if (command == 'AC' || this._value == 'NaN') {
      _allClear();
    } else if (operations.contains(command)) {
      _setOperation(command);
    } else {
      _addDigit(command);
    }
    _lastCommand = command;
  }

  _addDigit(String digit) {
    var isZero = _value == '0';
    var isDot = digit == '.';
    var hasDot = isDot && this._value.contains('.') && !this._wipeValue;
    var wipeInitialData = _wipeValue || (isZero && !isDot);

    final emptyValue = isDot ? '0' : '';
    if (hasDot) return;

    final currentValue = (wipeInitialData) ? emptyValue : _value;
    _value = currentValue + digit;
    _wipeValue = false;

    _buffer[_bufferIndex] = double.tryParse(_value) ?? 0;
  }

  _setOperation(String newOperation) {
    bool isInvertSign = newOperation == '+/-';
    bool isEqualSign = newOperation == '=';
    if (isInvertSign) {
      _invertValue();
      _turnIntoInteger();
      return;
    } else if (_bufferIndex == 0) {
      _operation = newOperation;
      _bufferIndex = 1;
      _wipeValue = true;
    } else {
      _buffer[0] = calculate();
      _buffer[1] = 0.0;
      this._value = _buffer[0].toString();
    }

    _turnIntoInteger();
    _operation = isEqualSign ? null : newOperation;
    _bufferIndex = isEqualSign ? 0 : 1;

    _wipeValue = !isEqualSign;
  }

  double calculate() {
    switch (_operation) {
      case '%':
        return _buffer[0] % _buffer[1];
      case '/':
        return _buffer[0] / _buffer[1];
      case 'x':
        return _buffer[0] * _buffer[1];
      case '-':
        return _buffer[0] - _buffer[1];
      case '+':
        return _buffer[0] + _buffer[1];
      default:
        return _buffer[0];
    }
  }

  String get value => _value;

  _turnIntoInteger() {
    this._value =
        _value.endsWith('.0') ? this._value.split('.')[0] : this._value;
  }

  _invertValue() {
    _buffer[_bufferIndex] = double.tryParse(this._value) * -1;
    this._value = (_buffer[_bufferIndex]).toString();
  }

  _allClear() {
    _buffer.setAll(0, [0.0, 0.0]);
    _bufferIndex = 0;
    _operation = null;
    return this._value = '0';
  }

  _isReplacingOperantion(String command) {
    return _lastCommand != '=' &&
        _lastCommand != '+/-' &&
        command != '=' &&
        command != '+/-' &&
        operations.contains(_lastCommand) &&
        operations.contains(command);
  }
}

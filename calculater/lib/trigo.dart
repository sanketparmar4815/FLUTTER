import 'dart:math';

class Calculator {
  RegExp _validExp;
  RegExp _math;
  Map _operators;

  Calculator() {
    // RegEx to check if mathematical expression is valid
    _validExp = new RegExp(
      r"^([\+\-]?\(*\d+(\.\d+)*[\)\!?\%]*)([\+\-\*\/\^]\(*\d+(\.\d+)*[\)\!?\%]*)*$",
    );

    // RegEx to identify advanced maths operations
    _math = new RegExp(r"(sin|cos|tan|log|ln|inv|sqrt)\(");

    _operators = {
      '+': 0,
      '-': 0,
      '*': 1,
      '/': 1,
      '^': 2,
    };
  }

  bool _isNumeric(String number) {
    return number != null && double.parse(number, (e) => null) != null;
  }

  double _factorial(double num) {
    if (num == 0 || num == 1) return 1.0;
    double result = 1;
    for (var i = 2; i <= num; i++) result *= i;
    return result;
  }

  double _evaluate(List<String> exp) {
    List<double> operands = [];
    List<String> operators = [];
    List<String> braces = [];
    String subExp = '';
    double result = 0;
    double number = 0;
    double number1 = 0;
    String char = '';
    String op = '';
    int decimal = 1;
    while (exp.isNotEmpty) {
      char = exp.removeAt(0);
      if (_isNumeric(char)) {
        number1 = double.parse(char);
        if (decimal > 1) {
          number1 /= decimal;
          decimal *= 10;
          number += number1;
        } else
          number = number * 10 + number1;
        if (exp.isEmpty) operands.add(number);
      } else if (char == '.') {
        decimal = 10;
      } else if (char == '(') {
        subExp = '';
        braces.add(char);
        while (braces.isNotEmpty && exp.isNotEmpty) {
          char = exp.removeAt(0);
          if (char == '(')
            braces.add(char);
          else if (char == ')') braces.removeLast();
          subExp += char;
        }
        subExp = subExp.substring(0, subExp.length - 1);
        number = _evaluate(subExp.split(""));
        if (exp.isEmpty) operands.add(number);
      } else if (char == '!') {
        number = _factorial(number);
        if (exp.isEmpty) operands.add(number);
      } else if (char == '%') {
        number /= 100;
        double temp = 0;
        if (operands.isNotEmpty) {
          int opt = operators.length - 1;
          int opr = operands.length - 1;
          number1 = operands[opr--];
          while (opr > -1 && opt > -1) {
            switch (operators[opt--]) {
              case '+':
                temp = operands[opr--];
                number1 += temp;
                break;
              case '-':
                temp = operands[opr--];
                number1 = temp - number1;
                break;
              case '*':
                temp = operands[opr--];
                number1 *= temp;
                break;
              case '/':
                temp = operands[opr--];
                number1 = temp / number1;
                break;
              default:
                break;
            }
          }
          number = number1 * number;
        }
        if (exp.isEmpty) operands.add(number);
      } else {
        operands.add(number);
        op = operators.isNotEmpty ? operators.last : null;
        if (op == null || _operators[char] > _operators[op]) {
          operators.add(char);
        } else {
          op = operators.removeLast();
          while (_operators[char] <= _operators[op]) {
            switch (op) {
              case '+':
                number1 = operands.removeLast();
                number = operands.removeLast();
                operands.add(number + number1);
                break;
              case '-':
                number1 = operands.removeLast();
                number = operands.removeLast();
                operands.add(number - number1);
                break;
              case '*':
                number1 = operands.removeLast();
                number = operands.removeLast();
                operands.add(number * number1);
                break;
              case '/':
                number1 = operands.removeLast();
                number = operands.removeLast();
                operands.add(number / number1);
                break;
              case '^':
                number1 = operands.removeLast();
                number = operands.removeLast();
                operands.add(pow(number, number1));
                break;
            }
            if (operators.isEmpty) break;
            op = operators.removeLast();
          }
          operators.add(char);
        }
        number = 0;
        decimal = 1;
      }
    }
    while (operators.isNotEmpty) {
      op = operators.removeLast();
      switch (op) {
        case '+':
          number1 = operands.removeLast();
          number = operands.removeLast();
          operands.add(number + number1);
          break;
        case '-':
          number1 = operands.removeLast();
          number = operands.removeLast();
          operands.add(number - number1);
          break;
        case '*':
          number1 = operands.removeLast();
          number = operands.removeLast();
          operands.add(number * number1);
          break;
        case '/':
          number1 = operands.removeLast();
          number = operands.removeLast();
          operands.add(number / number1);
          break;
        case '^':
          number1 = operands.removeLast();
          number = operands.removeLast();
          operands.add(pow(number, number1));
          break;
      }
    }
    while (operands.isNotEmpty) result += operands.removeLast();
    return result;
  }

  String _solveMath(String exp) {
    List<String> braces = [];
    String expr;
    String char;
    String subExp;
    double partResult;
    Map<String, String> solutions = {};
    Iterable<RegExpMatch> matches = _math.allMatches(exp);
    int i;
    if (matches.length == 0) return exp;
    matches.forEach((match) {
      expr = exp.substring(match.start, match.end);
      braces.add('(');
      i = match.end;
      while (braces.isNotEmpty && i < exp.length) {
        char = exp[i++];
        if (char == '(')
          braces.add(char);
        else if (char == ')') braces.removeLast();
        expr += char;
      }
      switch (expr.substring(0, 2)) {
        case "si":
          if (expr[expr.length - 1] == ')')
            subExp = expr.substring(4, expr.length - 1);
          else
            subExp = expr.substring(4, expr.length);
          partResult = _solveExp(subExp);
          partResult = sin(partResult * (pi / 180));
          break;
        case "co":
          if (expr[expr.length - 1] == ')')
            subExp = expr.substring(4, expr.length - 1);
          else
            subExp = expr.substring(4, expr.length);
          partResult = _solveExp(subExp);
          partResult = cos(partResult * (pi / 180));
          break;
        case "ta":
          if (expr[expr.length - 1] == ')')
            subExp = expr.substring(4, expr.length - 1);
          else
            subExp = expr.substring(4, expr.length);
          partResult = _solveExp(subExp);
          partResult = tan(partResult * (pi / 180));
          break;
        case "lo":
          if (expr[expr.length - 1] == ')')
            subExp = expr.substring(4, expr.length - 1);
          else
            subExp = expr.substring(4, expr.length);
          partResult = _solveExp(subExp);
          partResult = log(partResult) * log10e;
          break;
        case "ln":
          if (expr[expr.length - 1] == ')')
            subExp = expr.substring(3, expr.length - 1);
          else
            subExp = expr.substring(3, expr.length);
          partResult = _solveExp(subExp);
          partResult = log(partResult);
          break;
        case "in":
          if (expr[expr.length - 1] == ')')
            subExp = expr.substring(4, expr.length - 1);
          else
            subExp = expr.substring(4, expr.length);
          partResult = _solveExp(subExp);
          partResult = 1 / partResult;
          break;
        case "sq":
          if (expr[expr.length - 1] == ')')
            subExp = expr.substring(5, expr.length - 1);
          else
            subExp = expr.substring(5, expr.length);
          partResult = _solveExp(subExp);
          if (partResult < 0) return null;
          partResult = sqrt(partResult);
          break;
      }
      solutions[expr] = partResult.toString();
    });
    solutions.forEach((key, value) {
      exp = exp.replaceAll(key, value);
    });
    return exp;
  }

  double _solveExp(String exp) {
    exp = _solveMath(exp);
    if (exp == null) return null;
    if (!_validExp.hasMatch(exp)) return null;
    return _evaluate(exp.split(""));
  }

  String solve(String exp) {
    exp = exp.replaceAll(new RegExp(r'x'), '*');
    exp = exp.replaceAll(new RegExp(r'÷'), '/');
    exp = exp.replaceAll(new RegExp(r'e'), e.toString());
    exp = exp.replaceAll(new RegExp(r'π'), pi.toString());
    if (exp.allMatches('(').length != exp.allMatches(')').length) return null;
    double result = _solveExp(exp);
    if (result == null) return null;
    return result.toStringAsPrecision(5);
  }
}
import 'package:flutter/material.dart';

class CaculatorScreen extends StatefulWidget {
  const CaculatorScreen({
    super.key,
  });

  @override
  State<CaculatorScreen> createState() => _CaculatorScreenState();
}

class _CaculatorScreenState extends State<CaculatorScreen> {
  final ValueNotifier<String> _resultText = ValueNotifier("");
  String _actionText = "";
  bool _isNewCalculator = true;
  // List<String> listMulDiv = [];
  double valueCurrent = 0;
  String firstNumber = "";
  String secondNumber = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              children: [
                SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "RAD",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      Icon(Icons.more_vert_outlined),
                    ],
                  ),
                ),
              ],
            ),
            ValueListenableBuilder(
              valueListenable: _resultText,
              builder: (BuildContext context, String value, Widget? child) {
                return Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: const BoxDecoration(
                      border:
                          Border(right: BorderSide(color: Color(0xff41CDE1)))),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      value,
                      style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff41CDE1)),
                    ),
                  ),
                );
              },
            ),
            Table(
              children: [
                TableRow(children: [
                  ItemCaculatorWidget(
                    hasColor: true,
                    isIcon: false,
                    text: "C",
                    onPressed: (p0) {
                      handleCalculate(p0);
                    },
                  ),
                  ItemCaculatorWidget(
                    hasColor: true,
                    isIcon: false,
                    text: "%",
                    onPressed: (p0) {
                      handleCalculate(p0);
                    },
                  ),
                  ItemCaculatorWidget(
                    // hasColor: true,
                    isIcon: true,
                    widget: const Icon(Icons.delete, color: Color(0xff41CDE1)),
                    text: "",
                    onPressed: (p0) {
                      handleCalculate(p0, isClear: true);
                    },
                  ),
                  ItemCaculatorWidget(
                    hasColor: true,
                    isIcon: false,
                    text: "+",
                    onPressed: (p0) {
                      handleCalculate(p0);
                    },
                  ),
                ]),
                TableRow(children: [
                  ItemCaculatorWidget(
                    isIcon: false,
                    text: "7",
                    onPressed: (p0) {
                      handleCalculate(p0);
                    },
                  ),
                  ItemCaculatorWidget(
                    isIcon: false,
                    text: "8",
                    onPressed: (p0) {
                      handleCalculate(p0);
                    },
                  ),
                  ItemCaculatorWidget(
                    isIcon: false,
                    text: "9",
                    onPressed: (p0) {
                      handleCalculate(p0);
                    },
                  ),
                  ItemCaculatorWidget(
                    hasColor: true,
                    isIcon: false,
                    text: "-",
                    onPressed: (p0) {
                      handleCalculate(p0);
                    },
                  ),
                ]),
                TableRow(children: [
                  ItemCaculatorWidget(
                    isIcon: false,
                    text: "4",
                    onPressed: (p0) {
                      handleCalculate(p0);
                    },
                  ),
                  ItemCaculatorWidget(
                    isIcon: false,
                    text: "5",
                    onPressed: (p0) {
                      handleCalculate(p0);
                    },
                  ),
                  ItemCaculatorWidget(
                    isIcon: false,
                    text: "6",
                    onPressed: (p0) {
                      handleCalculate(p0);
                    },
                  ),
                  ItemCaculatorWidget(
                    hasColor: true,
                    isIcon: false,
                    text: "x",
                    onPressed: (p0) {
                      handleCalculate(p0);
                    },
                  ),
                ]),
                TableRow(children: [
                  ItemCaculatorWidget(
                    isIcon: false,
                    text: "1",
                    onPressed: (p0) {
                      handleCalculate(p0);
                    },
                  ),
                  ItemCaculatorWidget(
                    isIcon: false,
                    text: "2",
                    onPressed: (p0) {
                      handleCalculate(p0);
                    },
                  ),
                  ItemCaculatorWidget(
                    isIcon: false,
                    text: "3",
                    onPressed: (p0) {
                      handleCalculate(p0);
                    },
                  ),
                  ItemCaculatorWidget(
                    hasColor: true,
                    isIcon: false,
                    text: ":",
                    onPressed: (p0) {
                      handleCalculate(p0);
                    },
                  ),
                ]),
                TableRow(children: [
                  ItemCaculatorWidget(
                    // hasColor: true,
                    isIcon: true,
                    widget: const Icon(
                      Icons.copy_outlined,
                      color: Color(0xff41CDE1),
                    ),
                    onPressed: (p0) {
                      handleCalculate(p0);
                    },
                  ),
                  ItemCaculatorWidget(
                    isIcon: false,
                    text: "0",
                    onPressed: (p0) {
                      handleCalculate(p0);
                    },
                  ),
                  ItemCaculatorWidget(
                    isIcon: false,
                    text: ".",
                    onPressed: (p0) {
                      handleCalculate(p0);
                    },
                  ),
                  ItemCaculatorWidget(
                    hasColor: true,
                    isIcon: false,
                    text: "=",
                    hasBackground: true,
                    onPressed: (p0) {
                      handleCalculate(p0);
                    },
                  ),
                ])
              ],
            )
          ],
        ));
  }

  handleCalculate(String text, {bool isClear = false}) {
    if (isClear) {
      _resultText.value = "";

      _isNewCalculator = true;
      return;
    }
    switch (text) {
      case "0":
      case "1":
      case "2":
      case "3":
      case "4":
      case "5":
      case "6":
      case "7":
      case "8":
      case "9":
        if (_isNewCalculator) {
          _resultText.value = text;
          _isNewCalculator = false;
        } else {
          _resultText.value += text;
        }

        break;
      case "C":
        if (_isNewCalculator) {
          return;
        }
        if (_resultText.value.isNotEmpty) {
          _resultText.value =
              _resultText.value.substring(0, _resultText.value.length - 1);
        }
      case "+":
      case "-":
      case "x":
      case ":":
        if (_isNewCalculator) {
          return;
        }
        firstNumber = _resultText.value;
        _resultText.value += text;

        _actionText = text;
        break;
      case "=":
        if (_isNewCalculator) {
          return;
        }
        if (_actionText.isNotEmpty) {
          String currentNumber = "";
          double currentValue = 0;
          String actionCurrret = "";
          double valueMulDi = 1;
          String actionMulDi = "";

          for (int i = 0; i < _resultText.value.length; i++) {
            if (_resultText.value[i] != "+" &&
                _resultText.value[i] != "-" &&
                _resultText.value[i] != "x" &&
                _resultText.value[i] != ":") {
              currentNumber += _resultText.value[i];

              if (i != _resultText.value.length - 1) {
                if (_resultText.value[i + 1] == "x" ||
                    _resultText.value[i + 1] == ":") {
                  if (actionMulDi.isNotEmpty) {
                    if (actionMulDi == "x") {
                      valueMulDi *= int.parse(currentNumber);
                    } else {
                      valueMulDi = valueMulDi * -1 / int.parse(currentNumber);
                    }
                  } else {
                    valueMulDi = double.parse(currentNumber);
                  }
                } else if (_resultText.value[i + 1] == "+" ||
                    _resultText.value[i + 1] == "-") {
                  if (actionMulDi.isNotEmpty) {
                    if (actionMulDi == "x") {
                      valueMulDi *= int.parse(currentNumber);
                    } else if (actionMulDi == ":") {
                      valueMulDi /= int.parse(currentNumber);
                    }
                    if (actionCurrret == "+") {
                      currentValue += valueMulDi;
                    } else if (actionCurrret == "-") {
                      currentValue -= valueMulDi;
                    } else {
                      currentValue += valueMulDi;
                    }
                    actionMulDi = "";
                    valueMulDi = 1;
                  } else {
                    if (actionCurrret == "+") {
                      currentValue += int.parse(currentNumber);
                    } else if (actionCurrret == "-") {
                      currentValue -= int.parse(currentNumber);
                    } else if (actionCurrret == "") {
                      currentValue += int.parse(currentNumber);
                    }
                  }
                }
              } else {
                if (actionMulDi.isNotEmpty) {
                  if (actionMulDi == "x") {
                    valueMulDi *= int.parse(currentNumber);
                  } else {
                    valueMulDi /= double.parse(currentNumber);
                  }
                  if (actionCurrret == "+") {
                    currentValue += valueMulDi;
                  } else if (actionCurrret == "-") {
                    currentValue -= valueMulDi;
                  } else {
                    currentValue += valueMulDi;
                  }
                } else {
                  if (actionCurrret == "+") {
                    currentValue += int.parse(currentNumber);
                  } else if (actionCurrret == "-") {
                    currentValue -= int.parse(currentNumber);
                  } else if (actionCurrret == "") {
                    currentValue += int.parse(currentNumber);
                  }
                }
              }
            }
            if (_resultText.value[i] == "+" || _resultText.value[i] == "-") {
              actionCurrret = _resultText.value[i];
              currentNumber = "";
            } else if (_resultText.value[i] == "x" ||
                _resultText.value[i] == ":") {
              actionMulDi = _resultText.value[i];
              currentNumber = "";
            }
          }
          print(currentValue);
          if (currentValue.toInt() == currentValue) {
            _resultText.value = currentValue.toInt().toString();
          } else {
            _resultText.value = currentValue.toString();
          }

          resetData();
        }
    }
  }

  void resetData() {
    // _isNewCalculator = true;
  }
}

class ItemCaculatorWidget extends StatelessWidget {
  const ItemCaculatorWidget({
    super.key,
    required this.isIcon,
    this.widget,
    this.text,
    this.hasColor = false,
    this.hasBackground = false,
    this.onPressed,
  });
  final bool isIcon;
  final Widget? widget;
  final String? text;
  final bool hasColor;
  final bool hasBackground;
  final Function(String)? onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (text != null && onPressed != null) {
          onPressed!(text!);
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        height: 100,
        decoration: BoxDecoration(
            color: hasBackground ? const Color(0xff41CDE1) : null,
            border: Border.all(color: const Color(0xffE7E7E7))),
        child: Center(
          child: isIcon
              ? widget
              : Text(
                  text ?? "",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: hasBackground
                          ? Colors.white
                          : hasColor
                              ? const Color(0xff41CDE1)
                              : null),
                ),
        ),
      ),
    );
  }
}

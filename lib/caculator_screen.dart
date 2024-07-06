import 'package:flutter/foundation.dart';
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
  bool _isNewCalculator = true;
  // List<String> listMulDiv = [];
  String currentNumber = "";
  double currentValue = 0;
  String actionPlusMinus = "";
  double valueMulDi = 1;
  String actionMulDi = "";

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
        checkIsNewCalculator();
        if (_resultText.value.isNotEmpty) {
          _resultText.value =
              _resultText.value.substring(0, _resultText.value.length - 1);
        }
      case "+":
      case "-":
      case "x":
      case ":":
        checkIsNewCalculator();
        _resultText.value += text;
        break;
      case "=":
        checkIsNewCalculator();
        for (int i = 0; i < _resultText.value.length; i++) {
          if (checkIsNumber(i)) {
            updateCurrentNumber(i);

            if (checkIndexisLast(i)) {
              if (checkNextIsMulDiAction(i)) {
                if (checkHasMultiDiBefore()) {
                  handleMulDi();
                } else {
                  updateMulDiCurrentValue();
                }
              } else if (checkNextIsPlusMinus(i)) {
                if (checkHasMultiDiBefore()) {
                  handleMulDi();

                  updateCurrentValue();
                  resetCurrentMulDiValue();
                } else {
                  handlePlusMinus();
                }
              }
            } else {
              if (checkHasMultiDiBefore()) {
                handleMulDi();
                updateCurrentValue();
              } else {
                handlePlusMinus();
              }
            }
          }
          if (checkCurrentIsPlusMinus(i)) {
            resetCurrentUpdateActionPlusMinus(i);
          } else if (checkCurrentIsMulDi(i)) {
            resetCurrentUpdateActionMulDi(i);
          }
        }
        updateIfIsInt();

        if (kDebugMode) {
          print(currentValue);
        }

        resetData();
    }
  }

  void checkIsNewCalculator() {
    if (_isNewCalculator) {
      return;
    }
  }

  void updateIfIsInt() {
    if (currentValue.toInt() == currentValue) {
      _resultText.value = currentValue.toInt().toString();
    } else {
      _resultText.value = currentValue.toString();
    }
  }

  void resetCurrentUpdateActionMulDi(int i) {
    actionMulDi = _resultText.value[i];
    currentNumber = "";
  }

  void resetCurrentUpdateActionPlusMinus(int i) {
    actionPlusMinus = _resultText.value[i];
    currentNumber = "";
  }

  void handlePlusMinus() {
    if (actionPlusMinus == "+") {
      currentValue += int.parse(currentNumber);
    } else if (actionPlusMinus == "-") {
      currentValue -= int.parse(currentNumber);
    } else if (actionPlusMinus == "") {
      currentValue += int.parse(currentNumber);
    }
  }

  void resetCurrentMulDiValue() {
    actionMulDi = "";
    valueMulDi = 1;
  }

  void updateCurrentValue() {
    if (actionPlusMinus == "+") {
      currentValue += valueMulDi;
    } else if (actionPlusMinus == "-") {
      currentValue -= valueMulDi;
    } else {
      currentValue += valueMulDi;
    }
  }

  void handleMulDi() {
    if (actionMulDi == "x") {
      valueMulDi *= int.parse(currentNumber);
    } else if (actionMulDi == ":") {
      valueMulDi /= int.parse(currentNumber);
    }
  }

  void updateMulDiCurrentValue() {
    valueMulDi = double.parse(currentNumber);
  }

  void updateCurrentNumber(int i) {
    currentNumber += _resultText.value[i];
  }

  void resetData() {
    currentValue = 0;
    actionPlusMinus = "";
    valueMulDi = 1;
    actionMulDi = "";
    _isNewCalculator = true;
    currentNumber = "";
    // _resultText.value = "";
  }

  bool checkCurrentIsMulDi(int i) {
    return _resultText.value[i] == "x" || _resultText.value[i] == ":";
  }

  bool checkCurrentIsPlusMinus(int i) {
    return _resultText.value[i] == "+" || _resultText.value[i] == "-";
  }

  bool checkNextIsPlusMinus(int i) {
    return _resultText.value[i + 1] == "+" || _resultText.value[i + 1] == "-";
  }

  bool checkHasMultiDiBefore() {
    return actionMulDi.isNotEmpty;
  }

  bool checkNextIsMulDiAction(int i) {
    return _resultText.value[i + 1] == "x" || _resultText.value[i + 1] == ":";
  }

  bool checkIndexisLast(int i) {
    return i != _resultText.value.length - 1;
  }

  bool checkIsNumber(int i) {
    return _resultText.value[i] != "+" &&
        _resultText.value[i] != "-" &&
        _resultText.value[i] != "x" &&
        _resultText.value[i] != ":";
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

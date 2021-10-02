import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

enum PinButtonType { number, icon }

class PinEnterScreen extends StatefulWidget {
  const PinEnterScreen({Key? key}) : super(key: key);

  @override
  _PinEnterScreenState createState() => _PinEnterScreenState();
}

class _PinEnterScreenState extends State<PinEnterScreen> {
  String userInput = '';
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Apps PIN Enter"),
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.blueAccent,
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text(
                    userInput,
                    style: const TextStyle(
                      fontSize: 50,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: PinCodeTextField(
                      controller: _controller,
                      appContext: context,
                      keyboardType: TextInputType.none,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(6),
                      ],
                      autoDisposeControllers: true,
                      length: 6,
                      obscureText: true,
                      showCursor: false,
                      obscuringWidget: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.circle,
                        fieldHeight: 20,
                        inactiveColor: Colors.white,
                        inactiveFillColor: Colors.white,
                        selectedFillColor: Colors.white,
                        activeColor: Colors.white,
                        selectedColor: Colors.white,
                      ),
                      onChanged: (value) {
                        debugPrint(value);
                      },
                      onCompleted: (value) {
                        if (value == '123456') Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 12,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 20,
              mainAxisSpacing: 8,
            ),
            itemBuilder: (context, index) => buildButton(
              context: context,
              index: index,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  /// This Function Botton PIN. return [buttonPin]
  /// [index] is the position of the number
  /// [color] The color to use when painting the text.

  Widget buildButton({
    required BuildContext context,
    required int index,
    final Color? color,
  }) {
    final _index = index + 1;

    switch (_index) {
      case 10:
        return buttonPin(
          index: _index,
          onTap: () {
            debugPrint("Finger Print");
          },
          pinButtonType: PinButtonType.icon,
          icon: Icon(
            Icons.fingerprint,
            size: 32,
            color: color ?? Colors.black,
          ),
          color: color,
        );
      case 11:
        return buttonPin(
          index: _index,
          number: 0,
          color: color,
          onTap: (_controller.text.length < 6)
              ? () {
                  setState(() {
                    _controller.text += "0";
                  });
                }
              : () {},
        );
      case 12:
        return buttonPin(
          index: _index,
          onTap: () {
            setState(() {
              _controller.text = _controller.text.substring(
                0,
                (_controller.text.isEmpty) ? 0 : _controller.text.length - 1,
              );
            });
          },
          pinButtonType: PinButtonType.icon,
          icon: Icon(
            Icons.backspace_outlined,
            color: color ?? Colors.black,
          ),
          color: color,
        );
      default:
        return buttonPin(
          index: _index,
          onTap: (_controller.text.length < 6)
              ? () {
                  setState(() {
                    _controller.text += _index.toString();
                  });
                }
              : () {},
          color: color,
        );
    }
  }

  /// this function is used to create pin button [icons] or [numbers] button
  /// [index] is the position of the number
  /// [onTap] Signature of callbacks that have no arguments and return no data
  /// [pinButtonType] to define as icon or number
  /// [numer] index value default
  /// [icon] enter shape icon
  /// [color] The color to use when painting the text.

  Widget buttonPin({
    required final int index,
    final VoidCallback? onTap,
    final PinButtonType? pinButtonType = PinButtonType.number,
    final int? number,
    final Icon? icon,
    final Color? color = Colors.black,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(100),
      child: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: (pinButtonType == PinButtonType.number)
            ? Text(
                '${number ?? index}',
                style: TextStyle(
                  fontSize: 24,
                  color: color,
                ),
              )
            : icon,
      ),
    );
  }
}

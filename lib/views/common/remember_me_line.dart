import 'package:flutter/material.dart';

class RememberMeLine extends StatelessWidget {
  final bool isRemembered;
  final String text;
  final void Function(bool?) onChanged;
  const RememberMeLine(
      {super.key,
      required this.isRemembered,
      required this.onChanged,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        StatefulBuilder(builder: (context, setState) {
          return SizedBox(
            height: 24.0,
            width: 24.0,
            child: Checkbox.adaptive(
                // materialTapTargetSize:
                //     MaterialTapTargetSize.shrinkWrap,
                value: isRemembered,
                onChanged: onChanged),
          );
        }),
        const Text("  Remember me",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            )),
        const Spacer(),
        InkWell(
          onTap: () {
            debugPrint("$text Tapped");
          },
          child: Text(text,
              style: const TextStyle(
                decorationColor: Colors.blue,
                decorationThickness: 1.5,
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.bold,
              )),
        ),
      ],
    );
  }
}

import 'package:chess_academy/theme/adabtableFontSize.dart';
import 'package:flutter/material.dart';

class MenuItem extends StatefulWidget {
  const MenuItem({Key? key, required this.text, required this.onTap})
      : super(key: key);

  final String text;
  final VoidCallback onTap;

  @override
  _MenuItemState createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  double menuWidth = 0;

  @override
  Widget build(BuildContext context) {
    Size size = (TextPainter(
            text: TextSpan(
                text: widget.text,
                style: FlexTextStyle.getStyle(context).bodyText2!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground)),
            maxLines: 1,
            textScaleFactor: MediaQuery.of(context).textScaleFactor,
            textDirection: TextDirection.ltr)
          ..layout())
        .size;

    return MouseRegion(
      onEnter: (onEnter) => setState(() => menuWidth = size.width),
      onExit: (onExit) => setState(() => menuWidth = 0),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            InkWell(
                onTap: widget.onTap,
                child: Text(
                  widget.text,
                  style: FlexTextStyle.getStyle(context).bodyText2!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                )),
            AnimatedContainer(
                curve: Curves.easeOut,
                color: Theme.of(context).colorScheme.onBackground,
                height: 2,
                width: menuWidth,
                duration: const Duration(milliseconds: 300))
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidget extends StatefulWidget {
  const TextWidget({
    Key? key,
    required this.text,
    required this.color,
    required this.textSize,
    this.isTitle = false,
    this.maxLines = 2,
    this.fontWeight = FontWeight.normal,
    this.letterSpacing = 0.1,
    this.showMoreText,
    this.showMoreTextColor = Colors.blue,
  }) : super(key: key);

  final String text;
  final Color color;
  final double textSize;
  final bool isTitle;
  final int maxLines;
  final FontWeight fontWeight;
  final double letterSpacing;
  final String? showMoreText;
  final Color showMoreTextColor;

  @override
  _TextWidgetState createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> {
  bool _showFullText = false;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = GoogleFonts.raleway(
      color: widget.color,
      fontSize: widget.textSize,
      fontWeight: widget.isTitle ? FontWeight.bold : widget.fontWeight,
      letterSpacing: widget.letterSpacing,
    );

    final textSpan = TextSpan(
      text: widget.text,
      style: textStyle,
    );

    final textWidget = RichText(
      text: textSpan,
      maxLines: _showFullText ? null : widget.maxLines,
      overflow: _showFullText ? TextOverflow.clip : TextOverflow.ellipsis,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        textWidget,
        if (widget.showMoreText != null &&
            widget.text.length >= widget.maxLines)
          InkWell(
            onTap: () {
              setState(() {
                _showFullText = !_showFullText;
              });
            },
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                _showFullText ? "Show less" : widget.showMoreText!,
                style: GoogleFonts.raleway(
                  fontSize: 13.5,
                  color: widget.showMoreTextColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

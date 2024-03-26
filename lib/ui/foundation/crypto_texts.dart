import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CryptoTexts {

  CryptoTexts._();

  static Text smallText(
    String txt,
    {Color? color, FontWeight? fontWeight}
  ) => Text(
    txt,
    style: GoogleFonts.notoSansKhmer(
      fontWeight: fontWeight,
      color: color,
      fontSize: 10
    )
  );

  static Text mediumText(
    String txt,
    {Color? color, FontWeight? fontWeight}
  ) => Text(
    txt,
    style: GoogleFonts.notoSansKhmer(
      fontWeight: fontWeight,
      color: color,
      fontSize: 15
    )
  );

  static Text largeText(
    String txt,
    {Color? color, FontWeight? fontWeight, Key? key}
  ) => Text(
    key: key,
    txt,
    style: GoogleFonts.notoSansKhmer(
      fontWeight: fontWeight,
      color: color,
      fontSize: 21,
    )
  );

  static Text largeHeading(
    String txt,
    {Color? color, FontWeight? fontWeight}
  ) => Text(
    txt,
    style: GoogleFonts.notoSansKhmer(
      fontWeight: fontWeight,
      color: color,
      fontSize: 25,
    )
  );

}
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final kFontTextStyle20 = GoogleFonts.oxygen(
  fontSize: 20,
  fontWeight: FontWeight.w400,
  color: Colors.white,
);

final kFontTextStyle30 = GoogleFonts.oxygen(
  fontSize: 30,
  fontWeight: FontWeight.w400,
  color: Colors.white,
);

final kLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

final kHintTextStyle = TextStyle(
  color: Colors.white54,
  fontFamily: 'OpenSans',
);

final kBoxDecorationStyle = BoxDecoration(
  color: Color(0xFF6CA8F1),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);

final kBoxDecorationStyleDark = BoxDecoration(
  //color: Color(0xFF6CA8F1),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);

final kBoxDecorationStyleLight = BoxDecoration(
  color: Color(0xFF6CA8F1),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);

final kBoxDecorationStyleBackgroundLight = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF73AEF5),
      Color(0xFF61A4F1),
      Color(0xFF478DE0),
      Color(0xFF398AE5),
    ],
    stops: [0.1, 0.4, 0.7, 0.9],
  ),
);

final kBoxDecorationStyleBackgroundDark = BoxDecoration(
    //gradient: LinearGradient(
    //  begin: Alignment.topCenter,
    //  end: Alignment.bottomCenter,
    //colors: [
    //  Color(0xFF73AEF5),
    //  Color(0xFF61A4F1),
    //  Color(0xFF478DE0),
    //  Color(0xFF398AE5),
    //],
    //  stops: [0.1, 0.4, 0.7, 0.9],
    //),
    );

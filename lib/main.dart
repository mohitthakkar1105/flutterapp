// note : -> widget are basic building blocks of flutter app , they are used to create UI

import 'package:flutter/material.dart';
import './currency_converter_materialApp.dart';
// import './page/Currency_Converter_materialApp.dart';-->relative import bolte isko

void main() {
  runApp(
    const MyApp(),
  ); //flutter hamesha main function me void main ko dhund ke run hota hai(simply app ko run karta hai)
}

// types of widget
// 1. Stateless widget-> jab humein pata ho ki widget ka state kabhi change nahi hoga tab hum stateless widget ka use karte hain.
// 2. Stateful widget-> jab humein pata ho ki widget ka state change hoga tab hum stateful widget ka use karte hain.

// 🔹 const ka matlab kya hai?

// const ka matlab hai: ye widget immutable hai aur compile-time pe hi fix ho jaye.

// Matlab jab tu const constructor use karega, Flutter ko pata hai ki is widget ke andar kuch change nahi hoga → isliye Flutter isko rebuild karne ki zarurat nahi samjhega.

// Result: performance better ⚡ (less rebuilds).

// material app--->navigation, theming, localization ke liye use hota hai
// 1. MaterialApp

// Ye Google Material Design follow karta hai (jo Android apps me hota hai).

// Isme saare Android-style widgets milte hain (Button, AppBar, Drawer, FAB, Snackbar, etc.).

// Design thoda modern + flat style ka hota hai.
// cupertino app--->iOS style widgets ke liye use hota hai
// 2. CupertinoApp

// Ye Apple iOS design (Cupertino style) follow karta hai.

// Isme iOS look & feel wale widgets milte hain (CupertinoButton, CupertinoNavigationBar, CupertinoTabBar, etc.).

// Design thoda rounded + iOS feel wala hota hai.

// scaffold
// 🔹 Scaffold kya hai?

// 👉 Ek skeleton (ढांचा) jisme tumhe saare basic parts mil jaate hain ek proper screen banane ke liye.
// Soch le bina Scaffold ke tumhe manually layout banana padta, jo kaafi mushkil hota.

// Scaffold me tumhe milta hai:
// AppBar (top bar)
// Drawer (side menu)
// BottomNavigationBar (niche navigation bar)
// FloatingActionButton (FAB)
// Body (main content area)
// Snackbars, BottomSheets, etc.
// Ye saare cheezein tumhe ekdum ready mil jaati hain Scaffold ke andar, jisse tum apne app ka UI easily bana sakte ho.

// Widget tree:>
// MaterialApp -> Scaffold -> Body -> Center -> Text

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    // to render the widget on screen
    //-->buildContext is a handle to the location of a widget in the widget tree.
    return const MaterialApp(home: CurrencyConverterr());
  }
}

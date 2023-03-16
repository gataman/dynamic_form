import 'package:dynamic_form/form_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _getTheme(),
      home: const Scaffold(
        body: FormView(),
      ),
    );
  }

  ThemeData _getTheme() => ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(5),
              ),
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8)),
        ),
        expansionTileTheme: ExpansionTileThemeData(
          collapsedShape: _border,
        ),
        inputDecorationTheme: InputDecorationTheme(border: _border),
        dropdownMenuTheme: DropdownMenuThemeData(
          inputDecorationTheme: InputDecorationTheme(border: _border),
        ),
      );

  OutlineInputBorder get _border => OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black),
        borderRadius: BorderRadius.circular(5),
      );
}

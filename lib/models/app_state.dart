import 'package:flutter/material.dart';

final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.light);
bool isSellerMode = false;
final List<Map<String, dynamic>> cartItems = [];

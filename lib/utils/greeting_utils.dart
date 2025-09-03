import 'package:flutter/material.dart';
import '../generated/l10n.dart';

class GreetingUtils {
  static String getGreeting(BuildContext context) {
    final hour = DateTime.now().hour;
    if (hour >= 5 && hour < 12) {
      return S.of(context).goodMorning;
    } else if (hour >= 12 && hour < 17) {
      return S.of(context).goodAfternoon;
    } else if (hour >= 17 && hour < 22) {
      return S.of(context).goodEvening;
    } else {
      return S.of(context).goodNight;
    }
  }

  static String getGreetingMessage(BuildContext context) {
    final hour = DateTime.now().hour;
    if (hour >= 5 && hour < 12) {
      return S.of(context).morningMessage;
    } else if (hour >= 12 && hour < 17) {
      return S.of(context).afternoonMessage;
    } else if (hour >= 17 && hour < 22) {
      return S.of(context).eveningMessage;
    } else {
      return S.of(context).nightMessage;
    }
  }

  static IconData getGreetingIcon() {
    final hour = DateTime.now().hour;
    if (hour >= 5 && hour < 12) {
      return Icons.wb_sunny; // Ранок
    } else if (hour >= 12 && hour < 17) {
      return Icons.wb_sunny_outlined; // День
    } else if (hour >= 17 && hour < 22) {
      return Icons.wb_twilight; // Вечір
    } else {
      return Icons.nightlight; // Ніч
    }
  }
}

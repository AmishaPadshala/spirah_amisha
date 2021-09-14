import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';


Color appColor = Colors.transparent;
NumberFormat currencyFormat = NumberFormat.compactSimpleCurrency(
    locale: Get.locale.toString(), name: "INR", decimalDigits: 0);
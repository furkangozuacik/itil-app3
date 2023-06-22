import 'package:flutter/material.dart';
import 'package:app/consts/colors.dart';

Widget loadingIndicator() {
  return const CircularProgressIndicator(
    valueColor: AlwaysStoppedAnimation(redColor),
  );
}

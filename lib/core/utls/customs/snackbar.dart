import 'package:flutter/material.dart';

void show_snackbar({required BuildContext context, required String content})
{
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(content)));
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Fonction qui renvoie le Widget App Bar
/// [Params] : context, titre
Widget displayAppBar(BuildContext context, String title) {
  return AppBar(
    title: Text(title),
  );
}

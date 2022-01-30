import 'package:flutter/material.dart';

Widget _width() => const SizedBox(width: 5);

Widget  _expandedX(context) => Expanded(
    child: Container(height: 2.5, color: Theme.of(context).primaryColor));

Widget homeDivider(context) => Row(
      children: [
        _expandedX(context),
        _width(),
        _expandedX(context),
        _width(),
        _expandedX(context),
        _width(),
        _expandedX(context),
        _width(),
        _expandedX(context),
        _width(),
        _expandedX(context),
        _width(),
        _expandedX(context),
        _width(),
        _expandedX(context),
        _width(),
        _expandedX(context),
        _width(),
        _expandedX(context),

      ],
    );

import 'package:flutter/material.dart';

class KYEmptyScreeen extends StatelessWidget {
  static const String routeName = '/empty';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Empty'),
      ),
    );
  }
}

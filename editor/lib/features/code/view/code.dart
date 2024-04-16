import 'package:editor/app/theme/theme.dart';
import 'package:flutter/material.dart';

class CodePageBuilder extends StatelessWidget {
  const CodePageBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CodePage();
  }
}

class CodePage extends StatelessWidget {
  const CodePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: allPadding8,
      child: Card(
        child: Container(),
      ),
    );
  }
}

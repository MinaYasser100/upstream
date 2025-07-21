import 'package:flutter/material.dart';
import 'package:upstream/features/hymns/ui/widgets/hymns_body_view.dart';

class HymnsView extends StatelessWidget {
  const HymnsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: HymnsBodyView());
  }
}

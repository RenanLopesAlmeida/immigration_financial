import 'package:flutter/material.dart';

import '../../ui/asset_path.dart';
import '../../ui/ui.dart';

part './components/no_financial_plans.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard', style: _textTheme.caption),
        centerTitle: true,
        elevation: 0,
      ),
      body: _NoFinancialPlan(),
    );
  }
}

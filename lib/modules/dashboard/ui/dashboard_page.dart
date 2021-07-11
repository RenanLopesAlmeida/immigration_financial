import 'package:flutter/material.dart';
import 'package:immigration_financial/core/domain/domain.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _user = Provider.of<User?>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard', style: Theme.of(context).textTheme.caption),
        centerTitle: true,
        elevation: 0,
      ),
    );
  }
}

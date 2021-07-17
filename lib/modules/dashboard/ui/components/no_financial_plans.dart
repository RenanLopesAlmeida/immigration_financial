part of '../dashboard_page.dart';

class _NoFinancialPlan extends StatelessWidget {
  const _NoFinancialPlan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    final _colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Spacing.normal,
      ),
      child: Column(
        children: [
          Spacer(),
          Container(
            margin: EdgeInsets.only(bottom: Spacing.small),
            child: Text(
              'Oops! Looks like you haven\'t set up your financial planning yet!',
              textAlign: TextAlign.center,
              style: _textTheme.headline4?.copyWith(
                color: _colorScheme.onSecondary.withOpacity(0.85),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Center(
            child: Container(
              height: 200,
              width: 200,
              child: Opacity(
                opacity: 0.8,
                child: Image.asset(AssetPath.personalFinanceIllustration),
              ),
            ),
          ),
          Spacer(),
          PrimaryButton(text: 'Start Planning', onPressed: () {})
        ],
      ),
    );
  }
}

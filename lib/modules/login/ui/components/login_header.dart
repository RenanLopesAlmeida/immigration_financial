part of '../login_page.dart';

class _LoginHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 32,
          child: Text(
            'Hello,',
            style: _textTheme.headline1,
            textAlign: TextAlign.start,
          ),
        ),
        Container(
          height: 32,
          child: Text(
            'Access your Account',
            style: _textTheme.headline1,
            textAlign: TextAlign.start,
          ),
        ),
        Container(
          height: 20,
          margin: EdgeInsets.only(top: Spacing.xlarge),
          child: Row(
            children: [
              Text(
                'New here?',
                style: _textTheme.subtitle2,
                textAlign: TextAlign.start,
              ),
              Container(
                margin: EdgeInsets.only(left: Spacing.small),
                child: Text(
                  'Create your Account',
                  style: _textTheme.subtitle1,
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

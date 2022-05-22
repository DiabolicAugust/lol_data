import 'package:flutter/cupertino.dart';

class HistoryScreenWidget extends StatefulWidget {
  const HistoryScreenWidget({Key? key}) : super(key: key);

  @override
  _HistoryScreenWidgetState createState() => _HistoryScreenWidgetState();
}

class _HistoryScreenWidgetState extends State<HistoryScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        duration: Duration(seconds: 5),
        child: Text('Meow'),
      ),
    );
  }
}

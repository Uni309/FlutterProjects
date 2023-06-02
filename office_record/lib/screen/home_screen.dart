import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDate = DateTime(
    2022,
    08,
    24,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xF9FFFFFF),
        body: SafeArea(
          bottom: false,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                _TopPart(
                  selectedDate: selectedDate,
                  onPressed: onFacePressed,
                ),
                const _BottomPart(),
              ],
            ),
          ),
        ));
  }

  void onFacePressed() {
    DateTime now = DateTime.now();
    //dialog
    showCupertinoDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.white,
              height: 300,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                initialDateTime: selectedDate,
                maximumDate: DateTime(
                  now.year,
                  now.month,
                  now.day,
                ),
                onDateTimeChanged: (DateTime date) {
                  setState(() {
                    selectedDate = date;
                  });
                },
              ),
            ),
          );
        });
  }
}

class _TopPart extends StatelessWidget {
  final DateTime selectedDate;
  final VoidCallback onPressed;

  const _TopPart({
    required this.selectedDate,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final now = DateTime.now();
    final textTheme = theme.textTheme;

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('Office', style: textTheme.displayMedium),
          Column(
            children: [
              Text(
                '처음 출근한 날',
                style: textTheme.displaySmall,
              ),
              Text(
                '${selectedDate.year}.${selectedDate.month}.${selectedDate.day}',
                style: textTheme.bodyMedium,
              ),
            ],
          ),
          IconButton(
            iconSize: 60,
            onPressed: onPressed,
            icon: const Icon(
              Icons.face,
              color: Colors.black,
            ),
          ),
          Text(
            'D+${DateTime(
                  now.year,
                  now.month,
                  now.day,
                ).difference(selectedDate).inDays + 1}',
            style: textTheme.bodySmall,
          )
        ],
      ),
    );
  }
}

class _BottomPart extends StatelessWidget {
  const _BottomPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Image.asset('asset/img/회사.png'));
  }
}

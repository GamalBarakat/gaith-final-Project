import 'package:flutter/material.dart';

class CustomDialogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Dialog Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: Text('عنوان الحوار'),
                content: Text('محتوى الحوار'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('إغلاق'),
                  ),
                ],
              ),
            );
          },
          child: Text('عرض الحوار'),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class SubmissionDialog extends StatelessWidget {
  final GlobalKey<FormBuilderState> formKey;

  const SubmissionDialog({
    super.key,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: const Icon(
        Icons.check_circle,
        color: Colors.green,
      ),
      title: const Text('Submission Completed'),
      content: Text(formKey.currentState?.value.toString() ?? ''),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Close'),
        ),
      ],
    );
  }
}

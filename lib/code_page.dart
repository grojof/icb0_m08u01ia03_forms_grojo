import 'package:flutter/material.dart';
import 'package:icb0_m08u01ia03_forms_grojo/sources/complete_form.dart';
import 'package:icb0_m08u01ia03_forms_grojo/sources/conditional_fields.dart';
import 'package:icb0_m08u01ia03_forms_grojo/sources/custom_fields.dart';
import 'package:icb0_m08u01ia03_forms_grojo/sources/dynamic_fields.dart';
import 'package:icb0_m08u01ia03_forms_grojo/sources/related_fields.dart';
import 'package:icb0_m08u01ia03_forms_grojo/sources/signup_form.dart';
import 'package:icb0_m08u01ia03_forms_grojo/widgets/main_scaffold.dart';

class CodePage extends StatelessWidget {
  final String title;
  final Widget child;

  const CodePage({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      title: title,
      body: child,
    );
  }
}

class CodeListPage extends StatelessWidget {
  const CodeListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      title: 'Flutter Form Builder',
      body: ListView(
        children: const [
          CodeListTile(
            title: 'Complete Form',
            destination: CodePage(
              title: 'Complete Form',
              child: CompleteForm(),
            ),
          ),
          Divider(),
          CodeListTile(
            title: 'Custom Fields',
            destination: CodePage(
              title: 'Custom Fields',
              child: CustomFields(),
            ),
          ),
          Divider(),
          CodeListTile(
            title: 'Signup Form',
            destination: CodePage(
              title: 'Signup Form',
              child: SignupForm(),
            ),
          ),
          Divider(),
          CodeListTile(
            title: 'Dynamic Form',
            destination: CodePage(
              title: 'Dynamic Form',
              child: DynamicFields(),
            ),
          ),
          Divider(),
          CodeListTile(
            title: 'Conditional Form',
            destination: CodePage(
              title: 'Conditional Form',
              child: ConditionalFields(),
            ),
          ),
          Divider(),
          CodeListTile(
            title: 'Related Fields',
            destination: CodePage(
              title: 'Related Fields',
              child: RelatedFields(),
            ),
          ),
        ],
      ),
    );
  }
}

class CodeListTile extends StatelessWidget {
  final String title;
  final Widget destination;

  const CodeListTile({
    super.key,
    required this.title,
    required this.destination,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: const Icon(Icons.arrow_right_sharp),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => destination),
        );
      },
    );
  }
}

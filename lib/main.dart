import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:icb0_m08u01ia03_forms_grojo/views/form_a_view.dart';
import 'package:icb0_m08u01ia03_forms_grojo/widgets/main_scaffold.dart';
import 'code_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter FormBuilder Demo',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        FormBuilderLocalizations.delegate,
        ...GlobalMaterialLocalizations.delegates,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: FormBuilderLocalizations.supportedLocales,
      home: _HomePage(),
    );
  }
}

class _HomePage extends StatelessWidget {
  const _HomePage();

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      title: 'Salesians Sarrià 24/25 GRojo',
      body: ListView(
        children: <Widget>[
          // Exemples inicials formularis
          ListTile(
            title: const Text('Form Builder Examples'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const CodeListPage()),
              );
            },
          ),
          // Form A
          ListTile(
            title: const Text('Form A'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => MainScaffold(
                    title: 'Form A',
                    body: FormAView(),
                  ),
                ),
              );
            },
          ),
          // Form B
          ListTile(
            title: const Text('Form B'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const MainScaffold(
                    title: 'Form B',
                    body: SizedBox(), // Reemplaza con el contenido de Form B
                  ),
                ),
              );
            },
          ),
          // Form C
          ListTile(
            title: const Text('Form C'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const MainScaffold(
                    title: 'Form C',
                    body: SizedBox(), // Reemplaza con el contenido de Form C
                  ),
                ),
              );
            },
          ),
          // Form D
          ListTile(
            title: const Text('Form D'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const MainScaffold(
                    title: 'Form D',
                    body: SizedBox(), // Reemplaza con el contenido de Form D
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

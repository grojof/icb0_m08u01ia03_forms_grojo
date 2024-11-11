import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:icb0_m08u01ia03_forms_grojo/widgets/widgets.dart';

class FormCView extends StatelessWidget {
  FormCView({super.key});
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState?.saveAndValidate() ?? false) {
            showDialog(
              context: context,
              builder: (context) => SubmissionDialog(formKey: _formKey),
            );
          }
        },
        child: const Icon(Icons.upload),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FormBuilder(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Choice Chips
                FormBuilderChoiceChip<String>(
                  name: 'choice_chip',
                  decoration: const InputDecoration(
                    labelText: 'Choice Chips',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                  ),
                  // Chip Styles
                  alignment: WrapAlignment.center,
                  spacing: 30,
                  runSpacing: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: const Color(0xFF01579B),
                  selectedColor: const Color(0xFF01579B).withOpacity(0.8),
                  labelStyle: const TextStyle(color: Colors.white),
                  // Chips
                  options: const [
                    FormBuilderChipOption(
                      avatar: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: FlutterLogo(size: 20),
                      ),
                      value: 'Flutter',
                      child: Text('Flutter'),
                    ),
                    FormBuilderChipOption(
                      avatar: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: Icon(
                          Icons.android,
                          color: Colors.green,
                          size: 20,
                        ),
                      ),
                      value: 'Android',
                      child: Text('Android'),
                    ),
                    FormBuilderChipOption(
                      avatar: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: Icon(
                          Icons.phone_iphone,
                          color: Colors.yellow,
                          size: 20,
                        ),
                      ),
                      value: 'Chrome OS',
                      child: Text('Chrome OS'),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Switch
                FormBuilderSwitch(
                  name: 'switch',
                  title: const Text('This is a switch'),
                  decoration: const InputDecoration(
                    labelText: 'Switch',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Text Field with validation
                FormBuilderTextField(
                  name: 'text_field',
                  decoration: const InputDecoration(
                    labelText: 'Text Field',
                    prefixIcon: Icon(Icons.text_format),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                  ),
                  maxLength: 15,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.maxLength(15),
                    FormBuilderValidators.minLength(15),
                  ]),
                ),

                const SizedBox(height: 16),

                // Dropdown Field
                FormBuilderDropdown<String>(
                  name: 'dropdown',
                  decoration: const InputDecoration(
                    labelText: 'Dropdown Field',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                  ),
                  items: const [
                    DropdownMenuItem(value: 'Finland', child: Text('Finland')),
                    DropdownMenuItem(value: 'Spain', child: Text('Spain')),
                    DropdownMenuItem(
                        value: 'United Kingdom', child: Text('United Kingdom')),
                  ],
                ),

                const SizedBox(height: 16),

                // Radio Group
                FormBuilderRadioGroup<String>(
                  name: 'radio_group',
                  decoration: const InputDecoration(
                    labelText: 'Radio Group Model',
                    border: OutlineInputBorder(),
                  ),
                  orientation: OptionsOrientation.vertical,
                  options: const [
                    FormBuilderFieldOption(
                        value: 'Option 1', child: Text('Option 1')),
                    FormBuilderFieldOption(
                        value: 'Option 2', child: Text('Option 2')),
                    FormBuilderFieldOption(
                        value: 'Option 3', child: Text('Option 3')),
                    FormBuilderFieldOption(
                        value: 'Option 4', child: Text('Option 4')),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

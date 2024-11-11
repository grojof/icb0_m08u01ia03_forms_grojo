import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:icb0_m08u01ia03_forms_grojo/constants.dart';
import 'package:icb0_m08u01ia03_forms_grojo/widgets/widgets.dart';

class FormDView extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();

  FormDView({super.key});

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
                // Autocomplete
                Autocomplete<String>(
                  optionsBuilder: (TextEditingValue textEditingValue) {
                    if (textEditingValue.text.isEmpty) {
                      return const Iterable<String>.empty();
                    }
                    return kCountryList.where((country) => country
                        .toLowerCase()
                        .contains(textEditingValue.text.toLowerCase()));
                  },
                  fieldViewBuilder: (context, textEditingController, focusNode,
                      onFieldSubmitted) {
                    return TextFormField(
                      controller: textEditingController,
                      focusNode: focusNode,
                      decoration: const InputDecoration(
                        labelText: 'Autocomplete',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),

                // Date Picker
                FormBuilderDateTimePicker(
                  name: 'date_picker',
                  inputType: InputType.date,
                  decoration: const InputDecoration(
                    labelText: 'Date Picker',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                ),
                const SizedBox(height: 16),

                // Date Range Picker
                FormBuilderDateRangePicker(
                  firstDate: DateTime(DateTime.now().year - 1),
                  lastDate: DateTime(DateTime.now().year + 1),
                  name: 'date_range',
                  decoration: const InputDecoration(
                    labelText: 'Date Range',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    suffixIcon: Icon(Icons.close),
                  ),
                ),
                const SizedBox(height: 16),

                // Time Picker
                FormBuilderDateTimePicker(
                  name: 'time_picker',
                  inputType: InputType.time,
                  decoration: const InputDecoration(
                    labelText: 'Time Picker',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    suffixIcon: Icon(Icons.access_time),
                  ),
                ),
                const SizedBox(height: 16),

                // Input Chips (Filter Chips)
                FormBuilderFilterChip<String>(
                  name: 'filter_chip',
                  decoration: const InputDecoration(
                    labelText: 'Input Chips (Filter Chip)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                  ),
                  // Chip Styles
                  alignment: WrapAlignment.center,
                  spacing: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: const Color(0xFF01579B),
                  selectedColor: const Color(0xFF01579B).withOpacity(0.8),
                  labelStyle: const TextStyle(color: Colors.white),
                  // Chips
                  options: const [
                    FormBuilderChipOption(value: 'HTML', child: Text('HTML')),
                    FormBuilderChipOption(value: 'CSS', child: Text('CSS')),
                    FormBuilderChipOption(value: 'React', child: Text('React')),
                    FormBuilderChipOption(value: 'Dart', child: Text('Dart')),
                    FormBuilderChipOption(
                        value: 'TypeScript', child: Text('TypeScript')),
                    FormBuilderChipOption(
                        value: 'Angular', child: Text('Angular')),
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

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:icb0_m08u01ia03_forms_grojo/widgets/widgets.dart';

class FormAView extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();

  FormAView({super.key});

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
              children: [
                const Text(
                  "Driving Form",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Text(
                  "Form example",
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),

                //! Speed Radio Group
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Please provide the speed of vehicle?',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Text(
                      'Please select one option given below',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    FormBuilderRadioGroup<String>(
                      name: 'vehicle_speed',
                      orientation: OptionsOrientation.vertical,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      options: const [
                        FormBuilderFieldOption(
                          value: 'above_40',
                          child: Text(
                            'Above 40 km/h',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        FormBuilderFieldOption(
                          value: 'below_40',
                          child: Text(
                            'Below 40 km/h',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        FormBuilderFieldOption(
                          value: '0',
                          child: Text('0 km/h', style: TextStyle(fontSize: 16)),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                //! Remarks TextField
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Enter remarks',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    FormBuilderTextField(
                      name: 'remarks',
                      decoration: const InputDecoration(
                        hintText: 'Enter your remarks',
                        hintStyle: TextStyle(fontSize: 16),
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                //! High Speed Dropdown
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Please provide the high speed of vehicle?',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Text(
                      'Please select one option given below',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    FormBuilderDropdown<String>(
                      name: 'high_speed',
                      decoration: const InputDecoration(
                        labelText: 'Select option',
                        labelStyle: TextStyle(
                          fontSize: 16,
                        ),
                        floatingLabelAlignment: FloatingLabelAlignment.start,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                      ),
                      items: const [
                        DropdownMenuItem(
                          value: 'hight',
                          child: Text(
                            'Hight',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        DropdownMenuItem(
                          value: 'medium',
                          child: Text(
                            'Medium',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        DropdownMenuItem(
                          value: 'low',
                          child: Text(
                            'Low',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                //! Speed Past Hour Checkbox Group
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Please provide the speed of vehicle past 1 hour?',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Text(
                      'Please select one or more options given below',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    FormBuilderCheckboxGroup<String>(
                      name: 'speed_past_hour',
                      orientation: OptionsOrientation.vertical,
                      options: const [
                        FormBuilderFieldOption(
                          value: '20',
                          child: Text(
                            '20 km/h',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        FormBuilderFieldOption(
                          value: '30',
                          child: Text(
                            '30 km/h',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        FormBuilderFieldOption(
                          value: '40',
                          child: Text(
                            '40km/h',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        FormBuilderFieldOption(
                          value: '50',
                          child: Text(
                            '50 km/h',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
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

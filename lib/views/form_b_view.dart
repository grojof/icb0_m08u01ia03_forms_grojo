import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:icb0_m08u01ia03_forms_grojo/widgets/widgets.dart';

class FormBView extends StatefulWidget {
  const FormBView({super.key});

  @override
  State<FormBView> createState() => _FormBViewState();
}

class _FormBViewState extends State<FormBView> {
  final _formKey = GlobalKey<FormBuilderState>();
  int _currentStep = 0;
  bool _isStepperFinished = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          //! Stepper configuration
          child: Stepper(
            type: StepperType.horizontal,
            currentStep: _currentStep,
            onStepTapped: (int step) {
              setState(() {
                _currentStep = step;
                _isStepperFinished = false;
              });
            },
            onStepContinue: () {
              if (_currentStep < 2) {
                setState(() {
                  _currentStep += 1;
                });
              } else {
                setState(() {
                  _isStepperFinished = true;
                });
              }
            },
            onStepCancel: () {
              if (_currentStep > 0) {
                setState(() {
                  _currentStep -= 1;
                  _isStepperFinished = false;
                });
              }
            },
            //! Steps
            steps: [
              //! Step 1
              Step(
                title: const Text("Personal"),
                content: const Column(
                  children: [
                    Text(
                      'Personal',
                      style: TextStyle(fontSize: 40),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Pulsi "Contact" o pulsi el botó de "Continue".',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                isActive: _currentStep >= 0,
                state:
                    _currentStep > 0 ? StepState.complete : StepState.indexed,
              ),
              //! Step 2
              Step(
                title: const Text("Contact"),
                content: const Column(
                  children: [
                    Text(
                      'Contact',
                      style: TextStyle(fontSize: 40),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Pulsi "Upload" o pulsi el botó de "Continue".',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                // State of the step
                isActive: _currentStep >= 1,
                state:
                    _currentStep > 1 ? StepState.complete : StepState.indexed,
              ),
              //! Step 3
              Step(
                title: const Text("Upload"),
                content: FormBuilder(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      FormBuilderTextField(
                        name: 'email',
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: const TextStyle(color: Color(0xFF82B1FF)),
                          prefixIcon: const Icon(Icons.email),
                          prefixIconColor: const Color(0xFF82B1FF),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Color(0xFF82B1FF),
                              width: 1,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Color(0xFF82B1FF),
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      FormBuilderTextField(
                        name: 'address',
                        maxLines: 6,
                        decoration: InputDecoration(
                          labelText: 'Address',
                          labelStyle: const TextStyle(color: Color(0xFF82B1FF)),
                          prefixIcon: const Icon(Icons.home),
                          prefixIconColor: const Color(0xFF82B1FF),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Color(0xFF82B1FF),
                              width: 1,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Color(0xFF82B1FF),
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      FormBuilderTextField(
                        name: 'mobile',
                        decoration: InputDecoration(
                          labelText: 'Mobile No',
                          labelStyle: const TextStyle(color: Color(0xFF82B1FF)),
                          prefixIcon: const Icon(Icons.phone),
                          prefixIconColor: const Color(0xFF82B1FF),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Color(0xFF82B1FF),
                              width: 1,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Color(0xFF82B1FF),
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                isActive: _currentStep >= 2,
                state:
                    _currentStep == 2 ? StepState.indexed : StepState.complete,
              ),
            ],
            //! Controls
            controlsBuilder: (BuildContext context, ControlsDetails controls) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FilledButton(
                      onPressed: () {
                        controls.onStepContinue!();
                        if (_isStepperFinished &&
                            (_formKey.currentState?.saveAndValidate() ??
                                false)) {
                          showDialog(
                            context: context,
                            builder: (context) =>
                                SubmissionDialog(formKey: _formKey),
                          );
                        }
                      },
                      child: const Text('CONTINUE'),
                    ),
                    TextButton(
                      onPressed: controls.onStepCancel,
                      child: const Text('CANCEL'),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

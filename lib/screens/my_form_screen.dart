import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class MyFormScreen extends StatefulWidget {
  const MyFormScreen({super.key});

  @override
  State<MyFormScreen> createState() {
    return _MyFormScreenState();
  }
}

class _MyFormScreenState extends State<MyFormScreen> {
  bool autoValidate = true;
  bool readOnly = false;
  bool showSegmentedControl = true;
  final _formKey = GlobalKey<FormBuilderState>();
  bool _nameHasError = false;
  bool _passwordHasError = false;
  void _onChanged(dynamic val)=> debugPrint(val.toString());

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                FormBuilder(
                  key: _formKey,

                  onChanged: () {
                    _formKey.currentState!.save();
                    debugPrint(_formKey.currentState!.value.toString());
                  },

                  autovalidateMode: AutovalidateMode.disabled,
                  skipDisabled: true,
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 15),
                      FormBuilderTextField(
                        autovalidateMode: AutovalidateMode.always,
                        name: 'name',
                        decoration: InputDecoration(
                          labelText: 'Name',
                          suffixIcon: _nameHasError
                              ? const Icon(Icons.error, color: Colors.red)
                              : const Icon(Icons.check, color: Colors.green),
                        ),
                        onChanged: (val) {
                          setState(() {
                            _nameHasError =
                            !(_formKey.currentState?.fields['name']?.validate() ??
                                false);
                          });
                        },
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.max(5),
                        ]),
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                      ),

                      FormBuilderTextField(
                        autovalidateMode: AutovalidateMode.always,
                        name: 'password',
                        decoration: InputDecoration(
                          labelText: 'Password',
                          suffixIcon: _passwordHasError
                              ? const Icon(Icons.error, color: Colors.red)
                              : const Icon(Icons.check, color: Colors.green),
                        ),
                        onChanged: (val) {
                          setState(() {
                            _passwordHasError =
                            !(_formKey.currentState?.fields['password']?.validate() ??
                                false);
                          });
                        },
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                        ]),
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                      ),

                      FormBuilderTextField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        name: 'email',
                        decoration: InputDecoration(
                          labelText: 'Email',
                        ),
                        onChanged: (val) {
                          setState(() {
                          });
                        },
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.email(),
                          FormBuilderValidators.required(),
                        ]),
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                      ),
                      FormBuilderCheckbox(
                        name: 'accept_terms',
                        initialValue: false,
                        onChanged: _onChanged,
                        title: RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: 'I have read and agree to the ',
                                style: TextStyle(color: Colors.black),
                              ),
                              TextSpan(
                                text: 'Terms and Conditions',
                                style: TextStyle(color: Colors.blue),
                              ),
                            ],
                          ),
                        ),
                        validator: FormBuilderValidators.equal(
                          true,
                          errorText:
                          'You must accept terms and conditions to continue',
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState?.saveAndValidate() ?? false) {
                            debugPrint(_formKey.currentState?.value.toString());
                          } else {
                            debugPrint(_formKey.currentState?.value.toString());
                            debugPrint('validation failed');
                          }
                        },
                        child: const Text(
                          'Submit',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          _formKey.currentState?.reset();
                        },
                        // color: Theme.of(context).colorScheme.secondary,
                        child: Text(
                          'Reset',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
        ),
      ),

    );
  }
}
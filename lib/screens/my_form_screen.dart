// import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypt/crypt.dart';
import 'package:test_2/screens/widgets_screen.dart';

import '../database/cloud_firestore_service.dart';


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
  // bool _nameHasError = false;
  // bool _passwordHasError = false;
  // bool _emailHasError = false;
  void _onChanged(dynamic val) => debugPrint(val.toString());

  CloudFirestoreService? service;

  @override
  void initState() {
    service = CloudFirestoreService(FirebaseFirestore.instance);
    super.initState();
  }

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
                  // debugPrint(_formKey.currentState!.value.toString());
                },
                skipDisabled: true,
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 15),
                    FormBuilderTextField(
                      name: 'name',
                      decoration: const InputDecoration(
                        labelText: 'Name',
                        // suffixIcon: _nameHasError
                        //     ? const Icon(Icons.error, color: Colors.red)
                        //     : const Icon(Icons.check, color: Colors.green),
                      ),
                      // onChanged: (val) {
                      //   setState(() {
                      //     _nameHasError = !(_formKey
                      //             .currentState?.fields['name']
                      //             ?.validate() ??
                      //         false);
                      //   });
                      // },
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.maxLength(7),
                      ]),
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                    ),
                    FormBuilderTextField(
                      // autovalidateMode: AutovalidateMode.onUserInteraction,
                      name: 'password',
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        // suffixIcon: _passwordHasError
                        //     ? const Icon(Icons.error, color: Colors.red)
                        //     : const Icon(Icons.check, color: Colors.green),
                      ),
                      // onChanged: (val) {
                      //   setState(() {
                      //     _passwordHasError = !(_formKey
                      //                 .currentState?.fields['password']
                      //                 ?.validate() ??
                      //             false) ||
                      //         !(_formKey.currentState?.fields['confirmPassword']
                      //                 ?.validate() ??
                      //             false);
                      //   });
                      // },
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                      ]),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      textInputAction: TextInputAction.next,
                    ),
                    FormBuilderTextField(
                      name: 'confirmPassword',
                      decoration: const InputDecoration(
                        labelText: 'Confirm password',
                        // suffixIcon: _passwordHasError
                        //     ? const Icon(Icons.error, color: Colors.red)
                        //     : const Icon(Icons.check, color: Colors.green),
                      ),
                      // onChanged: (val) {
                      //   setState(() {
                      //     _passwordHasError = !(_formKey
                      //                 .currentState?.fields['password']
                      //                 ?.validate() ??
                      //             false) ||
                      //         !(_formKey.currentState?.fields['confirmPassword']
                      //                 ?.validate() ??
                      //             false);
                      //   });
                      // },
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        (value) {
                          if (value !=
                              _formKey
                                  .currentState?.fields['password']?.value) {
                            return 'Las contraseñas no coinciden';
                          }
                          return null;
                        },
                      ]),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      textInputAction: TextInputAction.next,
                    ),
                    FormBuilderTextField(
                      name: 'email',
                      decoration: const InputDecoration(
                        labelText: 'Email',
                      ),
                      // onChanged: (val) {
                      //   setState(() {
                      //     _emailHasError = !(_formKey.currentState?.fields['email']?.validate() ?? false);
                      //   });
                      // },
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.email(),
                        FormBuilderValidators.required(),
                      ]),
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
                          Map<String, dynamic> user = _formKey.currentState?.value ?? {};
                          Map<String, dynamic> filteredUser = {
                            'name': user['name'],
                            'email': user['email'],
                            'password': Crypt.sha256(user['password']).toString(), // user['password'],
                          };
                          FirebaseFirestore.instance.collection('users').add(filteredUser);
                          Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const WidgetsScreen()));
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

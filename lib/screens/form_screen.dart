import 'package:flutter/material.dart';
import 'package:test_2/models/code_page.dart';
import 'package:test_2/sources/complete_form.dart';


class FormScreen extends StatelessWidget {
  const FormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CodePage(
      title: 'Flutter Form Builder',
      child: ListView(
        children: <Widget>[
          ListTile(
            title: const Text('Complete Form'),
            trailing: const Icon(Icons.arrow_right_sharp),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const CodePage(
                      title: 'Complete Form',
                      child: CompleteForm(),
                    );
                  },
                ),
              );
            },
          ),
          const Divider(),
          // ListTile(
          //   title: const Text('Custom Fields'),
          //   trailing: const Icon(Icons.arrow_right_sharp),
          //   onTap: () {
          //     Navigator.of(context).push(
          //       MaterialPageRoute(
          //         builder: (context) {
          //           return const CodePage(
          //             title: 'Custom Fields',
          //             child: CustomFields(),
          //           );
          //         },
          //       ),
          //     );
          //   },
          // ),
          // const Divider(),
          // ListTile(
          //   title: const Text('Signup Form'),
          //   trailing: const Icon(Icons.arrow_right_sharp),
          //   onTap: () {
          //     Navigator.of(context).push(
          //       MaterialPageRoute(
          //         builder: (context) {
          //           return const CodePage(
          //             title: 'Signup Form',
          //             child: SignupForm(),
          //           );
          //         },
          //       ),
          //     );
          //   },
          // ),
          // const Divider(),
          // ListTile(
          //   title: const Text('Dynamic Form'),
          //   trailing: const Icon(Icons.arrow_right_sharp),
          //   onTap: () {
          //     Navigator.of(context).push(
          //       MaterialPageRoute(
          //         builder: (context) {
          //           return const CodePage(
          //             title: 'Dynamic Form',
          //             child: DynamicFields(),
          //           );
          //         },
          //       ),
          //     );
          //   },
          // ),
          // const Divider(),
          // ListTile(
          //   title: const Text('Conditional Form'),
          //   trailing: const Icon(Icons.arrow_right_sharp),
          //   onTap: () {
          //     Navigator.of(context).push(
          //       MaterialPageRoute(
          //         builder: (context) {
          //           return const CodePage(
          //             title: 'Conditional Form',
          //             child: ConditionalFields(),
          //           );
          //         },
          //       ),
          //     );
          //   },
          // ),
          // const Divider(),
          // ListTile(
          //   title: const Text('Related Fields'),
          //   trailing: const Icon(Icons.arrow_right_sharp),
          //   onTap: () {
          //     Navigator.of(context).push(
          //       MaterialPageRoute(
          //         builder: (context) {
          //           return const CodePage(
          //             title: 'Related Fields',
          //             child: RelatedFields(),
          //           );
          //         },
          //       ),
          //     );
          //   },
          // ),
          // const Divider(),
          // ListTile(
          //   title: const Text('Radio Checkbox itemDecorator'),
          //   trailing: const Icon(Icons.arrow_right_sharp),
          //   onTap: () {
          //     Navigator.of(context).push(
          //       MaterialPageRoute(
          //         builder: (context) {
          //           return const CodePage(
          //             title: 'ItemDecorators',
          //             child: DecoratedRadioCheckbox(),
          //           );
          //         },
          //       ),
          //     );
          //   },
          // ),
          // const Divider(),
          // ListTile(
          //   title: const Text('GroupedRadio and GroupedCheckbox Orientation'),
          //   trailing: const Icon(Icons.arrow_right_sharp),
          //   onTap: () {
          //     Navigator.of(context).push(
          //       MaterialPageRoute(
          //         builder: (context) {
          //           return const CodePage(
          //             title: 'GroupedRadio and GroupedCheckbox',
          //             child: GroupedRadioCheckbox(),
          //           );
          //         },
          //       ),
          //     );
          //   },
          // ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:time_work/utils/global.colors.dart';
import 'package:time_work/widgets/button.global.dart';
import 'package:time_work/widgets/text.form.global.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final TextEditingController barcodeController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            color: GlobalColors.lightColor,
            width: double.infinity,
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Image.asset(
                  'vienna_logo.webp',
                  width: 150,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Login',
                  style: TextStyle(
                    color: GlobalColors.darkColor,
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Login to yout account',
                  style: TextStyle(
                    color: GlobalColors.primaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormGlobal(
                  controller: barcodeController,
                  text: 'Barcode',
                  textInputType: TextInputType.text,
                  obscure: false,
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormGlobal(
                  controller: passwordController,
                  text: 'Password',
                  textInputType: TextInputType.visiblePassword,
                  obscure: true,
                ),
                const SizedBox(
                  height: 10,
                ),
                const ButtonGlobal(),
                const SizedBox(
                  height: 25,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class BarcodeLoginPage extends StatefulWidget {
//   @override
//   _BarcodeLoginPageState createState() => _BarcodeLoginPageState();
// }

// class _BarcodeLoginPageState extends State<BarcodeLoginPage> {
//   final _formKey = GlobalKey<FormState>();
//   final _barcodeController = TextEditingController();
//   final _nameController = TextEditingController();

//   Future<bool> _login(String barcode, String name) async {
//     final url = Uri.parse('/web/login/barcode');
//     final headers = {
//       'Content-Type': 'application/json',
//     };
//     final body = json.encode({'barcode': barcode, 'name': name});
//     final response = await http.post(url, headers: headers, body: body);
//     return response.statusCode == 200;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Barcode Login'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               TextFormField(
//                 controller: _barcodeController,
//                 decoration: InputDecoration(
//                   labelText: 'Barcode',
//                 ),
//                 validator: (value) {
//                   if (value.isEmpty) {
//                     return 'Please enter your barcode';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: _nameController,
//                 decoration: InputDecoration(
//                   labelText: 'Name',
//                 ),
//                 validator: (value) {
//                   if (value.isEmpty) {
//                     return 'Please enter your name';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 16.0),
//               ElevatedButton(
//                 onPressed: () async {
//                   if (_formKey.currentState.validate()) {
//                     final barcode = _barcodeController.text;
//                     final name = _nameController.text;
//                     final success = await _login(barcode, name);
//                     if (success) {
//                       Navigator.pushNamed(context, '/home');
//                     } else {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(
//                           content: Text('Invalid barcode or name'),
//                           backgroundColor: Colors.red,
//                         ),
//                       );
//                     }
//                   }
//                 },
//                 child: Text('Login'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

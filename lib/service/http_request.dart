import 'dart:convert';
import 'package:time_work/models/authResponse.model.dart';
import 'package:universal_io/io.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:io';

Future<List<AuthResponse>> authenticate() async {
  // Create the authentication URL
  final authUrl = Uri.https('vienna.odoo.com', '/web/session/authenticate');

  // Set the request headers
  final headers = {
    'Content-Type': 'application/json',
  };

  // Create the request body
  final body = json.encode({
    'jsonrpc': '2.0',
    'method': 'call',
    'params': {
      'db': 'vienna',
      'login': 'alessandro.dellanna@ixorateam.com',
      'password': '-tomishiba2020-',
    },
  });

  // Send the POST request
  http.Response authResponse = await http.post(
    authUrl,
    headers: headers,
    body: body,
  );

  // Extract the session ID from the response headers
  final sessions = json.decode(authResponse.body);
  final session = authResponse.headers.toString();
  final sessionId = session
      .split(', ')[1]
      .replaceAll('session_id=', '')
      .replaceAll('set-cookie: ', '')
      .split(';')[0];
  final statusCode = authResponse.statusCode;

  List<AuthResponse> res = [
    AuthResponse(
      sessionToken: sessionId,
      status: statusCode,
    ),
  ];

  print(res);
  // Return the session ID wrapped in a Future object
  return res;
  // http.Response(body, statusCode);
}

Future<http.Response> getEmployee(sessionId) async {
  final dataUrl = Uri.https('vienna.odoo.com', '/wev/dataset/call_kw');
  final employeeHeaders = {
    'Content.type': 'application/json',
    'Cookie': 'session_id=$sessionId',
  };
  final empBody = {
    'jsonrpc': '2.0',
    'params': {
      'model': 'hr.employee',
      'method': 'search_read',
      'args': [],
      'kwargs': {
        'context': {'binsize': true},
        'domain': [],
        'fields': ['name', 'barcode']
      },
    }
  };
  final empResponse =
      await http.post(dataUrl, headers: employeeHeaders, body: empBody);
  final employees = json.decode(empResponse.body)['result'];

  return employees;
}

// Future<http.Response> getProject(sessionId) async {
//   final dataUrl = Uri.parse('https://vienna.odoo.com/wev/dataset/call_kw');
//   final employeeHeaders = {
//     'Content.type': 'application/json',
//     'Cookie': 'session_id=$sessionId',
//   };
//   final projBody = {
//     'jsonrpc': '2.0',
//     'params': {
//       'model': 'project.project',
//       'method': 'search_read',
//       'args': [],
//       'kwargs': {
//         'context': {'binsize': false},
//         'fields': [
//           'name',
//           'x_studio_indirizzo',
//           'x_studio_latitudine',
//           'x_studio_longitudine'
//         ]
//       }
//     }
//   };
//   final projResponse =
//       await http.post(dataUrl, headers: employeeHeaders, body: projBody);
//   final projects = json.decode(projResponse.body)['result'];

//   return projects;
// }

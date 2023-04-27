import 'dart:convert';
import 'package:universal_io/io.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:io';

Future<http.BaseResponse> authenticate() async {
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
  final authResponse = await http.post(
    authUrl,
    headers: headers,
    body: body,
  );

  // Extract the session ID from the response headers
  final session = json.decode(authResponse.body)['result']['session_id'];
  final sessionId = authResponse.headers.toString();
  // ['set-cookie']
  // ?.split('; ')[0]
  // .replaceAll('session_id=', '');
  print(authResponse);
  print(session);
  print(sessionId);
  // Extract the status code from the response
  final statusCode = authResponse.statusCode;
  final responseString = authResponse.body;
  print(responseString);
  // Return the session ID wrapped in a Future object
  return authResponse;
  // http.Response(body, statusCode);
}

// Future<void> authenticate() async {
//   final client = HttpClient();
//   final url = Uri.https('vienna.odoo.com', '/web/session/authenticate');
//   final request = await client.postUrl(url);
//   request.headers.contentType = ContentType.json;
//   request.write(jsonEncode({
//     'jsonrpc': '2.0',
//     'params': {
//       'db': 'vienna',
//       'login': 'alessandro.dellanna@ixorateam.com',
//       'password': '-tomishiba2020-',
//     },
//   }));
//   if (request is BrowserHttpClientRequest) {
//     request.browserCredentialsMode = true;
//   }
//   final response = await request.close();
//   final responseBody = await response.transform(utf8.decoder).join();
//   final responseJson = jsonDecode(responseBody);
//   if (responseJson['result'] != null) {
//     final sessionId = responseJson['result']['session_id'];
//     print(sessionId);
//     // Use the sessionId to make authenticated requests to the Odoo server
//   } else {
//     // Authentication failed
//   }
// }

// Future<void> authenticate() async {
//   final client = HttpClient();
//   final url = Uri.https('vienna.odoo.com', '/web/session/authenticate');
//   final request = await client.postUrl(url);
//   request.headers.contentType = ContentType.json;
//   request.write(jsonEncode({
//     'jsonrpc': '2.0',
//     'params': {
//       'db': 'vienna',
//       'login': 'alessandro.dellanna@ixorateam.com',
//       'password': '-tomishiba2020-',
//     },
//   }));
//   if (request is BrowserHttpClientRequest) {
//     request.browserCredentialsMode = true;
//   }
//   final response = await request.close();
//   final responseBody = await response.transform(utf8.decoder).join();
//   final responseJson = jsonDecode(responseBody);
//   if (responseJson['result'] != null) {
//     final sessionId = responseJson['result']['session_id'];
//     // Use the sessionId to make authenticated requests to the Odoo server
//   } else {
//     // Authentication failed
//   }
// }


// Future<http.Response> getEmployee(sessionId) async {
//   final dataUrl = Uri.parse('https://vienna.odoo.com/wev/dataset/call_kw');
//   final employeeHeaders = {
//     'Content.type': 'application/json',
//     'Cookie': 'session_id=$sessionId',
//   };
//   final empBody = {
//     'jsonrpc': '2.0',
//     'params': {
//       'model': 'hr.employee',
//       'method': 'search_read',
//       'args': [],
//       'kwargs': {
//         'context': {'binsize': true},
//         'domain': [],
//         'fields': ['name', 'barcode']
//       },
//     }
//   };
//   final empResponse =
//       await http.post(dataUrl, headers: employeeHeaders, body: empBody);
//   final employees = json.decode(empResponse.body)['result'];

//   return employees;
// }

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

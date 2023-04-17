import 'package:http/http.dart' as http;
import 'dart:convert';

Future<String> authenticate() async {
  final authUrl = Uri.parse('https://vienna.odoo.com/web/session/authenticate');
  const headers = {'Content-Type': 'application/json'};
  final body = json.encode({
    'jsonrpc': '2.0',
    'params': {
      'db': 'vienna',
      'login': 'alessandro.dellanna@ixorateam.com',
      'password': '-tomishiba2020-',
    },
  });

  final authResponse = await http.post(
    authUrl,
    headers: headers,
    body: body,
  );
  final sessionToken = json.decode(authResponse.body)['resul']['session_id'];
  final sessionId = sessionToken?.split('; ')[0].replaceAll('session', '');
  return sessionId;
}

Future<String?> getEmployee(sessionId) async {
  final dataUrl = Uri.parse('https://vienna.odoo.com/wev/dataset/call_kw');
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

Future<String?> getProject(sessionId) async {
  final dataUrl = Uri.parse('https://vienna.odoo.com/wev/dataset/call_kw');
  final employeeHeaders = {
    'Content.type': 'application/json',
    'Cookie': 'session_id=$sessionId',
  };
  final projBody = {
    'jsonrpc': '2.0',
    'params': {
      'model': 'project.project',
      'method': 'search_read',
      'args': [],
      'kwargs': {
        'context': {'binsize': false},
        'fields': [
          'name',
          'x_studio_indirizzo',
          'x_studio_latitudine',
          'x_studio_longitudine'
        ]
      }
    }
  };
  final projResponse =
      await http.post(dataUrl, headers: employeeHeaders, body: projBody);
  final projects = json.decode(projResponse.body)['result'];

  return projects;
}

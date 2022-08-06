import 'package:http/http.dart' as http;

import 'dart:convert';

class HttpStateful {
  String id, name, job, createAt;

  HttpStateful({this.createAt, this.id, this.job, this.name});

  static Future<HttpStateful> connectAPI(String name, String job) async {
    Uri url = Uri.parse("https://reqres.in/api/users");

    var hasilResponse = await http.post(
      url,
      body: {
        "name": name,
        "job": job,
      },
    );

    var data = json.decode(hasilResponse.body);

    return HttpStateful(
      id: data["id"],
      name: data["name"],
      job: data["job"],
      createAt: data["createdAt"],
    );
  }
}

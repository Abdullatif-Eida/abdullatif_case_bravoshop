import 'dart:convert';
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

class WebsocketCubit extends Cubit<Map<String, dynamic>> {
  WebsocketCubit() : super({});

  getWebScketToken() async {
    var headers = {'Content-Type': 'application/json'};
    var request = Request('POST', Uri.parse('https://api.bravoshopgo.com/api/v1/token/'));
    request.body = json.encode({"username": "test_user", "password": "61b2szWzvrgEZ46"});
    request.headers.addAll(headers);

    StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return jsonDecode(await response.stream.bytesToString())["access"];
    } else {
      return response.reasonPhrase;
    }
  }

  void connect() async {
    try {
      String token = await getWebScketToken();
      final wsUrl = Uri.parse('wss://api.bravoshopgo.com/ws/api/v1/?token=$token');

      WebSocket ws = await WebSocket.connect(wsUrl.toString(), headers: {
        'Origin': 'https://api.bravoshopgo.com',
      });

      print('WebSocket connection established');

      ws.listen((message) {
        emit(jsonDecode(message));
      }, onError: (error) {
        print("WebSocket error: $error");
      }, onDone: () {
        print("WebSocket connection closed");
      });

      Map<String, String> data = {
        "service": "hepsiburada",
        "product_url": "https://www.hepsiburada.com/samsung-galaxy-s23-128-gb-8-gb-ram-samsung-turkiye-garantili-p-HBCV00003Z341U?magaza=Hepsiburada"
      };

      ws.add(jsonEncode(data));
    } catch (e) {
      print('Error connecting to WebSocket: $e');
    }
  }
}

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AIService {
  static Stream<String> getAIResponseStream(String userMessage) async* {
    final apiKey = dotenv.get("HUGGINGFACE_API_KEY");
    final model = "google/gemma-2-2b-it";
    final url = "https://api-inference.huggingface.co/models/$model";


    try {
      final request = http.Request("POST", Uri.parse(url))
        ..headers.addAll({
          "Authorization": "Bearer $apiKey",
          "Content-Type": "application/json"
        })
        ..body = jsonEncode({
          "inputs": userMessage,
          "parameters": {
            "max_tokens": 500
          },
          "options": {
            "stream": true
          }
        });


      final responseStream = await request.send();

      final responseChunks = responseStream.stream.transform(utf8.decoder);
      await for (var chunk in responseChunks) {
        try {
          final data = jsonDecode(chunk);

          if (data is List && data.isNotEmpty) {
            for (var item in data) {
              if (item is Map && item.containsKey("generated_text")) {
                yield item["generated_text"];
              }
            }
          } else {
            yield "Unexpected data format: $chunk";
          }
        } catch (e) {
          yield "Error parsing chunk: $chunk";
        }
      }
    } catch (e) {
      yield "Error: $e";
    }
  }
}

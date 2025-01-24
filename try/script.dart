import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  final apiKey = "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";
  final model = "google/gemma-2-2b-it";
  final url = "https://api-inference.huggingface.co/models/$model";

  final headers = {
    "Authorization": "Bearer $apiKey",
    "Content-Type": "application/json"
  };

  final body = jsonEncode({
    "inputs": "What is the capital of France?",
    "parameters": {
      "max_tokens": 500
    },
    "options": {
      "stream": true
    }
  });

  try {
    final request = http.Request("POST", Uri.parse(url))
      ..headers.addAll(headers)
      ..body = body;

    final responseStream = await request.send();

    final responseChunks = responseStream.stream.transform(utf8.decoder);
    await for (var chunk in responseChunks) {
      print(chunk);
    }
  } catch (e) {
    print("Error: $e");
  }
}

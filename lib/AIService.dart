import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AIService {
  static Future<String> getAIResponse(String userMessage) async {
    final apiKey = dotenv.get("HUGGINGFACE_API_KEY");
    final model = "google/gemma-2-2b-it";
    final url = "https://api-inference.huggingface.co/models/$model";

    final headers = {
      "Authorization": "Bearer $apiKey",
      "Content-Type": "application/json"
    };

    final body = jsonEncode({
      "inputs": userMessage,
      "parameters": {
        "max_tokens": 500
      },
      "options": {
        "stream": false
      }
    });

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        if (responseData is List && responseData.isNotEmpty) {
          return responseData[0]["generated_text"] ?? "No response";
        } else {
          return "Invalid response format";
        }
      } else {
        return "Error: ${response.statusCode}";
      }
    } catch (e) {
      return "Error: $e";
    }
  }
}

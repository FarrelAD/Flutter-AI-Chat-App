import 'package:flutter_ai_chat/AIService.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:test/test.dart';

void main() {
  setUpAll(() async {
    await dotenv.load();
  });

  test('getAIResponseStream sends a request to the API and emits responses', () async {
    final stream = AIService.getAIResponseStream("Who is Napoleon Bonaparte?");

    final List<String> responses = [];
    await for (var response in stream) {
      print(response);
      responses.add(response);
    }

    expect(responses, isNotEmpty, reason: "The stream should emit responses.");
    expect(
      responses.any((response) => response.contains("Napoleon")),
      isTrue,
      reason: "The responses should mention 'Napoleon'.",
    );
  });
}

import 'package:flutter_ai_chat/AIService.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:test/test.dart';

void main() {
  setUpAll(() async {
    await dotenv.load();
  });

  test('API request to HuggingFace API', () async {
    final response = await AIService.getAIResponse('Who is Napoleon Bonaparte?');

    print(response);

    expect(response, isNotEmpty);
    expect(response, isNot(equals('Error: 401')));
    expect(response, isNot(contains('Invalid response format')));
  });
}

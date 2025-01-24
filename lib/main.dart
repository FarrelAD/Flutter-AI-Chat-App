import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_ai_chat/AIModelHelper.dart';

void main() async {
	await dotenv.load(fileName: ".env");
	runApp(const MyApp());
}

class MyApp extends StatelessWidget {
	const MyApp({super.key});

	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			debugShowCheckedModeBanner: false,
			title: 'AI Chat App',
			home: const ChatHomePage(),
		);
	}
}

class ChatHomePage extends StatefulWidget {
	const ChatHomePage({super.key});

	@override
	State<ChatHomePage> createState() => _ChatHomePageState();
}

class _ChatHomePageState extends State<ChatHomePage> {
	final List<Map<String, String>> _messages = [];
	final TextEditingController _controller = TextEditingController();

	void _sendMessage(String text) async {
		processChat("What is the capital of France?");



		setState(() {
			_messages.add({'user': text});
		});

		Future.delayed(const Duration(seconds: 1), () {
			setState(() {
				_messages.add({'ai': _getAIResponse(text)});
			});
		});
	}

	String _getAIResponse(String userMessage) {
		return 'This is a response to "$userMessage"';
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: const Text('AI Chat'),
				backgroundColor: Colors.blueAccent,
			),
			body: Column(
				children: [
					Expanded(
						child: ListView.builder(
							padding: const EdgeInsets.all(10.0),
							itemCount: _messages.length,
							itemBuilder: (context, index) {
								final message = _messages[index];
								final isUser = message.containsKey('user');
								return Align(
									alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
									child: Container(
										margin: const EdgeInsets.symmetric(vertical: 5.0),
										padding: const EdgeInsets.all(12.0),
										decoration: BoxDecoration(
											color: isUser ? Colors.blueAccent : Colors.grey[300],
											borderRadius: BorderRadius.circular(10.0),
										),
										child: Text(
											isUser ? message['user']! : message['ai']!,
											style: TextStyle(
												color: isUser ? Colors.white : Colors.black87,
											),
										),
									),
								);
							},
						),
					),
					Container(
						padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
						decoration: BoxDecoration(
							border: Border(top: BorderSide(color: Colors.grey[300]!)),
						),
						child: Row(
							children: [
								Expanded(
									child: TextField(
										controller: _controller,
										decoration: const InputDecoration(
											hintText: 'Type a message...',
											border: InputBorder.none,
										),
									),
								),
								IconButton(
									icon: const Icon(Icons.send, color: Colors.blueAccent),
									onPressed: () {
										if (_controller.text.trim().isNotEmpty) {
											_sendMessage(_controller.text.trim());
											_controller.clear();
										}
									},
								),
							],
						),
					),
				],
			),
		);
	}
}

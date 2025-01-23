import 'package:flutter/material.dart';

void main() {
	runApp(MyApp());
}

class MyApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
		debugShowCheckedModeBanner: false,
		title: 'Search Page',
		home: SearchHomePage(),
		);
	}
}

class SearchHomePage extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
		backgroundColor: Colors.white,
		body: Center(
			child: Padding(
			padding: const EdgeInsets.symmetric(horizontal: 20.0),
			child: Column(
				mainAxisAlignment: MainAxisAlignment.center,
				children: [
				// App Title or Logo
				Text(
					'AI Chat',
					style: TextStyle(
					fontSize: 30,
					fontWeight: FontWeight.bold,
					color: Colors.black87,
					),
				),
				const SizedBox(height: 40),
				// Search Box
				Container(
					decoration: BoxDecoration(
					color: Colors.white,
					borderRadius: BorderRadius.circular(30),
					boxShadow: [
						BoxShadow(
						color: Colors.grey.withOpacity(0.2),
						spreadRadius: 2,
						blurRadius: 8,
						offset: Offset(0, 3),
						),
					],
					),
					child: TextField(
					decoration: InputDecoration(
						hintText: 'Search...',
						hintStyle: TextStyle(fontSize: 16, color: Colors.grey),
						prefixIcon: Icon(Icons.search, color: Colors.grey),
						border: InputBorder.none,
						contentPadding: EdgeInsets.symmetric(vertical: 15),
					),
					),
				),
				const SizedBox(height: 40)
				],
			),
			),
		),
		);
	}
}

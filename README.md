# flutter_ai_chat

This project demonstrates how to integrate the AI model [`google/gemma-2-2b-it`](https://huggingface.co/google/gemma-2-2b-it) from Hugging Face into a Flutter application. The app functions as a chatbot, allowing users to ask questions and receive AI-generated responses. The AI model is accessed through HTTP requests using the Hugging Face Inference API, and the responses are displayed in markdown format within the app.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

### Instalation

1. Clone the repository
    ```bash
   git clone https://github.com/FarrelAD/Flutter-AI-Chat-App.git
    ```
2. Navigate to the project repository
    ```bash
    cd Flutter-AI-Chat-App
    ```
3. Install dependencies
    ```bash
   flutter pub get
    ```
4. Configure Hugging Face API key

    Rename file [`.env.example`](.env.example) to `.env`. And then, change API key value with your actual API key from Hugging Face.
5. Run the app
    ```bash
   flutter run
    ```

## Preview

![App preview](docs/img/app-preview.gif)

## Important notes ⚠️

This project is a simple demonstration and is not perfect. If you plan to build an AI chat application based on this app, please consider the following limitations:

1. Stateless AI Chat
    - The AI chat is stateless, meaning it cannot understand or remember previous conversations. Each message is treated independently, and only the current input is sent to the model.
    - If your app requires conversational context or memory, additional implementation for state management or conversation history is necessary.

2. Raw Response Formatting
   - The chat response is not formatted perfectly. Sometimes the AI model responds in a markdown-like format, but the app currently displays the raw data response as is.
   - To improve user experience, you may need to implement proper formatting or markdown rendering for consistent output.

These are key areas to improve upon if you plan to extend this app for real-world use cases.



// import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';
import 'imports.dart';

void main() {
  // final client = StreamChatClient(streamKey);
  runApp(
    MyApp(
        // client: client,
        ),
  );
}

class MyApp extends StatelessWidget {
  // const MyApp({Key? key, required this.client}) : super(key: key);

  // final StreamChatClient client;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.system,
      title: 'HiChat',
      home: HomeScreen(),
    );
  }
}

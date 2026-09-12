import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/store_controller.dart';
import 'theme/dreambyte_theme.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const DreamByteStore());
}

class DreamByteStore extends StatelessWidget {
  const DreamByteStore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => StoreController()),
      ],
      child: MaterialApp(
        title: 'DreamByte Store',
        theme: DreamByteTheme.darkTheme,
        home: const HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

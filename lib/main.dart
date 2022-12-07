import 'package:flutter/material.dart';
import 'package:test_tarwej/di.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_tarwej/features/authentication/ui/register/register_bloc.dart';
import 'package:test_tarwej/features/authentication/ui/register/register_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) {
      return RegisterBloc();
    },child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: RegisterPage(),
    ),);
  }
}

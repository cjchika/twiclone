import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twiclone/common/loading_page.dart';
import 'package:twiclone/features/auth/controller/auth_controller.dart';

// import 'package:twiclone/features/auth/view/login_view.dart';
import 'package:twiclone/features/auth/view/signup_view.dart';
import 'package:twiclone/theme/theme.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.theme,
      home: ref.watch(currentUserAccountProvider).when(
          data: (user) {},
          error: (error, st) {},
          loading: () => const LoadingPage()),
    );
  }
}

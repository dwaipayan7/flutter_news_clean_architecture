import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture_tuitorial/feature/auth/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'feature/auth/presentation/pages/home/daily_news.dart';
import 'injection_container.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

 await initializeDependency();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RemoteArticleBloc(sl()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "News App",
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(),
          useMaterial3: true,
        ),
        home: DailyNews(),
      ),
    );
  }
}


import 'package:daily_news/src/config/routes/app_routes.dart';
import 'package:daily_news/src/config/themes/app_theme.dart';
import 'package:daily_news/src/core/utils/constants.dart';
import 'package:daily_news/src/injector.dart';
import 'package:daily_news/src/presentation/blocs/remote_articles_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  print("Debug: Runapp");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticlesBloc>(
      create: (_)=>injector()..add(const GetArticles()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: kMaterialAppTitle,
        onGenerateRoute: AppRoutes.onGenerateRoutes,
        theme: AppTheme.light,
      )
    );
  }
}

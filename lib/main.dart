import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pagelistdata/bloc/pageDataBloc.dart';
import 'package:pagelistdata/repository_provider/repository_provider.dart';
import 'package:pagelistdata/ui/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) =>
            PageDataBloc(repositoryDataProvider: RepositoryDataProvider()),
        child: HomePage(),
      ),
    );
  }
}

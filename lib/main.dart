import 'package:equatable/equatable.dart';
import 'package:feature_multi_theme/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/theme/bloc/theme_bloc.dart';

void main() {
  return runApp(const MultiTheme());
}

class MultiTheme extends StatelessWidget {
  const MultiTheme({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc()..add(GetCurrentThemeEvent()),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          if (state is LoadedThemeState) {
            return MaterialApp(
              theme: state.themeData,
              debugShowCheckedModeBanner: false,
              title: "Theme App",
              home: HomePage(),
            );

          }
          return Container();
        },
      ),
    );
  }
}

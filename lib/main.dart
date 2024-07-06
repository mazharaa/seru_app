import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seru_app/application/wizard/wizard_cubit.dart';
import 'package:seru_app/screen/wizard_screen/wizard_page.dart';

void main() {
  runApp(const SeruApp());
}

class SeruApp extends StatelessWidget {
  const SeruApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WizardCubit(),
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) {
          return MaterialApp(
            title: 'SeruApp',
            home: child,
            theme: ThemeData(
              colorScheme: Theme.of(context).colorScheme.copyWith(
                    primary: Colors.blue,
                    onSecondary: Colors.blue,
                  ),
            ),
          );
        },
        child: const WizardPage(),
      ),
    );
  }
}

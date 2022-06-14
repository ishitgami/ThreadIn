import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thread_in/data/data_provider/data_provider.dart';
import 'package:thread_in/data/dio/dio_news.dart';
import 'package:thread_in/logic/cubit/news_cubit.dart';
import 'package:thread_in/presentation/screen/signin_page.dart';
import 'package:thread_in/presentation/screen/signup_page.dart';

import '../screen/homeScreen.dart';

class Routes {
   DataProvider dataProvider;
 

  Routes(
    this.dataProvider,
  ) {
     dataProvider = DataProvider(dioClient: DioClient());
   
  }
  static const String homeScreenRoute = '/';
  static const String signInScreenRoute = '/aaa';
  static const String signUpScreenRoute = '/aa';
  // const String facultyRegRoute = '/facultyRegRouteScreen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeScreenRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => NewsCubit(dataProvider: DataProvider(dioClient: DioClient())),
            child: const HomeScreen(),
          )
        );
      
      case signInScreenRoute:
        return MaterialPageRoute(builder: (_) => const SignIn());
      
       case signUpScreenRoute:
        return MaterialPageRoute(builder: (_) => const SignUp());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:h_store/Screens/AuthScreen.dart';
import 'package:h_store/Screens/HomeScreen.dart';
import 'package:h_store/Screens/SplashScreen.dart';
import 'package:h_store/constant.dart';
import 'package:h_store/cubit/add_cart_cubit/add_cart_cubit.dart';
import 'package:h_store/cubit/add_favourite_cubit/add_fav_cubit.dart';
import 'package:h_store/cubit/all_product_cubit/all_product_cubit.dart';
import 'package:h_store/cubit/auth_cubit/auth_cubit.dart';
import 'package:h_store/cubit/products_cubit/products_cubit.dart';
import 'package:h_store/cubit/show_favourite_cubit/show_fav_cubit.dart';
import 'package:h_store/models/productModel.dart';
import 'package:h_store/simple_bloc_observer.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  HttpOverrides.global = MyHttpOverrides();
  Bloc.observer = SimpleBlocObserver();

  await Hive.initFlutter();
  Hive.registerAdapter(ProductsAdapter());
  await Hive.openBox<Products>(kHiveBox);


  runApp(HStore());
}

class HStore extends StatelessWidget {
  const HStore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductsCubit(),
        ),
        BlocProvider(
          create: (context) => AddFavCubit(),
        ),
        BlocProvider(
          create: (context) => ShowFavCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => AddCartCubit(),
        ),
        BlocProvider(
          create: (context) => AllProductCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: SplashScreen(),
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host,
          int port) => true;
  }
}

import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:h_store/API/API.dart';
import 'package:h_store/Screens/AuthScreen.dart';
import 'package:h_store/Screens/DetailsScreen.dart';
import 'package:h_store/Screens/FavouriteScreen.dart';
import 'package:h_store/Screens/HomeScreen.dart';
import 'package:h_store/Screens/HomeScreenBody.dart';
import 'package:h_store/Screens/CategoryScreen.dart';
import 'package:h_store/cubit/all_product_cubit/all_product_cubit.dart';
import 'package:h_store/cubit/products_cubit/products_cubit.dart';
import 'package:h_store/models/productModel.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

int _selectedIndex = 0;



class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> screens = [
    const HomeScreenBody(),
    const FavouriteScreen(),
    const CategoryScreen()
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    BlocProvider.of<AllProductCubit>(context).getAllProducts();

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: buildGNav(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("H Store"),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        actions: [
          // IconButton(
          //   onPressed: () {
          //     showSearch(context: context, delegate: customSearch());
          //   },
          //   icon: const Icon(Icons.search),
          // ),
          IconButton(
            onPressed: () {
              signOut();
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: screens.elementAt(_selectedIndex),
    );
  }

  GNav buildGNav() {
    return GNav(
        haptic: true,
        selectedIndex: _selectedIndex,
        gap: 8,
        duration: const Duration(milliseconds: 100),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        onTabChange: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        tabs: const [
          GButton(
            icon: Icons.home,
            text: 'Home',
          ),
          GButton(
            icon: Icons.favorite_border,
            text: 'Favorite',
          ),
          GButton(
            icon: Icons.category_outlined,
            text: 'Category',
          ),
        ]);
  }

  Future<void> signOut() async {
    try {
      FirebaseAuth.instance.signOut();
      Future.delayed(Duration.zero, () {
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) {
            return AuthScreen();
          },
        ));
      });
      print("User logged out");
    } catch (e) {
      print("Error signing out: $e");
    }
  }
}



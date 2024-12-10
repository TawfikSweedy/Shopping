import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:shopping/Modules/Cart/cart_screen.dart';
import 'package:shopping/Modules/Favourite/favourite_screen.dart';
import 'package:shopping/Modules/Home/home_screen.dart';
import 'package:shopping/Provider/cart_provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Size size = Size.zero;
  int currentIndex = 0;

  List<Widget> screens = [
    HomeScreen(),
    FavouriteScreen(),
    CartScreen(),
    Container(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            border: Border(top: BorderSide(color: Colors.black26, width: 0.5))),
        child: Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            bottomNavigationBarTheme:
                Theme.of(context).bottomNavigationBarTheme,
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.black,
            items: [
              getIcon(0, "Home", Iconsax.home_14),
              getIcon(1, "Favourites", Iconsax.heart),
              BottomNavigationBarItem(
                  icon: Container(
                    padding: EdgeInsets.only(
                        bottom: size.height * 0.005
                    ),
                    margin: EdgeInsets.only(bottom: 2),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(color: currentIndex == 2 ? Colors.black : Colors.black26),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: Icon(
                              Iconsax.bag,
                              color: currentIndex == 2 ? Colors.black : Colors.black26,
                              size: 22,
                            ),
                          ),
                        ),
                        Positioned(
                          top: -5,
                          right: -3,
                          child: context
                                  .watch<CartProvider>()
                                  .shoppingCart
                                  .isNotEmpty
                              ? CircleAvatar(
                                  backgroundColor: Colors.redAccent,
                                  radius: 10,
                                  child: Text(
                                    context
                                        .watch<CartProvider>()
                                        .shoppingCart
                                        .length
                                        .toString(),
                                    style: GoogleFonts.poppins(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white
                                    ),
                                  ),
                                )
                              : SizedBox(),
                        )
                      ],
                    ),
                  ),
                  label: "Cart",
              ),
              getIcon(3, "Orders", CupertinoIcons.list_bullet_indent),
              getIcon(4, "Profile", Iconsax.profile_circle4),
            ],
            currentIndex: currentIndex,
            onTap: (int tab) {
              setState(() {
                currentIndex = tab;
              });
            },
          ),
        ),
      ),
    );
  }

  getIcon(int id, String label, IconData icon) {
    return BottomNavigationBarItem(
        icon: Container(
          padding: EdgeInsets.only(
              bottom: size.height * 0.001
          ),
          child: Icon(icon),
        ),
        label: label,
    );
  }
}

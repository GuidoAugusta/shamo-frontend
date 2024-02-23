import 'package:flutter/material.dart';
import 'package:shamo/pages/home/chat_page.dart';
import 'package:shamo/pages/home/home_page.dart';
import 'package:shamo/pages/home/profile_page.dart';
import 'package:shamo/pages/home/wishlist_page.dart';
import 'package:shamo/theme.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  int previousIndex = 0; // variabel untuk menyimpan indeks sebelumnya

  @override
  Widget build(BuildContext context) {
    Widget cartButton() {
      return FloatingActionButton(
        onPressed: () {},
        backgroundColor: secondaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        child: Image.asset(
          'assets/icon_cart.png',
          width: 20,
        ),
      );
    }

    Widget customBottomNav() {
      return ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
        child: BottomAppBar(
          height: 75,
          padding: EdgeInsets.zero,
          color: backgroundColor4,
          shape: CircularNotchedRectangle(),
          notchMargin: 10,
          clipBehavior: Clip.antiAlias,
          child: Theme(
            data: Theme.of(context).copyWith(
              splashFactory: NoSplash.splashFactory,
            ),
            child: BottomNavigationBar(
              backgroundColor: backgroundColor4,
              currentIndex: currentIndex,
              onTap: (value) {
                if (value == 2) {
                  // jika indeks 2 ditekan
                  setState(() {
                    // Set currentIndex kembali ke previousIndex
                    currentIndex = previousIndex;
                  });
                } else {
                  print(value);
                  setState(() {
                    // Set currentIndex ke nilai yang dipilih
                    currentIndex = value;
                    previousIndex =
                        value; // Simpan nilai currentIndex ke previousIndex
                  });
                }
              },
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Image.asset(
                      'assets/icon_home.png',
                      width: 21,
                      color:
                          currentIndex == 0 ? primaryColor : Color(0xff808191),
                    ),
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Image.asset(
                      'assets/icon_chat.png',
                      width: 20,
                      color:
                          currentIndex == 1 ? primaryColor : Color(0xff808191),
                    ),
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  // Ini adalah widget Expanded yang membuat jarak di tengah lebih panjang
                  icon: Container(),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Image.asset(
                      'assets/icon_wishlist.png',
                      width: 20,
                      color:
                          currentIndex == 3 ? primaryColor : Color(0xff808191),
                    ),
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Image.asset(
                      'assets/icon_profile.png',
                      width: 18,
                      color:
                          currentIndex == 4 ? primaryColor : Color(0xff808191),
                    ),
                  ),
                  label: '',
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget body() {
      switch (currentIndex) {
        case 0:
          return HomePage();
        case 1:
          return ChatPage();
        case 3:
          return WishlistPage();
        case 4:
          return ProfilePage();
        default:
          return HomePage();
      }
    }

    return Scaffold(
      backgroundColor: currentIndex == 0 ? backgroundColor1 : backgroundColor3,
      floatingActionButton: cartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: customBottomNav(),
      body: body(),
    );
  }
}

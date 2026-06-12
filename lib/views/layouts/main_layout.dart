import 'package:flutter/material.dart';
import 'package:test_flutter/views/pages/home/home_page.dart';
import 'package:test_flutter/views/widgets/logo.dart';
import 'package:test_flutter/views/widgets/notification_screen.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});
  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _currentIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final List<Widget> _pages = [HomePage(), HomePage(), HomePage()];
  // @override
  // void initState() {
  //   super.initState();
  //   Future.delayed(const Duration(seconds: 3), () {
  //     FlutterNativeSplash.remove();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: const Logo(width: 100, height: 100),
        //forceMaterialTransparency: true,
        
        // title: Logo(),
        centerTitle: true,
        actionsPadding: EdgeInsetsDirectional.symmetric(horizontal: 5),
        actions: [
          CircleAvatar(
            child: IconButton(
              onPressed: () async {
                await NotificationScreen.afficherNotification();
              },
              icon: Badge(label: Text("1"), child: Icon(Icons.notifications)),
            ),
          ),
          const SizedBox(width: 8),
          CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage("assets/images/avatar.jpg"),
          ),
        ],
      ),

      body: IndexedStack(index: _currentIndex, children: _pages),
      floatingActionButton: FloatingActionButton(onPressed: (){},child: Icon(Icons.add),),
      bottomNavigationBar: BottomNavigationBar(

        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined),
            activeIcon: Icon(Icons.category),
            label: "Categories",
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            activeIcon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            activeIcon: Icon(Icons.favorite),
            label: "Favorites",
          ),
         
        ],
        showUnselectedLabels: false,
        showSelectedLabels: true,
      ),
    );
  }
}

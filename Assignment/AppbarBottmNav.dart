import 'package:flutter/material.dart';
 
class AppNav extends StatefulWidget {
  const AppNav({super.key});
 
  @override
  State<AppNav> createState() => _AppNav();
}
 
class _AppNav extends State<AppNav> {
  @override
  Widget build(BuildContext context) {
    List<IconData> list = [
      Icons.call,Icons.camera,Icons.chat,Icons.phone,Icons.category,
    ];
 
    List<String> list2 = [
      "Calls","Camera","Chats","Phone","List",
    ];
    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.grey[900],
          shape: CircularNotchedRectangle(),
          notchMargin: 5,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
              Spacer(),
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.more_vert_rounded,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: const Text('AppBar & Bottom NavBar'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                text: "Incoming Call",
                icon: null,
              ),
              Tab(
                text: "Outgoing Call",
                icon: null,
              ),
              Tab(
                text: "Missed Call",
                icon: null,
              ),
              Tab(
                text: "Contacts",
                icon: null,
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  Offstage(),
                  Offstage(),
                  Offstage(),
                  Offstage(),
                ],
              ),
            ),
            SizedBox(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (int i = 0; i < list.length; i++)
                    Expanded(
                      child: Column(
                        children: [
                          Icon(
                            list[i],
                          ),
                          Text(list2[i]),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

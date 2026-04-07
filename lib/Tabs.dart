import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {

  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {

    TabBar tabBar = TabBar(
      controller: tabController,
      tabs: [
        Tab(text: "Row"),
        Tab(text: "Column"),
      ],
    );

    Row rowImages = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.network(""),
        Image.asset("Home"),
        Image.network(""),
      ],
    );

    Column columnImages = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(""),
        Image.network(""),
        Image.network(""),
      ],
    );

    Container tab1 = Container(
      color: Colors.lightBlue[100],
      child: Center(child: rowImages),
    );

    Container tab2 = Container(
      color: Colors.lightGreen[100],
      child: Center(child: columnImages),
    );

    TabBarView tabView = TabBarView(
      controller: tabController,
      children: [
        tab1,
        tab2,
      ],
    );

    Column layout = Column(
      children: [
        tabBar,
        Expanded(child: tabView),
      ],
    );

    return Scaffold(
      appBar: AppBar(title: Text("Tabs Example")),
      body: layout,
    );
  }
}
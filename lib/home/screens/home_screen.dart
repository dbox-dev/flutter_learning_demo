import 'package:flutter/material.dart';
import 'package:flutter_learning_demo/home/model/product.dart';
import 'package:flutter_learning_demo/home/services/home_service.dart';
import 'package:flutter_learning_demo/login/screens/login_screen.dart';
import 'package:flutter_learning_demo/shared/app_routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      drawer: Container(
        width: 200,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: [
            const Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, AppRoute.login, (Route<dynamic> route) => false);
                // Navigator.of(context).pushAndRemoveUntil(
                //     MaterialPageRoute(
                //         builder: (context) => const LoginScreen()),
                //     (Route<dynamic> route) => false);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFD400),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                    child: Text("Logout"),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          _scaffoldKey.currentState!.openDrawer();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFD400),
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: const Padding(
                            padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                            child: Text(
                              "Open Drawer",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                FutureBuilder(
                  future: HomeService().getProduct(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Product>> snapshot) {
                    List<Widget> children;
                    if (snapshot.hasData) {
                      final List<Product> items = snapshot.data!;
                      children = <Widget>[
                        //   const Icon(
                        //     Icons.check_circle_outline,
                        //     color: Colors.green,
                        //     size: 60,
                        //   ),
                        // Padding(
                        //   padding: const EdgeInsets.only(top: 16),
                        //   child: Text('Result: ${snapshot.data}'),
                        // ),
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            color: Colors.black26,
                          ),
                          // child: Text(items[0].itemName),
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: items.length,
                            itemBuilder: (context, index) {
                              print(items[index].itemImg);
                              return ListTile(
                                leading: Image.network(items[index].itemImg),
                                title: Text(items[index].itemName),
                                subtitle: Text(items[index].itemSpec),
                              );
                              // return Text(items[index].itemName);
                            },
                          ),
                        ),
                      ];
                    } else if (snapshot.hasError) {
                      children = <Widget>[
                        const Icon(
                          Icons.error_outline,
                          color: Colors.red,
                          size: 60,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: Text('Error: ${snapshot.error}'),
                        ),
                      ];
                    } else {
                      children = const <Widget>[
                        SizedBox(
                          width: 60,
                          height: 60,
                          child: CircularProgressIndicator(),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 16),
                          child: Text('Awaiting result...'),
                        ),
                      ];
                    }
                    return Column(
                      children: children,
                    );
                  },
                ),
                // Spacer(),
                // SizedBox(height: 100,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

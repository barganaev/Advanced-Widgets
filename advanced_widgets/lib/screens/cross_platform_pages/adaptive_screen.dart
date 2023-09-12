import 'package:flutter/material.dart';
import 'package:popover/popover.dart';

class AdaptiveScreen extends StatefulWidget {
  const AdaptiveScreen({super.key});

  @override
  State<AdaptiveScreen> createState() => _AdaptiveScreenState();
}

class _AdaptiveScreenState extends State<AdaptiveScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {

    });
  }

  @override
  Widget build(BuildContext context) {
    var width_of_screen = MediaQuery.of(context).size.width;
    return width_of_screen < 1250 // 720 

    // case 1: short width
    ? SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Adaptive App'),
          centerTitle: true,
          backgroundColor: Colors.cyan
        ),
        body: ListView.builder(
          itemCount: 30,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(1.0),
              child: GestureDetector(
                onTap: () {
                  showBottomSheet(
                    context: context, 
                    builder: (context) {
                      return Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 20
                        ),
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Row(
                                children: [
                                  Icon(Icons.ad_units),
                                  Text(
                                    'View Profile',
                                    style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.black
                                    ),
                                  )
                                ],
                              ),
                            ),
    
                            // Divider
                            Divider(
                              thickness: 3,
                              color: Colors.black,
                            ),
    
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Row(
                                children: [
                                  Icon(Icons.add_box),
                                  Text(
                                    'Friends',
                                    style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.black
                                    ),
                                  )
                                ],
                              ),
                            ),
    
                            // Divider
                            Divider(
                              thickness: 3,
                              color: Colors.black,
                            ),
    
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Row(
                                children: [
                                  Icon(Icons.password),
                                  Text(
                                    'Report',
                                    style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.black
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  );
                },
                child: Card(
                  color: Colors.cyan,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                  ),
                  elevation: 2,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/user1.jpg'),
                    ),
                    title: Text('Vladimir Pavlovich'),
                    subtitle: Text('vladimir@gmail.com'),
                  ),
                ),
              ),
            );
          }
        )
      ),
    )

     // case 2: tall width
    :  SafeArea(
      child: Scaffold(
          body: Row(
            children: [
              Container(
                padding: EdgeInsets.only(top: 20),
                color: Colors.cyan,
                width: MediaQuery.of(context).size.width * 0.25,
                height: MediaQuery.of(context).size.height,
                child: Center(
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      'Adaptive App',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3
                    ), 
                    itemCount: 30,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Builder(
                          builder: (context) {
                            return GestureDetector(
                              onTap: () {
                                // show the popover
                                showPopover(
                                  context: context, 
                                  bodyBuilder: (context) {
                                    return Container(
                                      width: 200,
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical: 20
                                          ),
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            color: Theme.of(context).cardColor,
                                            borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(40),
                                              topRight: Radius.circular(40),
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Row(
                                                  children: [
                                                    Icon(Icons.ad_units),
                                                    Text(
                                                      'View Profile',
                                                      style: TextStyle(
                                                        fontSize: 24,
                                                        color: Colors.black
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                
                                              // Divider
                                              Divider(
                                                thickness: 3,
                                                color: Colors.black,
                                              ),
                                
                                              InkWell(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Row(
                                                  children: [
                                                    Icon(Icons.add_box),
                                                    Text(
                                                      'Friends',
                                                      style: TextStyle(
                                                        fontSize: 24,
                                                        color: Colors.black
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                
                                              // Divider
                                              Divider(
                                                thickness: 3,
                                                color: Colors.black,
                                              ),
                                
                                              InkWell(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Row(
                                                  children: [
                                                    Icon(Icons.password),
                                                    Text(
                                                      'Report',
                                                      style: TextStyle(
                                                        fontSize: 24,
                                                        color: Colors.black
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                  }
                                );
                              },
                              child: Card(
                                color: Colors.cyan,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)
                                ),
                                elevation: 2,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      radius: 60,
                                      backgroundImage: AssetImage('assets/images/user1.jpg'),
                                    ),
                                    Text(
                                      'Vladimir Parlovich',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    Text(
                                      'vladimir@gmail.com',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                )
                                // ListTile(
                                //   leading: CircleAvatar(
                                //     backgroundImage: AssetImage('assets/images/user1.jpg'),
                                //   ),
                                //   title: Text('Vladimir Pavlovich'),
                                //   subtitle: Text('vladimir@gmail.com'),
                                // ),
                              ),
                            );
                          }
                        ),
                      );
                    }
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}
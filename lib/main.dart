import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

// ignore: must_be_immutable
class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  List<String> profilePics = [
    '1.jpg',
    '2.jpg',
    '2.png',
    '3.jpg',
    '4.jpg',
    '7.jpg',
    '9.jpeg',
    '10.jpg',
    '11.png',
    '12.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: 'Chats'.text.bold.xl3.make(),
        leading: Container(
          padding: const EdgeInsets.only(left: 16, top: 3, bottom: 3),
          child: VxCircle(
            backgroundImage: DecorationImage(
                image: AssetImage('assets/profile-pics/${profilePics[1]}'),
                fit: BoxFit.fill),
          ),
        ),
        actions: <Widget>[
          CircleAvatar(
            backgroundColor: const Color.fromRGBO(51, 51, 51, 1),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.photo_camera,
                size: 22,
                color: Color.fromRGBO(195, 195, 195, 1),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          CircleAvatar(
            backgroundColor: const Color.fromRGBO(51, 51, 51, 1),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.edit,
                size: 22,
                color: Color.fromRGBO(195, 195, 195, 1),
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              padding: const EdgeInsets.only(left: 16, top: 4, bottom: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: const Color.fromRGBO(51, 51, 51, 1),
              ),
              child: const TextField(
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.search,
                      color: Color.fromRGBO(159, 159, 159, 1),
                    ),
                    hintText: 'Search',
                    hintStyle: TextStyle(
                      color: Color.fromRGBO(159, 159, 159, 1),
                    )),
              ),
            ),
          ),
          Container(
            height: 85,
            margin: const EdgeInsets.only(top: 8, bottom: 8, left: 16),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Container(
                  width: 65,
                  margin: const EdgeInsets.only(right: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: const Color.fromRGBO(51, 51, 51, 1),
                              border: index % 2 == 0
                                  ? Border.all(width: 0)
                                  : Border.all(color: Colors.blue, width: 3),
                            ),
                            child: ClipOval(
                              child: index == 0
                                  ? IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.add),
                                      color: const Color.fromRGBO(
                                          195, 195, 195, 1),
                                    )
                                  : Image.asset(
                                      'assets/profile-pics/${profilePics[index]}'),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: Container(
                              height: index != 0 ? 18 : 0,
                              width: 18,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(9),
                                color: Colors.green,
                                border:
                                    Border.all(color: Colors.black, width: 3),
                              ),
                            ),
                          ),
                        ],
                      ),
                      index % 2 == 1
                          ? 'Your Story'.text.white.make()
                          : 'Your Story'
                              .text
                              .color(
                                const Color.fromRGBO(123, 123, 123, 1),
                              )
                              .make(),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 16, right: 16, top: 8),
            height: 450,
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (conetxt, index) {
                return ListTile(
                  contentPadding: const EdgeInsets.only(bottom: 10, right: 8),
                  leading: Stack(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: const Color.fromRGBO(51, 51, 51, 1),
                        ),
                        child: ClipOval(
                          child: Image.asset(
                              'assets/profile-pics/${profilePics[index]}'),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                          height: index % 2 == 0 ? 18 : 0,
                          width: 18,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9),
                            color: Colors.green,
                            border: Border.all(color: Colors.black, width: 3),
                          ),
                        ),
                      ),
                    ],
                  ),
                  title: 'Coder Sangam'.text.white.make(),
                  subtitle: 'This is message from Coder Sangam'
                      .text
                      .color(
                        const Color.fromRGBO(123, 123, 123, 1),
                      )
                      .make(),
                  trailing: Icon(
                    Icons.check_circle,
                    size: 20,
                    color: index % 2 == 0
                        ? const Color.fromRGBO(101, 107, 115, 1)
                        : Colors.transparent,
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 50,
        color: Colors.black,
        padding: const EdgeInsets.only(left: 80, right: 80),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Stack(
              children: [
                SizedBox(
                  height: 40,
                  width: 40,
                  child: IconButton(
                    onPressed: () {},
                    icon: Image.asset('assets/profile-pics/mmessage.png',
                        fit: BoxFit.fitHeight),
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 2,
                  child: Container(
                    height: 21,
                    width: 21,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9),
                      color: Colors.redAccent,
                      border: Border.all(color: Colors.black, width: 3),
                    ),
                    child: Center(
                      child: '2'.text.white.bold.make(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
              width: 40,
              child: IconButton(
                onPressed: () {},
                icon: Image.asset('assets/profile-pics/people.png',
                    fit: BoxFit.fitHeight),
              ),
            ),
            SizedBox(
              height: 40,
              width: 40,
              child: IconButton(
                onPressed: () {},
                icon: Image.asset('assets/profile-pics/navigation.png',
                    fit: BoxFit.fitHeight),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

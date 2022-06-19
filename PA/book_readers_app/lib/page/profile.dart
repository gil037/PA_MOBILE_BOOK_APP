import 'package:flutter/material.dart';
import 'package:book_readers_app/Color/color.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Container(
        child: Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      'https://i.pinimg.com/564x/98/56/a1/9856a11dc5c3605d726ea1bce81f8164.jpg'),
                ),
              ),
            ),
            CustomScrollView(
              slivers: <Widget>[
                SliverList(
                  delegate: SliverChildListDelegate([
                    SizedBox(height: 40.0),
                    Center(
                      child: CircleAvatar(
                        backgroundColor: Colors.grey,
                        child: Icon(
                          color: Colors.white,
                          Icons.person,
                          size: 150.0,
                        ),
                        radius: 100,
                      ),
                    ),
                    SizedBox(height: 40.0),
                    Center(
                      child: Text('Tom Cruise',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold)),
                    )
                  ]),
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    Container(
                      height: 200.0,
                      child: GridView.count(
                        padding: EdgeInsets.all(40.0),
                        shrinkWrap: true,
                        crossAxisCount: 3,
                        crossAxisSpacing: 20.0,
                        children: <Widget>[
                          InkWell(
                              onTap: () {},
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(200.0),
                                      boxShadow: [
                                        BoxShadow(
                                            color:
                                                Colors.yellow.withOpacity(.2),
                                            blurRadius: 10.0)
                                      ],
                                      color: kuning),
                                  child: Icon(Icons.favorite,
                                      size: 40.0, color: Colors.white))),
                          InkWell(
                              onTap: () {},
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(200.0),
                                      boxShadow: [
                                        BoxShadow(
                                            color:
                                                Colors.yellow.withOpacity(.2),
                                            blurRadius: 10.0)
                                      ],
                                      color: kuning),
                                  child: Icon(Icons.call,
                                      size: 40.0, color: Colors.white))),
                          InkWell(
                              onTap: () {},
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(200.0),
                                      boxShadow: [
                                        BoxShadow(
                                            color:
                                                Colors.yellow.withOpacity(.2),
                                            blurRadius: 10.0)
                                      ],
                                      color: kuning),
                                  child: Icon(Icons.email,
                                      size: 40.0, color: Colors.white))),
                        ],
                      ),
                    )
                  ]),
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    Stack(
                      children: <Widget>[
                        Container(
                          width: double.infinity,
                          height: 150,
                          margin: EdgeInsets.only(top: 20.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30.0),
                                  topRight: Radius.circular(30.0)),
                              color: Colors.white),
                        ),
                        Center(
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 60.0, vertical: 20.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100.0),
                                  gradient: LinearGradient(colors: [
                                    kuning,
                                    Colors.yellowAccent,
                                    kuning
                                  ])),
                              child: Text('FOLLOW',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 60.0),
                          padding: EdgeInsets.all(30.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Flexible(
                                child: Column(
                                  children: <Widget>[
                                    Text('23',
                                        style: TextStyle(fontSize: 20.0)),
                                    Text('Posts',
                                        style: TextStyle(fontSize: 15.0))
                                  ],
                                ),
                              ),
                              Flexible(
                                child: Column(
                                  children: <Widget>[
                                    Text('123',
                                        style: TextStyle(fontSize: 20.0)),
                                    Text('Following',
                                        style: TextStyle(fontSize: 15.0))
                                  ],
                                ),
                              ),
                              Flexible(
                                child: Column(
                                  children: <Widget>[
                                    Text('2k',
                                        style: TextStyle(fontSize: 20.0)),
                                    Text('Followers',
                                        style: TextStyle(fontSize: 15.0))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ]),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}

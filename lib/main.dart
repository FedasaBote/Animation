import "package:animation/page_model.dart";
import "package:flutter/material.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: PageView.builder(
          itemCount: pages.length,
          itemBuilder: (context, index) {
            return AnimatedPage(pageModel: pages[index]);
          },
        ),
      ),
    );
    // Scaffold(
    //   appBar: AppBar(
    //     title: Text('Animated Card Demo'),
    //   ),
    //   body: Center(
    //     child: AnimatedHorizontalCard(),
    //   ),
    // ),
  }
}

// class AnimatedHorizontalCard extends StatefulWidget {
//   @override
//   _AnimatedHorizontalCardState createState() => _AnimatedHorizontalCardState();
// }

// class _AnimatedHorizontalCardState extends State<AnimatedHorizontalCard> {
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: 4,
//         itemBuilder: (context, index) {
//           return Custom();
//         });
//   }
// }

class AnimatedPage extends StatefulWidget {
  final PageModel pageModel;
  const AnimatedPage({super.key, required this.pageModel});

  @override
  State<AnimatedPage> createState() => _AnimatedPageState();
}

class _AnimatedPageState extends State<AnimatedPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> animation;
  @override
  initState() {
    super.initState();
    //animate from 1 to 0

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    animation = Tween(begin: 1.0, end: 0.0).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(widget.pageModel.imagepath),
          fit: BoxFit.cover,
        ),
      ),
      //  translate the writing from bottom to top based animation first take to bottom then to its orginal position
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Colors.black87,
                Colors.black12,
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: [0.1, 0.5]),
        ),
        child: AnimatedBuilder(
          animation: animation,
          builder: ((context, child) {
            return Transform(
              transform: Matrix4.identity()
                ..translate(0.0, animation.value * 100.0),
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, right: 50.0, bottom: 30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.pageModel.title,
                          style: const TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            ...build_star(widget.pageModel.rating),
                            Text.rich(TextSpan(
                              text: "4.0 ",
                              children: [
                                TextSpan(
                                    text: "(2000)",
                                    style: TextStyle(fontSize: 10.0)),
                              ],
                              style: TextStyle(color: Colors.white),
                            ))
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          widget.pageModel.description,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16.0,
                            color: Colors.white,
                            wordSpacing: 1.0,
                            letterSpacing: -0.5,
                          ),
                        )
                      ],
                    ),
                  )),
            );
          }),
        ),
      ),
    );
  }

  List<Widget> build_star(int amount) {
    List<Widget> number = [];

    for (int i = 0; i < 5; i++) {
      i < amount
          ? number.add(const Icon(
              Icons.star,
              color: Colors.yellow,
            ))
          : number.add(const Icon(
              Icons.star_border,
              color: Colors.yellow,
            ));
    }

    return number;
  }
}

// AnimatedTransitionBuilder

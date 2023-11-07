import 'package:flutter/material.dart';
import 'package:animation/src/widgets/cat.dart';
import 'dart:math';

import 'package:flutter/rendering.dart';

class Home extends StatefulWidget {
  createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> with TickerProviderStateMixin {
  late Animation catAnimation;
  late AnimationController catController;
  late Animation<double> boxAnimation;
  late AnimationController boxController;

  @override
  void initState() {
    super.initState();
    catController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    boxController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    boxAnimation = Tween(begin: pi * 0.6, end: pi * 0.65).animate(
        CurvedAnimation(parent: boxController, curve: Curves.easeInOut));

    SliverAppBar;
    RenderSliver;

    boxAnimation.addStatusListener((status) {
      if (boxAnimation.status == AnimationStatus.completed) {
        boxController.reverse();
      } else if (boxAnimation.status == AnimationStatus.dismissed) {
        boxController.forward();
      }
    });
    boxController.forward();
    catAnimation = Tween(begin: 0.0, end: 100.0)
        .animate(CurvedAnimation(parent: catController, curve: Curves.easeIn));
  }

  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation!'),
      ),
      body: GestureDetector(
        onTap: onTap,
        child: Center(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              buildAnimation(),
              Container(
                color: Colors.brown,
                width: 200,
                height: 200,
              ),
              buildLeftFlap(),
              buildRightFlap(),
            ],
          ),
        ),
      ),
    );
  }

  onTap() {
    boxController.stop();
    if (catAnimation.status == AnimationStatus.completed) {
      boxController.forward();
      catController.reverse();
    } else if (catAnimation.status == AnimationStatus.dismissed) {
      boxController.stop();
      catController.forward();
    }
  }

  Widget buildAnimation() {
    return AnimatedBuilder(
      animation: catAnimation,
      builder: (context, child) {
        return Positioned(
          left: 0,
          right: 0,
          top: -catAnimation.value.toDouble() / 2 - 30,
          child: Container(
            // margin: EdgeInsets.only(top: catAnimation.value.toDouble()),
            child: child!,
          ),
        );
      },
      child: Cat(),
    );
  }

  Widget buildLeftFlap() {
    return Positioned(
      left: 3.0,
      child: AnimatedBuilder(
        animation: boxAnimation,
        child: Container(
          color: Colors.brown,
          height: 10,
          width: 150,
        ),
        builder: (context, child) {
          return Transform.rotate(
            alignment: Alignment.topLeft,
            angle: boxAnimation.value,
            child: child!,
          );
        },
      ),
    );
  }

  Widget buildRightFlap() {
    return Positioned(
      right: 3.0,
      child: AnimatedBuilder(
        animation: boxAnimation,
        child: Container(
          color: Colors.brown,
          height: 10,
          width: 150,
        ),
        builder: (context, child) {
          return Transform.rotate(
            alignment: Alignment.topRight,
            angle: -boxAnimation.value,
            child: child!,
          );
        },
      ),
    );
  }
}
// why the above code is not animating the cat image correctly
// i think the problem is in the buildAnimation() method
// may be the problem is in the Positioned widget
// let's try to fix it
// Position
// class HomeState extends State<Home> with SingleTickerProviderStateMixin {
//   // 1
//   late Animation<double> animation;
//   late AnimationController controller;

//   initState() {
//     super.initState();
//     // 2
//     controller = AnimationController(
//       duration: const Duration(milliseconds: 2000),
//       vsync: this,
//     );
//     // 3
//     final CurvedAnimation curve =
//         CurvedAnimation(parent: controller, curve: Curves.easeIn);
//     // 4
//     animation = Tween(begin: 0.0, end: 300.0).animate(curve);
//     // conteroller.forwrd() starts the animation and also lets reverse the animation here
//     controller.forward();
//     // let's check if animation status is completed
//     animation.addStatusListener((status) {
//       if (status == AnimationStatus.completed) {
//         // let's reverse the animation
//         controller.reverse();
//       } else if (status == AnimationStatus.dismissed) {
//         // let's forward the animation
//         controller.forward();
//       }
//     });
//   }

//   Widget build(context) {
//     return AnimatedLogo(animation: animation);
//   }

//   dispose() {
//     controller.dispose();
//     super.dispose();
//   }
// }

// // 1
// class AnimatedLogo extends AnimatedWidget {
//   AnimatedLogo({Key? key, required Animation<double> animation})
//       : super(key: key, listenable: animation);

//   // 2
//   Widget build(BuildContext context) {
//     // 3
//     final Animation<double> animation = listenable as Animation<double>;
//     // 4
//     return Center(
//       child: Container(
//         margin: EdgeInsets.symmetric(vertical: 10),
//         height: animation.value,
//         width: animation.value,
//         child: FlutterLogo(),
//       ),
//     );
//   }
// }

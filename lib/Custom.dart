import 'package:flutter/material.dart';

class Custom extends StatefulWidget {
  const Custom({super.key});

  @override
  State<Custom> createState() => _CustomState();
}

class _CustomState extends State<Custom> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        height: size.height, // Adjust as needed
        width: size.width, // Adjust as needed
        color: Colors.blue, // Adjust as needed
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Stack(
              children: [
                // add image here
                Card(
                  elevation: 4,
                  child: AnimatedContainer(
                    margin: EdgeInsets.only(bottom: _isExpanded ? 0 : 60.0),
                    duration: const Duration(milliseconds: 300),
                    height: _isExpanded ? size.height : size.height * 0.6,
                    width: _isExpanded ? size.width : size.width * 0.9,
                    decoration: const BoxDecoration(
                        color: Colors.red,
                        image: DecorationImage(
                          image: AssetImage('assets/all-hotel2.png'),
                          fit: BoxFit.cover,
                        )),
                  ),
                ),

                AnimatedPositioned(
                  duration: const Duration(milliseconds: 1000),
                  curve: Curves.easeInOut,
                  top: _isExpanded ? 0 : size.height, // Adjust as needed
                  left: _isExpanded ? 0 : size.width, // Adjust as needed
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    opacity: _isExpanded ? 1 : 0, // Adjust as needed
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Title',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 1000),
                  curve: Curves.easeInOut,
                  bottom:
                      _isExpanded ? 0 : size.height * 0.005, // Adjust as needed
                  left: _isExpanded ? 0 : size.width * 0.25, // Adjust as needed
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    opacity: _isExpanded ? 1 : 1, // Adjust as needed
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Description',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

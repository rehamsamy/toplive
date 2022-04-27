import 'package:flutter/material.dart';

class CustomError extends StatelessWidget {
  final FlutterErrorDetails errorDetails;

  const CustomError({
    Key? key,
    required this.errorDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(
            errorDetails.exception.toString(),
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          Center(
            child: Padding(
              child: Text(
                "Something is not right here...",
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              padding: const EdgeInsets.all(8.0),
            ),
          ),
        ],
      ),
      color: Colors.red,
      margin: EdgeInsets.zero,
    );
  }
}

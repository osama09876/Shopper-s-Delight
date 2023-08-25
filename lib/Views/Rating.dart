import 'package:flutter/material.dart';

class RatingInput extends StatefulWidget {
  final ValueChanged<int> onRatingChanged;

  RatingInput({required this.onRatingChanged});

  @override
  _RatingInputState createState() => _RatingInputState();
}

class _RatingInputState extends State<RatingInput> {
  int _rating = 0;

  void _updateRating(int newRating) {
    setState(() {
      _rating = newRating;
      widget.onRatingChanged(newRating);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return GestureDetector(
          onTap: () => _updateRating(index + 1),
          child: Icon(
            index < _rating ? Icons.star : Icons.star_border,
            color: Colors.yellow,
            size: 30.0,
          ),
        );
      }),
    );
  }
}

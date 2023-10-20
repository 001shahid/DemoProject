import 'package:flutter/material.dart';

class LikeAnimation extends StatefulWidget {
  final bool isLiked;
  final Function(bool isLiked) onLiked;

  const LikeAnimation({
    required this.isLiked,
    required this.onLiked,
    Key? key,
  }) : super(key: key);

  @override
  State<LikeAnimation> createState() => _LikeAnimationState();
}

class _LikeAnimationState extends State<LikeAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    if (widget.isLiked) {
      _controller.value = 1.0;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleFavorite() {
    widget.onLiked(!widget.isLiked);
    if (widget.isLiked) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: _toggleFavorite,
      icon: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Icon(
            Icons.favorite,
            color: Colors.red,
            size: 24.0 + 8.0 * _controller.value,
          );
        },
      ),
    );
  }
}

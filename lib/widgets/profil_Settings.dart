import 'package:flutter/material.dart';

class ProfileAvatarWidget extends StatelessWidget {
  const ProfileAvatarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 88,
      height: 88,
      child: Stack(
        children: [
          Container(
            width: 88,
            height: 88,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage('https://cdn.builder.io/api/v1/image/assets/TEMP/cb68a6a9e9908e1abc538ecede3794efaa25afeb?placeholderIfAbsent=true'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 18,
            child: Container(
              width: 21,
              height: 21,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 2,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Center(
                child: Container(
                  width: 9,
                  height: 9,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage('https://cdn.builder.io/api/v1/image/assets/TEMP/74b85d7bfa325487700a11dccc9c6dba3e003d4b?placeholderIfAbsent=true'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

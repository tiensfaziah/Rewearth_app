import 'package:flutter/material.dart';

class ActionButtonsWidget extends StatelessWidget {
  const ActionButtonsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(17, 30, 17, 0),
      child: Center(
        child: SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/chatpemilik');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF6A9CFD),
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              shadowColor: Colors.black.withOpacity(0.25),
            ),
            child: const Text(
              'Chat Pemilik',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w700,
                fontFamily: 'Poppins',
              ),
            ),
          ),
        ),
      ),
    );
  }
}

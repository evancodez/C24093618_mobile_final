import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFFFF9E6), 
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                'https://130b1cc8ff38c5ad6d1c.cdn6.editmysite.com/uploads/b/130b1cc8ff38c5ad6d1cc9ccf95ea659928aaa4a936cce8b45727073eb94c9be/IMG_0338_1744970558.JPEG?width=2400&optimize=medium',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'A Taste of Who We Are',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4C7FD9), 
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Honey Veil isn’t just a bakery or a café—it’s a reflection of who we are. A family rooted in tradition.\n\n'
                    'Sisters inspired by discipline, creativity, and culture. Daughters of a mother who taught us how to create with our hands and from the heart.\n\n'
                    'Every cookie, loaf, and cup of matcha we serve carries a little bit of that story—and we’re so grateful to share it with you.',
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.5,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
